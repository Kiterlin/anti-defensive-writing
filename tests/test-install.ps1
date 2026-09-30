#Requires -Version 7.0
$ErrorActionPreference = 'Stop'
$repo = Split-Path $PSScriptRoot -Parent
$installer = Join-Path $repo 'install.ps1'
$sourceSkill = Join-Path $repo 'SKILL.md'
$testRoot = Join-Path ([System.IO.Path]::GetTempPath()) "writing-install-test-$([guid]::NewGuid().ToString('N'))"
[System.IO.Directory]::CreateDirectory($testRoot) | Out-Null
$downloadRequests = [System.Collections.Generic.List[string]]::new()

function Assert-Payload([string]$Parent) {
    $target = Join-Path $Parent 'anti-defensive-writing'
    $items = @(Get-ChildItem -LiteralPath $target -Recurse -Force)
    if ($items.Count -ne 1 -or $items[0].Name -ne 'SKILL.md') {
        throw "Unexpected installed files in $target"
    }
    if ((Get-FileHash -LiteralPath $sourceSkill).Hash -ne (Get-FileHash -LiteralPath $items[0].FullName).Hash) {
        throw 'Installed SKILL.md differs from source.'
    }
}

# Mock only the download. All filesystem operations use native PowerShell.
$downloadMock = {
    param([string]$Uri, [string]$OutFile)
    $downloadRequests.Add($Uri)
    if ($Uri -like '*/missing-ref/*') { throw 'Simulated download failure.' }
    Copy-Item -LiteralPath $sourceSkill -Destination $OutFile
}.GetNewClosure()
Set-Item -Path Function:Invoke-WebRequest -Value $downloadMock

function Assert-Fails([scriptblock]$Action) {
    $failed = $false
    try { & $Action } catch { $failed = $true }
    if (-not $failed) { throw 'Expected an installation failure.' }
}

try {
    Push-Location $testRoot
    try {
        foreach ($dest in @('.agents/skills', '.codex/skills', '.claude/skills', 'custom path/skills')) {
            & $installer -Dest $dest
            Assert-Payload (Join-Path $testRoot $dest)
        }
        if ($downloadRequests.Count -ne 0) { throw 'Local installation unexpectedly downloaded files.' }

        $parent = Join-Path $testRoot '.claude/skills'
        $extra = Join-Path $parent 'anti-defensive-writing/old-script.ps1'
        Set-Content -LiteralPath $extra -Value 'old file'
        Assert-Fails { & $installer -Dest $parent }
        if (-not (Test-Path -LiteralPath $extra)) { throw 'Existing files were removed without -Force.' }
        & $installer -Dest $parent -Force
        Assert-Payload $parent

        & $installer -Dest $parent -Ref 'v1.0' -Force
        if ($downloadRequests[-1] -notlike '*/v1.0/SKILL.md') { throw 'Requested ref was ignored.' }
        Assert-Payload $parent

        Assert-Fails { & $installer -Dest $parent -Ref 'missing-ref' -Force }
        Assert-Payload $parent
        if (@(Get-ChildItem -LiteralPath $parent -Force).Count -ne 1) { throw 'Staging files were not cleaned.' }

        $remoteDest = Join-Path $testRoot 'remote/skills'
        $remoteInstaller = [scriptblock]::Create((Get-Content -LiteralPath $installer -Raw))
        & $remoteInstaller -Dest $remoteDest
        Assert-Payload $remoteDest
        if ($downloadRequests[-1] -ne 'https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md') {
            throw 'Remote installer must download only the root SKILL.md.'
        }
        Write-Host 'PowerShell installation checks passed.'
    } finally {
        Pop-Location
    }
} finally {
    Remove-Item -LiteralPath $testRoot -Recurse -Force
}
