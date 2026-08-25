<p align="center">
  <img src="assets/cover.png" alt="Anti-Defensive Writing" width="100%">
</p>

<h1 align="center">Anti-Defensive Writing</h1>

<p align="center">
  <strong>Write with authority, directness, and precision.</strong><br>
  An open agent skill and prompt standard to eliminate excessive hedging, apologies, and defensive caveats in academic and professional prose.
</p>

<p align="center">
  <a href="README.zh-CN.md">🇨🇳 中文说明</a>
  ·
  <a href="#-the-problem-what-is-defensive-writing">The Problem</a>
  ·
  <a href="#-core-principles">Core Principles</a>
  ·
  <a href="#-before--after-showcase">Showcase</a>
  ·
  <a href="#-examples">Examples</a>
  ·
  <a href="#-quick-install--setup">Installation</a>
  ·
  <a href="#-how-to-use">How to Use</a>
</p>

<p align="center">
  <a href="https://github.com/Kiterlin/anti-defensive-writing/actions/workflows/ci.yml"><img alt="CI" src="https://github.com/Kiterlin/anti-defensive-writing/actions/workflows/ci.yml/badge.svg"></a>
  <a href="https://github.com/Kiterlin/anti-defensive-writing/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/Kiterlin/anti-defensive-writing?style=flat&color=yellow"></a>
  <img alt="Codex Skill" src="https://img.shields.io/badge/Codex-Skill-101820">
  <img alt="Agent Skill" src="https://img.shields.io/badge/Agent-Skill-2C7A66">
  <img alt="License MIT" src="https://img.shields.io/badge/License-MIT-blue">
</p>

---

## 🎯 The Problem: What is Defensive Writing?

When writing academic papers, research proposals, or professional briefs, authors frequently anticipate reviewer objections, misunderstandings, or edge cases by over-protecting their arguments. This leads to **defensive writing**:

- Opening contributions with self-limiting disclaimers (*"While we do not claim to solve..."*).
- Stacking weak modal hedges (*"might cautiously suggest that X could potentially..."*).
- Explaining what the paper does **not** do instead of what it **does**.
- Diluting core insights with apologetic caveats before stating evidence.

**Anti-Defensive Writing** transforms hesitant, over-caveated drafts into direct, claim-forward, and authoritative prose—while rigorously preserving necessary methodological constraints, scientific precision, and analytical boundaries.

---

## ⚖️ Common Patterns & Revision Directions

| Defensive Pattern (Discouraged) | Claim-Forward Pattern (Preferred) |
| :--- | :--- |
| **Preemptive Apology**<br>*"This paper is not intended to provide a comprehensive theory of platform governance, but rather to examine one specific mechanism."* | **Direct Contribution**<br>*"This paper identifies a mechanism through which platform governance reshapes participation."* |
| **Starting with Limitations**<br>*"While the sample is limited and cannot capture every variation, it still offers useful insights."* | **Positive Scope**<br>*"The sample captures the variation most relevant to the study's theoretical question."* |
| **Stacked Modal Hedging**<br>*"This may suggest that X could potentially influence Y."* | **Calibrated Evidence Strength**<br>*"The evidence indicates that X influences Y in these cases."* |
| **Negative Framing**<br>*"This does not mean that policy design alone determines implementation outcomes."* | **Positive Restatement**<br>*"Implementation outcomes depend on how policy design interacts with administrative capacity."* |

---

## 💡 Core Principles

1. **Lead with the Claim**: Open paragraphs with your core insight or discovery, not an anticipatory defense.
2. **Define Scope Positively**: Explicitly state what the study examines, analyzes, and contributes rather than listing what it ignores.
3. **Preserve Legitimate Precision**: Keep real constraints (sample limits, assumptions, scope bounds) in their proper analytical sections (Methods / Limitations) rather than scattering them across abstracts and introductions.
4. **Calibrate Evidence, Not Apologies**: Express uncertainty through objective empirical boundaries, not through timid language.

---

## 🔍 Before & After Showcase

### 1. Academic Paper Introduction

> **Defensive:**<br>
> *Although this modest inquiry cannot resolve longstanding debates in platform governance, automated keyword filtering might potentially reduce voluntary replies by 14% among active contributors.*
>
> **Claim-forward:**<br>
> *Automated keyword filtering reduces voluntary replies among active contributors by 14%.*

### 2. Methodological Innovation

> **Defensive:**<br>
> *We do not claim SparseBlock is superior in all benchmarks, but it might provide a modest 2.4× throughput improvement on standard 32k-token tests.*
>
> **Claim-forward:**<br>
> *On standard 32k-token benchmarks, SparseBlock improves throughput by 2.4×.*

### 3. Research Grant & Project Aims

> **Defensive:**<br>
> *We certainly do not expect to solve urban heat mitigation overnight, but we hope a 50-node network might perhaps provide neighborhood-scale predictions within 0.5°C.*
>
> **Claim-forward:**<br>
> *This project deploys a 50-node network to provide neighborhood-scale surface temperature predictions within 0.5°C.*

