# Anti-Defensive Writing

[中文说明](README.zh-CN.md)

![Anti-Defensive Writing: remove unnecessary disclaimers, preserve necessary limits, and write more directly and clearly.](assets/anti-defensive-writing-en.png)

A Chinese and English writing skill for papers, proposals, and professional text. It removes unnecessary disclaimers, repeated caveats, and self-undermining language while keeping necessary limits and the strength of the evidence.

The rules and examples are in [SKILL.md](SKILL.md). English rules come first, followed by Chinese rules.

## What gets installed

Only this file is installed:

```text
<skills-directory>/
└── anti-defensive-writing/
    └── SKILL.md
```

The installer downloads `SKILL.md` directly. It does not download a repository archive or install README files, scripts, images, tests, or agent configuration. You do not need Git, Python, Node.js, or a package manager. On macOS/Linux/WSL, use `sh` and `curl`; on Windows, use PowerShell 7.

## Choose a directory

| Location | User installation: all projects | Project installation: current project |
| --- | --- | --- |
| Current Codex skill directory | `~/.agents/skills` | `.agents/skills` |
| Older Codex skill directory | `~/.codex/skills` | `.codex/skills` |
| Claude Code skill directory | `~/.claude/skills` | `.claude/skills` |

`~` means your home directory. Relative paths are resolved from the directory where you run the installer. For a project installation, run it from the project root.

Current [Codex documentation](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills) recommends `.agents/skills`. The installer also accepts `.codex/skills`, the location used in [earlier Codex guidance](https://developers.openai.com/blog/eval-skills); use it if your Codex version loads that directory. [Claude Code](https://code.claude.com/docs/en/skills#choose-where-skills-load) loads `.claude/skills`.

The default is `~/.agents/skills`. Choose the directory your agent reads.

## Install on macOS / Linux / WSL

Choose **one** command.

### `.agents/skills`

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills"
```

### `.codex/skills`

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.codex/skills"
```

### `.claude/skills`

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.claude/skills"
```

For the current project, use a relative destination. For example:

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest ".claude/skills"
```

Replace `.claude/skills` with `.agents/skills` or `.codex/skills` as needed. Any other directory can also be passed to `--dest`.

## Install on Windows

Open **PowerShell 7** (`pwsh`). Set `$skillsDir` to the directory you want, then run:

```powershell
$skillsDir = "$HOME/.agents/skills"
$installSkill = [scriptblock]::Create((Invoke-RestMethod 'https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1'))
& $installSkill -Dest $skillsDir
```

For another user installation, set `$skillsDir` to `"$HOME/.codex/skills"` or `"$HOME/.claude/skills"`. For the current project, use `".agents/skills"`, `".codex/skills"`, or `".claude/skills"` from the project root.

The downloaded installer runs in memory; it is not saved in the skill folder.

## Update an existing installation

An existing skill folder is left untouched unless you pass `--force` (shell) or `-Force` (PowerShell). This replaces that skill folder with only the new `SKILL.md`, removing any old files in that folder. The new file is downloaded and checked before replacement; a download failure leaves the existing installation intact.

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills" --force
```

In PowerShell, reuse `$installSkill` and `$skillsDir` from the installation example:

```powershell
& $installSkill -Dest $skillsDir -Force
```

To install a branch, tag, or commit, add `--ref <ref>` or `-Ref <ref>`.

## Manual installation

Create `anti-defensive-writing` inside your chosen skills directory. Save [the raw SKILL.md](https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md) into that folder as `SKILL.md`. Nothing else is required.

## Use the skill

In Codex:

```text
$anti-defensive-writing Revise these paragraphs. Remove unnecessary defensive language and preserve the evidence and necessary qualifications.
```

In Claude Code:

```text
/anti-defensive-writing Revise these paragraphs. Remove unnecessary defensive language and preserve the evidence and necessary qualifications.
```

You can also ask the agent to use the skill by name. If the installed skill does not appear, restart the agent. For web chat tools, paste or upload `SKILL.md` as instructions instead of installing it in a local directory.

The skill covers direct claims, positive scope, precise uncertainty, paper structure, experiment roles, and unfavorable results. It keeps necessary limitations and does not turn associations into causal claims or add facts to make a sentence stronger.

Before/after writing examples are available in [examples/](examples/): [introductions](examples/academic-introduction.md), [methods and contributions](examples/methods-and-contributions.md), and [grant proposals](examples/grant-proposal.md).

## Repository layout

```text
SKILL.md                         # Rules; source of truth
skill/anti-defensive-writing/
└── SKILL.md                      # Single-file installable mirror
README.md / README.zh-CN.md       # Installation and usage
install.sh / install.ps1          # Installers; never installed as skill files
skill.json                       # Package metadata
examples/                        # Writing examples; not installed
assets/                          # README overview images; not installed
LICENSE                          # MIT license
.github/                         # CI and contribution templates; not installed
tests/                           # Installer checks; not installed
```

The installable mirror stays identical to the root `SKILL.md` for tools that install a skill directory directly. When using another installer, select `skill/anti-defensive-writing`, rather than the repository root.

## License

[MIT](LICENSE).
