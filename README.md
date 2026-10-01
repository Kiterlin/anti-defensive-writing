<div align="center">

# Anti-Defensive Writing
### Calibrated Assertiveness & Positive Scope for Academic and Technical Prose

[![Specification: SKILL.md](https://img.shields.io/badge/Specification-SKILL.md-blue.svg?style=flat-square)](SKILL.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](LICENSE)
[![Platform: Codex](https://img.shields.io/badge/Agent-Codex-000000.svg?style=flat-square&logo=openai)](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills)
[![Platform: Claude Code](https://img.shields.io/badge/Agent-Claude%20Code-d97706.svg?style=flat-square&logo=anthropic)](https://code.claude.com/docs/en/skills#choose-where-skills-load)
[![Environment](https://img.shields.io/badge/Environment-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg?style=flat-square)](#quickstart)
[![Language](https://img.shields.io/badge/Language-English%20%7C%20%E4%B8%AD%E6%96%87-blueviolet.svg?style=flat-square)](#)

<p align="center">
  <a href="#abstract"><b>Abstract</b></a> •
  <a href="#core-principles"><b>Core Principles</b></a> •
  <a href="#comparative-analysis"><b>Comparative Analysis</b></a> •
  <a href="#rewrite-pipeline"><b>Rewrite Pipeline</b></a> •
  <a href="#quickstart"><b>Quickstart</b></a> •
  <a href="#agent-interface"><b>Agent Interface</b></a> •
  <a href="#case-studies"><b>Case Studies</b></a> •
  <a href="#citation"><b>BibTeX</b></a>
</p>

<p align="center">
  <b>English</b> | <a href="README.zh-CN.md"><b>简体中文</b></a>
</p>

---

<p align="center">
  <img src="assets/anti-defensive-writing-en.png" width="92%" alt="Anti-Defensive Writing Paradigm" />
</p>
<p align="center">
  <em><b>Figure 1: The Anti-Defensive Writing Paradigm.</b> Systematically removing premature apologies, redundant disclaimers, and layered hedges while rigorously anchoring empirical scope and methodological boundaries.</em>
</p>

</div>

---

## Abstract

> **Abstract** — Scholarly and technical communication is frequently weakened by *defensive writing*: an authorial posture characterized by pre-emptive apologies, repetitive disclaimers, stacked modal hedges, and negative self-deprecation. While intended to ward off hypothetical criticism, defensive habits dilute the empirical strength of claims and obscure core scientific contributions.
> 
> **Anti-Defensive Writing** introduces an agentic skill specification that systematically diagnoses and eliminates defensive cognitive overhead while strictly preserving methodological validity, empirical scope, and ethical/legal boundaries. By replacing defensive disclaimers with positive scope definitions and calibrating uncertainty to observed evidence, this framework enables researchers and professionals to communicate findings with authoritative clarity, structural focus, and maximum signal-to-noise ratio.

The complete operational rulebook and multilingual instructions are codified in [**SKILL.md**](SKILL.md) (comprising English Core Rules, English Extended Guidelines, Chinese Core Rules, and Chinese Extended Guidelines).

---

## Core Principles

The framework establishes four fundamental pillars for rigorous, claim-forward academic communication:

| Pillar | Academic Posture | Operational Directive |
| :--- | :--- | :--- |
| **🎯 Claim-Forward Articulation** | Assertive & Direct | Lead paragraphs and contribution sections with empirical discoveries and theoretical arguments, rather than defensive preambles. |
| **📐 Positive Scope Delimitation** | Constructive & Bounded | Define boundaries by stating what the investigation *does* analyze, test, and explain—abandoning reflexive *"We do not claim that..."* formulations. |
| **⚖️ Calibrated Uncertainty** | Rigorous & Precise | Differentiate between legitimate empirical limits and timid hedge stacking (*"may potentially suggest"*); anchor uncertainty directly to concrete design constraints. |
| **🏗️ Structural Separation of Concerns** | Modular & Cohesive | Place necessary methodological limitations in dedicated sections (Methods, Discussion, Limitations), preventing dilution of abstracts, introductions, and conclusions. |

---

## Comparative Analysis

The table below contrasts conventional defensive drafts against revisions generated under the **Anti-Defensive Writing** paradigm across standard scholarly contexts.

| Rhetorical Dimension | Conventional Defensive Draft (❌) | Anti-Defensive Paradigm (✅) | Cognitive & Rhetorical Gain |
| :--- | :--- | :--- | :--- |
| **Introduction & Hook** | *"Although it is beyond the scope of this modest preliminary inquiry to resolve platform governance debates, it might tentatively be suggested..."* | *"Algorithmic content moderation significantly reshapes user participation in online communities."* | **Immediate Empirical Focus**: Commands reader attention by stating observed phenomena without evasive preamble. |
| **Scope Delimitation** | *"We do not claim that our sample is representative of all municipal governance systems across regions."* | *"The analysis focuses on urban governance cases across three institutional jurisdictions from 2015 to 2023."* | **Positive Boundary Definition**: Conveys exact empirical boundaries without defensive self-deprecation. |
| **Uncertainty Calibration** | *"These experimental outcomes could potentially indicate that variable $X$ might possibly influence metric $Y$."* | *"The evidence indicates that $X$ influences $Y$ under the examined observational conditions."* | **Elimination of Hedge Stacking**: Replaces multi-layered modal qualifiers with calibrated, evidence-bounded assertion. |
| **Metric & Trade-off Framing** | *"The model achieved lower accuracy (89% vs. 90%), indicating clear performance shortcomings."* | *"The method reduces inference latency from 100 ms to 60 ms with 89% accuracy (compared to 90% for the baseline)."* | **Objective Trade-off Exposure**: States system trade-offs neutrally without pathologizing valid Pareto frontiers. |
| **Authorial Modesty** | *"This study merely attempts to take a minor exploratory step toward understanding..."* | *"This study establishes an empirical baseline for analyzing..."* | **Professional Authorial Posture**: Replaces ritual modesty with calm, objective scientific authority. |

---

## Rewrite Pipeline

Revising text with Anti-Defensive Writing follows a formal 5-stage transformation pipeline:

```
┌────────────────────────────────────────────────────────┐
│               Input: Defensive Academic Draft          │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  Stage 1: Functional Diagnosis                         │
│  Classify defensive units: Unnecessary Disclaimer vs.  │
│  Necessary Scope vs. Methodological Constraint         │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  Stage 2: Disclaimer Pruning                           │
│  Strip uninformative disclaimers and preemptive        │
│  apologies that contribute no empirical value          │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  Stage 3: Positive Projection                          │
│  Convert negative denials ("Not X") into               │
│  explicit positive definitions ("Focuses on Y")        │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  Stage 4: Uncertainty Calibration                      │
│  Collapse stacked modal hedges ("may potentially");    │
│  ground uncertainty in concrete observational limits   │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  Stage 5: Structural Realignment                       │
│  Anchor paragraphs with decisive topic sentences;      │
│  isolate true constraints to dedicated sections        │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│          Output: Assertive, High-Signal Paper          │
└────────────────────────────────────────────────────────┘
```

---

## Quickstart

### Deployment Footprint

The installation is engineered to be **minimal, hermetic, and zero-overhead**. Only a single specification file is deployed into your target skills environment:

```text
<skills-directory>/
└── anti-defensive-writing/
    └── SKILL.md
```

> **Zero Runtime Dependencies**: The installer streams `SKILL.md` directly. It does not clone repository archives, nor does it install README files, scripts, images, test suites, or auxiliary configurations. It requires no Git, Python, Node.js, compilation toolchains, or package managers.

### Supported Environments

| Target Environment | Global (User-Level) Destination | Local (Project-Level) Destination |
| :--- | :--- | :--- |
| **Codex** (Recommended) | `~/.agents/skills` | `.agents/skills` |
| **Codex** (Legacy Runtime) | `~/.codex/skills` | `.codex/skills` |
| **Claude Code** | `~/.claude/skills` | `.claude/skills` |

*Note: `~` denotes your user home directory. Relative paths resolve from the execution directory. For project-level installations, execute commands directly from the project root.*

---

### Installation via Shell (macOS / Linux / WSL)

Choose **one** command corresponding to your target agent:

#### Standard Codex (`~/.agents/skills`)
```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills"
```

#### Legacy Codex (`~/.codex/skills`)
```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.codex/skills"
```

#### Claude Code (`~/.claude/skills`)
```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.claude/skills"
```

*For project-level installation, pass a relative destination such as `--dest ".agents/skills"`, `--dest ".codex/skills"`, or `--dest ".claude/skills"`.*

---

### Installation via PowerShell 7 (Windows)

Open **PowerShell 7** (`pwsh`). Configure `$skillsDir` to your target directory, then execute:

```powershell
$skillsDir = "$HOME/.agents/skills"
$installSkill = [scriptblock]::Create((Invoke-RestMethod 'https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1'))
& $installSkill -Dest $skillsDir
```

*For alternative environments, set `$skillsDir` to `"$HOME/.codex/skills"` or `"$HOME/.claude/skills"`. For project-level scope, specify `".agents/skills"` from your project root.*

---

### Upgrades & Version Pinning

Existing installations remain untouched unless explicitly updated using `--force` (Shell) or `-Force` (PowerShell). Atomic replacement guarantees that a failed network download will never corrupt an existing installation.

```sh
# Shell: Force update to latest main
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills" --force

# Shell: Pin to specific commit, tag, or branch
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills" --ref <commit-hash>
```

```powershell
# PowerShell: Force update
& $installSkill -Dest $skillsDir -Force

# PowerShell: Pin reference
& $installSkill -Dest $skillsDir -Ref <commit-hash> -Force
```

### Manual Installation

To install manually without automated scripts, create `anti-defensive-writing` inside your chosen skills directory and save the raw [`SKILL.md`](https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md) directly:

```sh
mkdir -p ~/.agents/skills/anti-defensive-writing
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md -o ~/.agents/skills/anti-defensive-writing/SKILL.md
```

---

## Agent Interface

Once installed, invoke the skill directly inside your agent session:

### Codex CLI
```text
$anti-defensive-writing Revise these paragraphs. Remove unnecessary defensive language and preserve the evidence and necessary qualifications.
```

### Claude Code CLI
```text
/anti-defensive-writing Revise these paragraphs. Remove unnecessary defensive language and preserve the evidence and necessary qualifications.
```

### Interactive Web Interfaces (ChatGPT / Claude / Gemini)
For web-based LLM sessions without local file system access, attach or paste [SKILL.md](SKILL.md) directly as custom system instructions or context prompt.

### Recommended Prompt Patterns

<details>
<summary><b>Pattern 1: Academic Paper Introduction & Hook</b></summary>

```text
$anti-defensive-writing Refactor the following academic introduction. Eliminate apologetic preambles, replace negative exclusions with positive scope definitions, and ensure the topic sentence leads directly with our core finding.
```
</details>

<details>
<summary><b>Pattern 2: Methods & Contributions Statement</b></summary>

```text
$anti-defensive-writing Review this contributions section. Remove self-undermining modesty, preserve all true experimental scope limits, and present our empirical trade-offs without defensive justification.
```
</details>

<details>
<summary><b>Pattern 3: Peer Review & Rebuttal Clarification</b></summary>

```text
$anti-defensive-writing Rewrite this rebuttal paragraph. Directly answer the reviewer's concern using observed experimental evidence. Do not concede imaginary weaknesses or use apologetic phrasing.
```
</details>

---

## Case Studies

Empirical before-and-after transformations across common academic genres are cataloged in [`examples/`](examples/):

* [**Academic Paper Introduction**](examples/academic-introduction.md): Transforming a hesitating, apologetic opening in platform governance into an evidence-forward hook.
* [**Methods & Contributions**](examples/methods-and-contributions.md): Articulating experimental contributions and computational bottlenecks with calibrated objectivity.
* [**Grant Proposal (NSF/NIH Style)**](examples/grant-proposal.md): Reframing tentative project aims into high-conviction, feasibility-grounded scientific objectives.

---

## Methodological Guardrails

> [!IMPORTANT]
> **Anti-Defensive Writing is NOT ungrounded hype.** It enforces strict scientific integrity constraints:
>
> 1. **No Hallucination of Evidence**: The skill strictly forbids fabricating facts, metrics, baselines, or mechanisms to make a sentence sound stronger.
> 2. **No Causal Overreach**: Observational associations must never be transformed into causal assertions.
> 3. **Preservation of Essential Boundaries**: Limitations critical to validity, ethics, safety, legal compliance, or replication must be preserved and clearly stated in their appropriate sections.

---

## Repository Layout

```text
anti-defensive-writing/
├── SKILL.md                         # Authoritative skill specification (Rules of truth)
├── skill/anti-defensive-writing/
│   └── SKILL.md                     # Hermetic single-file installable payload
├── README.md                        # English documentation & benchmark overview
├── README.zh-CN.md                  # Simplified Chinese documentation
├── install.sh                       # POSIX installer (macOS / Linux / WSL)
├── install.ps1                      # Windows PowerShell 7 installer
├── skill.json                       # Agent package manifest & metadata
├── examples/                        # Academic case studies & qualitative evaluations
│   ├── academic-introduction.md     # Paper introduction case study
│   ├── methods-and-contributions.md # Methodology & contributions case study
│   └── grant-proposal.md            # Research proposal case study
├── assets/                          # Architecture schematics & figures
│   ├── anti-defensive-writing-en.png
│   └── anti-defensive-writing-zh-CN.png
├── tests/                           # Installer verification & CI regression tests
└── LICENSE                          # MIT License
```

*The mirror located at `skill/anti-defensive-writing/SKILL.md` is kept strictly identical to the root `SKILL.md` for tools requiring a directory-based skill format. When using third-party installers, point to `skill/anti-defensive-writing` rather than the repository root.*

---

## Citation

If you utilize **Anti-Defensive Writing** in your academic workflow, manuscripts, or agentic systems, please cite this work:

```bibtex
@software{antidefensivewriting2026,
  author       = {Sunlight and Contributors},
  title        = {Anti-Defensive Writing: Calibrated Assertiveness & Positive Scope for Academic and Technical Prose},
  year         = {2026},
  publisher    = {GitHub},
  journal      = {GitHub repository},
  howpublished = {\url{https://github.com/Kiterlin/anti-defensive-writing}}
}
```

---

## License

This project is licensed under the [MIT License](LICENSE).
