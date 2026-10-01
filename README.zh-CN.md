<div align="center">

# Anti-Defensive Writing（反防御性写作）
### 面向学术论文与专业文本的主动断言与严谨校准框架

[![规范文档: SKILL.md](https://img.shields.io/badge/%E8%A7%84%E8%8C%83%E6%96%87%E6%A1%A3-SKILL.md-blue.svg?style=flat-square)](SKILL.md)
[![开源协议: MIT](https://img.shields.io/badge/%E8%AE%B8%E5%8F%AF%E8%AF%81-MIT-green.svg?style=flat-square)](LICENSE)
[![Agent: Codex](https://img.shields.io/badge/Agent-Codex-000000.svg?style=flat-square&logo=openai)](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills)
[![Agent: Claude Code](https://img.shields.io/badge/Agent-Claude%20Code-d97706.svg?style=flat-square&logo=anthropic)](https://code.claude.com/docs/en/skills#choose-where-skills-load)
[![运行环境](https://img.shields.io/badge/%E6%94%AF%E6%8C%81%E5%B9%B3%E5%8F%B0-macOS%20%7C%20Linux%20%7C%20Windows-lightgrey.svg?style=flat-square)](#快速安装--quickstart)
[![语言支持](https://img.shields.io/badge/%E8%AF%AD%E8%A8%80-English%20%7C%20%E4%B8%AD%E6%96%87-blueviolet.svg?style=flat-square)](#)

<p align="center">
  <a href="#摘要--abstract"><b>摘要</b></a> •
  <a href="#核心原则--core-principles"><b>核心原则</b></a> •
  <a href="#对比矩阵--comparative-analysis"><b>对比矩阵</b></a> •
  <a href="#重写管线--rewrite-pipeline"><b>重写管线</b></a> •
  <a href="#快速安装--quickstart"><b>快速安装</b></a> •
  <a href="#调用指南--agent-interface"><b>调用指南</b></a> •
  <a href="#案例库--case-studies"><b>案例库</b></a> •
  <a href="#引用--citation"><b>BibTeX</b></a>
</p>

<p align="center">
  <a href="README.md"><b>English</b></a> | <b>简体中文</b>
</p>

---

<p align="center">
  <img src="assets/anti-defensive-writing-zh-CN.png" width="92%" alt="反防御性写作范式" />
</p>
<p align="center">
  <em><b>图 1：反防御性写作的核心范式。</b> 彻底剥离前置道歉、重复免责与层叠对冲，恪守实证边界与真实不确定性，使学术与专业表达直接、从容、有力。</em>
</p>

</div>

---

## 摘要 / Abstract

> **摘要** — 学术论文、科研基金申请书与专业技术文本的表达力度，常被广泛存在的**防御性写作（Defensive Writing）**所严重削弱：作者习惯性采用前置道歉、重复免责声明、层叠模态对冲词（Modal Hedges）以及自我贬低式铺垫。这些写法虽意在规避审稿人可能的潜在质疑，却在实践中稀释了实证发现的强度，遮蔽了研究的核心创新贡献。
>
> **Anti-Defensive Writing（反防御性写作）** 构建了一套可供大模型与智能体执行的系统性规则框架：在坚决捍卫方法学严谨性、实证范围与安全法律底线的前提下，系统性诊断并剔除文字中的防御性认知开销；将“消极推诿式限定”重构为“正向范围界定”，并将不确定性精准锚定至可检验的实验事实。本框架帮助研究人员与技术创作者以从容客观的学术权威姿态，呈现高信噪比的主线论述。

完整技术规则与多语言规范详见 [**SKILL.md**](SKILL.md)（依次包含英文核心规则、英文扩充规则、中文核心规则与中文扩充规则）。

---

## 核心原则 / Core Principles

本框架确立了四大支撑基石，指导从防御性回避走向主动性实证论证：

| 原则维度 | 学术姿态 | 操作准则 |
| :--- | :--- | :--- |
| **🎯 观点直接前置** | 主动·清晰 | 段落与贡献陈述直接以实证发现和理论论点破题，坚决杜绝以局限性或退让性从句作为开头。 |
| **📐 正向界定范围** | 建设性·有界 | 明确陈述本研究**具体分析、测试与解释了什么**，彻底摒弃习惯性的“我们并不声称……”否定句式。 |
| **⚖️ 精准校准不确定性** | 严谨·客观 | 严格区分必要的方法局限与怯懦的词汇堆叠（如“或许可能潜在提示”）；不确定性必须直接溯源至具体的研究设计边界。 |
| **🏗️ 篇章结构解耦** | 模块化·聚焦 | 真实的方法局限归位至专门章节（方法、讨论或局限），避免在摘要、引言、贡献点与结论中反复稀释主线。 |

---

## 对比矩阵 / Comparative Analysis

下表展示了学术写作中典型防御性表达与应用 **Anti-Defensive Writing** 范式后的重构对比：

| 表达维度 | 传统防御性草稿（❌） | 反防御性重构范式（✅） | 认知增益与修辞机制 |
| :--- | :--- | :--- | :--- |
| **引言破题** | “虽然解决平台治理的长期争端显然超出了本项初步探索的范围，但或许可以谨慎地指出……” | “算法内容治理显著重塑了在线社区的用户参与生态。” | **直击核心事实**：破除虚泛铺垫与免责前缀，第一时间建立读者认知锚点。 |
| **研究范围界定** | “我们并不声称本研究所选取的案例能够代表所有区域的城市治理环境。” | “本文重点分析 2015 至 2023 年间三种不同制度环境下的城市治理案例。” | **正向边界界定**：以确定的时空与制度条件界定范围，替代消极自我贬低。 |
| **不确定性与对冲** | “这些实验结果在某种程度上或许可能潜在提示 $X$ 对 $Y$ 具有一定影响。” | “实验证据表明，在所观测的条件下 $X$ 对 $Y$ 产生显著影响。” | **剔除层叠对冲**：压缩冗余模态动词，将结论严格锚定于已验证的观测事实。 |
| **指标与权衡呈现** | “该模型的准确率相对较低（89% 对比基线的 90%），表明本方法仍存在明显局限。” | “该方法将推理延迟从 100 ms 显著降低至 60 ms，准确率为 89%（基线为 90%）。” | **客观陈述权衡**：客观呈现系统在 Pareto 前沿上的性能取舍，避免将合理代价病理化。 |
| **中文仪式化谦辞** | “本文仅在两个数据集上做了初步尝试，所获结论只能提供非常有限的参考。” | “本文在两个标准基准数据集上系统评估了该方法的性能表现。” | **确立专业文风**：剔除习惯性客套与自轻表达，以平实严谨的口吻呈现工作事实。 |

---

## 重写管线 / Rewrite Pipeline

遵循技能规约的重写过程遵循严密的 5 阶段算法工作流：

```
┌────────────────────────────────────────────────────────┐
│               输入：包含防御性赘述的学术初稿              │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  阶段 1：功能诊断（Functional Diagnosis）              │
│  识别句子属性：非必要免责 / 必要范围界定 / 方法学真实局限  │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  阶段 2：剔除修剪（Disclaimer Pruning）                │
│  坚决删除无法增加证据、逻辑与认知价值的前置铺垫与道歉     │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  阶段 3：正向投射（Positive Projection）               │
│  将“非 X 否定句”重塑为清晰的“专注 Y 正向主张”           │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  阶段 4：不确定性校准（Uncertainty Calibration）        │
│  剥离层叠对冲（或许/可能/潜在），将疑问锚定至具体设计边界 │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│  阶段 5：结构对齐（Structural Realignment）             │
│  以强主题句重筑段落主线，真实限制归入专门章节统一呈现     │
└───────────────────────────┬────────────────────────────┘
                            │
                            ▼
┌────────────────────────────────────────────────────────┐
│          输出：直接、从容、高信噪比的学术正文            │
└───────────────────────────┘
```

---

## 快速安装 / Quickstart

### 极简部署架构

安装过程设计为**单文件、零侵入、零依赖**。智能体技能目录仅部署单个核心规则文件：

```text
<技能目录>/
└── anti-defensive-writing/
    └── SKILL.md
```

> **零运行时环境依赖**：安装脚本直接流式拉取 `SKILL.md`，不会下载仓库源码包，亦不会在技能目录残留 README、安装脚本、图片、测试文件或智能体配置。无需 Git、Python、Node.js、编译工具链或任何包管理器。

### 支持目录矩阵

| 目标智能体 | 全局（用户级）安装目录 | 局部（项目级）安装目录 |
| :--- | :--- | :--- |
| **Codex**（官方最新推荐） | `~/.agents/skills` | `.agents/skills` |
| **Codex**（旧版规范） | `~/.codex/skills` | `.codex/skills` |
| **Claude Code** | `~/.claude/skills` | `.claude/skills` |

*注：`~` 代表当前用户主目录。相对路径从执行命令的目录开始计算；若要在当前项目中生效，请在项目根目录下执行。*

---

### macOS / Linux / WSL 安装

根据所使用的智能体，在终端中**任选一条命令**运行：

#### 标准 Codex 环境（`~/.agents/skills`）
```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills"
```

#### 旧版 Codex 环境（`~/.codex/skills`）
```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.codex/skills"
```

#### Claude Code 环境（`~/.claude/skills`）
```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.claude/skills"
```

*若仅需安装在当前项目，将目标路径改为相对路径即可，例如 `--dest ".agents/skills"` 或 `--dest ".claude/skills"`。*

---

### Windows 安装

在 Windows 上打开 **PowerShell 7**（`pwsh`），设置 `$skillsDir` 并执行：

```powershell
$skillsDir = "$HOME/.agents/skills"
$installSkill = [scriptblock]::Create((Invoke-RestMethod 'https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1'))
& $installSkill -Dest $skillsDir
```

*如需配置其他环境，可将 `$skillsDir` 改为 `"$HOME/.codex/skills"` 或 `"$HOME/.claude/skills"`；项目级安装在根目录使用 `".agents/skills"` 即可。安装逻辑在内存中运行，不留存临时脚本。*

---

### 升级与版本固定

已有安装默认受到保护，不会被静默篡改。添加 `--force`（Shell）或 `-Force`（PowerShell）可执行原子替换。若网络下载中断，现有文件完好无损。

```sh
# Shell：强制更新到最新主分支版本
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills" --force

# Shell：固定安装特定提交哈希、标签或分支
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills" --ref <commit-hash>
```

```powershell
# PowerShell：强制覆盖升级
& $installSkill -Dest $skillsDir -Force

# PowerShell：指定版本引用
& $installSkill -Dest $skillsDir -Ref <commit-hash> -Force
```

### 手动安装

无需脚本即可纯手动配置：在目标技能路径下建立 `anti-defensive-writing` 目录，将原始 [**SKILL.md**](https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md) 保存为该目录下的 `SKILL.md` 即可：

```sh
mkdir -p ~/.agents/skills/anti-defensive-writing
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md -o ~/.agents/skills/anti-defensive-writing/SKILL.md
```

---

## 调用指南 / Agent Interface

安装完成后，在智能体对话中直接唤醒：

### Codex CLI
```text
$anti-defensive-writing 修改下面的段落，删掉多余的防御性表达，保留必要限定，不增加原文没有的事实。
```

### Claude Code CLI
```text
/anti-defensive-writing 修改下面的段落，删掉多余的防御性表达，保留必要限定，不增加原文没有的事实。
```

### 网页对话界面（ChatGPT / Claude / Gemini）
对于无法直接读取本地文件系统的 Web 网页端，可直接将 [SKILL.md](SKILL.md) 作为 Prompt 设定或上下文上传附加。

### 学术场景推荐 Prompt 模板

<details>
<summary><b>模板 1：论文引言与破题段落重构</b></summary>

```text
$anti-defensive-writing 重构以下论文引言段落。去除开篇的退缩式辩解，将否定性排除转换为正向的研究范围界定，确保主题句直接以我们的核心实验发现破题。
```
</details>

<details>
<summary><b>模板 2：方法论与创新贡献陈述</b></summary>

```text
$anti-defensive-writing 审核这部分学术贡献陈述。剔除过度的自我贬抑与谦辞，在完整保留真实实验适用条件的前提下，客观、平静地阐明我们在性能与算力消耗间的权衡。
```
</details>

<details>
<summary><b>模板 3：同行评审与 Rebuttal 辩驳澄清</b></summary>

```text
$anti-defensive-writing 重写这段审稿意见答复（Rebuttal）。直接依据现有观测数据回应审稿人的质疑，不主动割让未经证实的缺陷，杜绝道歉与退缩式措辞。
```
</details>

---

## 案例库 / Case Studies

仓库提供针对典型学术场景的端到端修改案例，完整收录于 [`examples/`](examples/)：

* [**论文引言案例（Academic Introduction）**](examples/academic-introduction.md)：将平台治理研究中畏缩、充满免责声明的引言重构为实证先行的有力论述。
* [**方法与贡献案例（Methods & Contributions）**](examples/methods-and-contributions.md)：以客观严谨的语气呈现核心贡献点与计算瓶颈的合理权衡。
* [**科研基金申请案例（Grant Proposal）**](examples/grant-proposal.md)：将犹豫试探的研究目标重构为论证坚实、可行性明确的学术攻坚规划。

---

## 方法学边界与严谨性公理 / Methodological Guardrails

> [!IMPORTANT]
> **反防御性写作绝非无事实依据的浮夸宣传。** 本技能坚守最严苛的学术道德底线：
>
> 1. **严禁虚构实证事实**：绝不能为了让文风显得强势有力而擅自捏造数据、基线、实验结果或机制。
> 2. **严禁相关夸大为因果**：观测性分析中的统计关联（Association）绝不可篡改为因果主张（Causation）。
> 3. **坚决保留关键限定条件**：涉及科学真实性、伦理合规、法务安全与可复现性的必要局限必须保留，并置于相应的方法或局限章节中清晰交代。

---

## 仓库全景结构 / Repository Layout

```text
anti-defensive-writing/
├── SKILL.md                         # 技能规约正文（唯一权威源）
├── skill/anti-defensive-writing/
│   └── SKILL.md                     # 供目录级安装工具读取的单文件镜像
├── README.md                        # 英文主文档与学术对比基准
├── README.zh-CN.md                  # 简体中文学术文档
├── install.sh                       # POSIX 安装脚本（macOS / Linux / WSL）
├── install.ps1                      # Windows PowerShell 7 安装脚本
├── skill.json                       # 技能包元数据与包描述
├── examples/                        # 经典学术写作重构案例库
│   ├── academic-introduction.md     # 论文引言案例
│   ├── methods-and-contributions.md # 方法与贡献案例
│   └── grant-proposal.md            # 基金申请书案例
├── assets/                          # 框架全景与技术图解
│   ├── anti-defensive-writing-en.png
│   └── anti-defensive-writing-zh-CN.png
├── tests/                           # 安装器行为测试与持续集成验证
└── LICENSE                          # MIT 开源许可证
```

*`skill/anti-defensive-writing/SKILL.md` 镜像与根目录正文始终保持一致，专供按目录抓取技能的工具使用。使用第三方安装程序时，请选择 `skill/anti-defensive-writing` 子目录。*

---

## 引用 / Citation

如果您在学术研究、论文撰写或智能体工作流中使用了 **Anti-Defensive Writing**，欢迎按如下格式引用：

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

## 开源协议 / License

本项目基于 [MIT License](LICENSE) 开源。
