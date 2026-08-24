[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [Alias("dest")]
    [string]$Dest,

    [Alias("ref")]
    [string]$Ref = "main",

    [Alias("force")]
    [switch]$Force,

    [Alias("h")]
    [switch]$Help
)

$ErrorActionPreference = 'Stop'

function Show-Usage {
    @"
Install anti-defensive-writing into an agent skills directory.

Usage:
  .\install.ps1 [-Dest <path>] [-Ref <branch/tag>] [-Force]

Options:
  -Dest, --dest <path>  Parent skills directory. Default: `${env:CODEX_HOME}\skills or ~/.codex/skills
  -Ref, --ref <ref>     Git ref to install from when downloading. Default: main
  -Force, --force       Replace an existing anti-defensive-writing directory
  -Help, -h             Show this help

Examples:
  .\install.ps1
  .\install.ps1 -Dest ~/.codex/skills
  irm https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1 | iex
  & ([scriptblock]::Create((irm https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1))) -Dest ~/.codex/skills -Force
"@
}

if ($Help) {
    Show-Usage
    exit 0
}

$Repo = "Kiterlin/anti-defensive-writing"
$SkillName = "anti-defensive-writing"
$SkillPath = "skill/anti-defensive-writing"

if (-not $Dest) {
    if ($env:CODEX_HOME) {
        $Dest = Join-Path $env:CODEX_HOME "skills"
    } else {
        $userProfile = if ($env:USERPROFILE) { $env:USERPROFILE } else { $HOME }
        $Dest = Join-Path $userProfile ".codex/skills"
    }
}

# Normalize ~ in path
if ($Dest.StartsWith("~")) {
    $userProfile = if ($env:USERPROFILE) { $env:USERPROFILE } else { $HOME }
    $Dest = Join-Path $userProfile $Dest.Substring(1).TrimStart('\', '/')
}

function Copy-SkillDir {
    param(
        [string]$SourcePath,
        [string]$TargetParentDir
    )

    $skillMd = Join-Path $SourcePath "SKILL.md"
    if (-not (Test-Path $skillMd)) {
        Write-Error "No SKILL.md found in $SourcePath"
        exit 1
    }

    if (-not (Test-Path $TargetParentDir)) {
        New-Item -ItemType Directory -Path $TargetParentDir -Force | Out-Null
    }

    $target = Join-Path $TargetParentDir $SkillName
    if (Test-Path $target) {
        if (-not $Force) {
            Write-Error "Destination already exists: $target`nUse -Force to replace it."
            exit 1
        }
        Remove-Item -Recurse -Force $target
    }

    $tempGuid = [System.Guid]::NewGuid().ToString("N")
    $staging = Join-Path $TargetParentDir ".${SkillName}.tmp.$tempGuid"

    try {
        New-Item -ItemType Directory -Path $staging -Force | Out-Null
        Copy-Item -Path "$SourcePath\*" -Destination $staging -Recurse -Force
        Rename-Item -Path $staging -NewName $SkillName
        Write-Host "Installed $SkillName to $target"
        Write-Host "Restart your agent if it loads skills only at startup."
    } catch {
        if (Test-Path $staging) {
            Remove-Item -Recurse -Force $staging -ErrorAction SilentlyContinue
        }
        throw $_
    }
}

# Check if script is run locally inside the cloned repository
$localSkillDir = $null
if ($PSScriptRoot) {
    $candidate = Join-Path $PSScriptRoot $SkillPath
    if (Test-Path (Join-Path $candidate "SKILL.md")) {
        $localSkillDir = $candidate
    }
}

if ($localSkillDir) {
    Copy-SkillDir -SourcePath $localSkillDir -TargetParentDir $Dest
    exit 0
}

# Remote install via zip download
$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) "anti-defensive-writing-install-$([System.Guid]::NewGuid().ToString('N'))"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

try {
    $zipPath = Join-Path $tempDir "source.zip"
    $zipUrl = "https://github.com/$Repo/archive/refs/heads/$Ref.zip"

    try {
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing
    } catch {
        $zipUrl = "https://github.com/$Repo/archive/$Ref.zip"
        Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing
    }

    Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

    $extractedRoot = Get-ChildItem -Path $tempDir -Directory | Where-Object { $_.Name -ne "__MACOSX" } | Select-Object -First 1
    if (-not $extractedRoot) {
        Write-Error "Failed to extract repository archive from $zipUrl"
        exit 1
    }

    $remoteSkillDir = Join-Path $extractedRoot.FullName $SkillPath
    Copy-SkillDir -SourcePath $remoteSkillDir -TargetParentDir $Dest
} finally {
    if (Test-Path $tempDir) {
        Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
    }
}