---

## 📚 Examples

Full paragraph case studies are in [`examples/`](examples/). Each draft already contains the results and constraints; the rewrite changes framing, not evidence.
- 📄 [Academic Introduction](examples/academic-introduction.md)
- 📊 [Methods & Contributions](examples/methods-and-contributions.md)
- 📝 [Grant Proposals](examples/grant-proposal.md)

---

## 🚀 Quick Install & Setup

### 1. One-Line Install (Codex & Agent CLI)

**macOS / Linux / WSL (sh):**
```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1 | iex
```

*Custom skills directory:*
```bash
# sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest <skills-dir>

# PowerShell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1))) -Dest <skills-dir>
```

---

### 2. Universal Setup for Web AI & Code Editors

#### 💬 ChatGPT / Claude Web (Custom Instructions / Projects)
Paste this into your **Custom Instructions**, **System Prompt**, or **Project Knowledge**:

```text
You are an editor using Anti-Defensive Writing.
When reviewing or revising academic or professional text:
1. Classify each defensive sentence as an unnecessary disclaimer, necessary scope condition, real methodological limitation, useful conceptual contrast, evidence-based qualification, or redundant clarification.
2. Delete disclaimers that add no evidence, scope, or necessary guidance.
3. Lead with the claim. Convert remaining limits into positive scope. Keep real constraints once, in the right place, without apology.
4. Replace hedging with precision. Do not add findings, numbers, or methods that are not in the source draft.
```

#### 💻 Cursor / Windsurf (`.cursorrules` / `.windsurfrules`)
These rules are self-contained. You do not need a `SKILL.md` in the project.

```markdown
# Anti-Defensive Writing
When writing or editing papers, proposals, or documentation:
- Advance the claim directly. Do not open with what the text does not claim or does not attempt.
- Classify caveats before deleting them. Keep limits that affect validity, interpretation, scope, design, or correct use.
- Delete disclaimers that add no evidence, scope, or necessary guidance.
- Convert remaining limits into positive scope. Replace hedging with precision.
- Do not add findings, numbers, or methods that are not in the source draft.
```

#### 🛠️ Claude Code / CLI Agents (`CLAUDE.md`)
```markdown
## Writing Style
- Apply Anti-Defensive Writing: lead with the claim, delete unnecessary disclaimers, and keep real methodological limits once, calmly.
- Do not add findings that are not in the source draft.
```

---

## 📖 How to Use

Work in two model passes. Between them, check which limits must stay.

`$anti-defensive-writing` is a **skill-loader prefix** (Codex, Claude Code, and similar). If you pasted the prompt into ChatGPT, Claude web, Cursor, or Windsurf, send the same requests as ordinary messages—do not add that prefix.

### Pass 1 — Classify

```text
Review this draft. Classify each defensive sentence as an unnecessary disclaimer, necessary scope condition, real methodological limitation, useful conceptual contrast, evidence-based qualification, or redundant clarification. List hedges that weaken the claim without adding accuracy.
```

Skill installed: prefix with `$anti-defensive-writing`. Prompt pasted: send as a normal message.

### Pass 2 — Check the list

Keep a limitation when it affects validity, interpretation, scope, research design, or the reader's ability to use the result correctly. Delete the rest.

### Pass 3 — Rewrite

```text
Based on the classification above, rewrite these paragraphs so they are direct and claim-forward. Keep necessary methodological limits. Do not add findings, numbers, or methods that are not in the draft.
```

Skill installed: prefix with `$anti-defensive-writing`. Prompt pasted: send as a normal follow-up.

---

## 📂 Repository Layout

```text
.
|-- SKILL.md                 # Primary skill definition & prompt rules
|-- README.md                # English documentation
|-- README.zh-CN.md          # Chinese documentation
|-- install.sh               # Unix installation script
|-- install.ps1              # Windows PowerShell installation script
|-- skill.json               # Package metadata for skill package managers
|-- agents/
|   `-- openai.yaml          # Agent configuration
|-- assets/
|   `-- cover.png            # Banner cover image
|-- examples/                # Real-world paragraph case studies
|   |-- academic-introduction.md
|   |-- grant-proposal.md
|   `-- methods-and-contributions.md
`-- skill/
    `-- anti-defensive-writing/
        |-- SKILL.md         # Mirrored clean installable skill
        `-- agents/
            `-- openai.yaml
```

---

## 🧪 Validation

Verify skill metadata and mirror consistency:

```bash
# JSON validation
python3 -c "import json; json.load(open('skill.json'))"

# Mirror consistency check
diff -u SKILL.md skill/anti-defensive-writing/SKILL.md
diff -u agents/openai.yaml skill/anti-defensive-writing/agents/openai.yaml
```

---

## 📄 License

Distributed under the [MIT License](LICENSE).
