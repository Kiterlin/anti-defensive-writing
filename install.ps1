#Requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Dest,
    [string]$Ref = 'main',
    [switch]$Force,
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

if ($Help) {
    @'
Install only anti-defensive-writing/SKILL.md.

Usage:
  ./install.ps1 [-Dest DIR] [-Ref REF] [-Force]

Options:
  -Dest DIR   Parent skills directory. Default: ~/.agents/skills
  -Ref REF    Download from a branch, tag, or commit. Default: main
  -Force      Replace the existing skill folder with SKILL.md only
  -Help       Show this help

Examples:
  ./install.ps1 -Dest ~/.agents/skills
  ./install.ps1 -Dest ~/.codex/skills
  ./install.ps1 -Dest ~/.claude/skills
  ./install.ps1 -Dest .claude/skills
'@
    return
}

if (-not $Dest) {
    $Dest = Join-Path $HOME '.agents/skills'
} elseif ($Dest -eq '~') {
    $Dest = $HOME
} elseif ($Dest.StartsWith('~/') -or $Dest.StartsWith('~\')) {
    $Dest = Join-Path $HOME $Dest.Substring(2)
}
if (-not $Ref) { throw 'Ref cannot be empty.' }

$Dest = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Dest)
$skillName = 'anti-defensive-writing'
$target = Join-Path $Dest $skillName
$existing = Get-Item -LiteralPath $target -Force -ErrorAction SilentlyContinue
if ($existing -and ($existing.Attributes -band [System.IO.FileAttributes]::ReparsePoint)) {
    throw "Destination is a link: $target. Choose another directory."
}
if ($existing -and -not $Force) {
    throw "Destination already exists: $target. Use -Force to replace the skill folder."
}

[System.IO.Directory]::CreateDirectory($Dest) | Out-Null
$staging = Join-Path $Dest ".${skillName}.tmp.$([guid]::NewGuid().ToString('N'))"
[System.IO.Directory]::CreateDirectory($staging) | Out-Null

try {
    $skillFile = Join-Path $staging 'SKILL.md'
    $localSource = if ($PSScriptRoot) { Join-Path $PSScriptRoot 'SKILL.md' } else { $null }
    if ($localSource -and (Test-Path -LiteralPath $localSource -PathType Leaf) -and
        -not $PSBoundParameters.ContainsKey('Ref')) {
        Copy-Item -LiteralPath $localSource -Destination $skillFile
    } else {
        $encodedRef = [System.Uri]::EscapeDataString($Ref)
        Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/$encodedRef/SKILL.md" -OutFile $skillFile
    }
    if ((Get-Content -LiteralPath $skillFile -TotalCount 1) -ne '---') {
        throw 'Invalid SKILL.md: missing YAML frontmatter.'
    }
    # Download and validate before replacing an existing installation.
    if (Test-Path -LiteralPath $target) {
        Remove-Item -LiteralPath $target -Recurse -Force
    }
    Move-Item -LiteralPath $staging -Destination $target
    Write-Host "Installed only $target/SKILL.md"
} finally {
    if (Test-Path -LiteralPath $staging) {
        Remove-Item -LiteralPath $staging -Recurse -Force
    }
}
