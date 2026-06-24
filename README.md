<p align="center">
  <img src="assets/cover.png" alt="Anti-Defensive Writing" width="100%">
</p>

# Anti-Defensive Writing

<p align="center">
  <a href="README.zh-CN.md">中文说明</a>
</p>

<p align="center">
  <img alt="Codex Skill" src="https://img.shields.io/badge/Codex-Skill-101820">
  <img alt="Agent Skill" src="https://img.shields.io/badge/Agent-Skill-2C7A66">
  <img alt="Writing" src="https://img.shields.io/badge/Writing-Editing-D94F3D">
  <img alt="License MIT" src="https://img.shields.io/badge/License-MIT-blue">
</p>

Anti-Defensive Writing is a Codex skill for revising prose that over-protects itself: unnecessary caveats, disclaimers, hedges, apology-like framing, negative self-limiting claims, and explanations added only to preempt imagined objections.

It keeps necessary scope and methodological precision, but makes the default posture direct, confident, and claim-forward.

## Use It For

- Academic papers, essays, abstracts, introductions, contributions, discussions, and conclusions
- Grant writing, policy writing, professional reports, and technical explanations
- Drafts that should become clearer, stronger, more concise, less apologetic, or less caveated

## Example

Defensive:

> This paper is not intended to provide a comprehensive theory of platform governance, but rather to examine one specific mechanism.

Stronger:

> This paper identifies a mechanism through which platform governance reshapes participation.

## Install

### One-Line Install

For Codex, install into the default skills directory:

```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh
```

For another agent tool, pass its parent skills directory:

```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest <skills-dir>
```

Examples:

```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest ~/.codex/skills
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest ~/.local/share/agent/skills
```

### Codex Skill Installer

If your Codex has the skill-installer system skill, install directly from GitHub:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo Kiterlin/anti-defensive-writing \
  --path skill/anti-defensive-writing
```

### Ask an AI Agent to Install It

There is no universal install protocol shared by every agent tool. If your tool stores skills in a custom directory, you can ask an AI agent to install this repository for you.

Use a prompt like:

```text
Please install this skill from GitHub:
https://github.com/Kiterlin/anti-defensive-writing

Find my agent's skills directory, clone the repository, and copy skill/anti-defensive-writing into that skills directory. If my agent expects skills at the repository root, use the root SKILL.md instead. Do not copy logs, caches, or unrelated files.
```

### Manual Install

Clone the repository:

```bash
git clone https://github.com/Kiterlin/anti-defensive-writing.git
```

Install the skill into Codex:

```bash
mkdir -p ~/.codex/skills
cp -R anti-defensive-writing/skill/anti-defensive-writing ~/.codex/skills/
```

Restart Codex so the skill list reloads.

For other agent tools, copy the same directory into that tool's skills directory:

```bash
cp -R anti-defensive-writing/skill/anti-defensive-writing <skills-dir>/
```

## How to Use

1. Use `$anti-defensive-writing` to check whether your paper contains defensive writing.

   Example:

   ```text
   $anti-defensive-writing Please review my paper and list every instance of defensive writing.
   ```

2. After the AI lists all issues, review them one by one.

   Decide which issues should be revised and which limitations are necessary for research scope, methodological transparency, or accuracy.

3. Based on that analysis, use `$anti-defensive-writing` to revise the defensive paragraphs and sentences in your paper.

   Example:

   ```text
   $anti-defensive-writing Based on the issues listed above, revise these paragraphs and sentences to remove unnecessary defensive writing while preserving necessary scope and methodological limitations.
   ```

## Repository Layout

```text
.
|-- SKILL.md
|-- README.md
|-- README.zh-CN.md
|-- install.sh
|-- skill.json
|-- agents/
|   `-- openai.yaml
|-- assets/
|   `-- cover.png
`-- skill/
    `-- anti-defensive-writing/
        |-- SKILL.md
        `-- agents/
            `-- openai.yaml
```

The clean installable Codex skill is in `skill/anti-defensive-writing/`.

The repository root also includes `SKILL.md` and `agents/openai.yaml` for tools that expect a skill at the GitHub repository root.

`skill.json` provides machine-readable metadata for installers that want to discover the skill path, entrypoint, repository URL, and generic install command.

## Validate

If you have Codex's skill-creator system skill installed, validate with:

```bash
python3 ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py skill/anti-defensive-writing
```

Expected output:

```text
Skill is valid!
```

## License

MIT
