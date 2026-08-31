<p align="center">
  <img src="assets/cover-zh-cn.png" alt="Anti-Defensive Writing" width="100%">
</p>

<h1 align="center">Anti-Defensive Writing（去防御性写作）</h1>

<p align="center">
  <strong>以坚定、直接、精准的姿态写作。</strong><br>
  开源 AI Agent 技能与提示词规范，专用于消除学术论文、课题申报与专业写作中冗余的犹豫措辞、辩解式免责与消极自我限制。
</p>

<p align="center">
  <a href="README.md">🌐 English README</a>
  ·
  <a href="#-痛点解析什么是防御性写作">痛点解析</a>
  ·
  <a href="#-核心写作原则">核心原则</a>
  ·
  <a href="#-经典案例对比">案例对比</a>
  ·
  <a href="#-使用流程">使用流程</a>
  ·
  <a href="#-快速安装与接入">快速安装</a>
  ·
  <a href="#-详细案例库">案例库</a>
</p>

<p align="center">
  <a href="https://github.com/Kiterlin/anti-defensive-writing/actions/workflows/ci.yml"><img alt="CI" src="https://github.com/Kiterlin/anti-defensive-writing/actions/workflows/ci.yml/badge.svg"></a>
  <a href="https://github.com/Kiterlin/anti-defensive-writing/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/Kiterlin/anti-defensive-writing?style=flat&color=yellow"></a>
  <img alt="Codex Skill" src="https://img.shields.io/badge/Codex-Skill-101820">
  <img alt="Agent Skill" src="https://img.shields.io/badge/Agent-Skill-2C7A66">
  <img alt="License MIT" src="https://img.shields.io/badge/License-MIT-blue">
</p>

---

## 🎯 痛点解析：什么是防御性写作？

在撰写学术论文、研究提案或专业报告时，作者往往出于对审稿人批评、读者误解或边界特例的过度担忧，而在论述中层层设防。这种**防御性写作（Defensive Writing）**会导致文稿冗长、气势减弱且重点模糊：

- **以自我限制开篇**：在阐述创新前先声明无力解决的问题（如*“虽然本文无意提供完整的理论体系……”*）。
- **层叠模糊犹豫词**：连续使用 *“可能、或许、在某种程度上潜在影响……”*，大幅削弱论证力度。
- **消极否定式阐述**：频繁解释文章**不是**什么，而不是清晰阐明文章**提出**了什么。
- **分散论证重点**：在引言或结论中过早、过度堆叠道歉式免责，掩盖了核心证据与贡献。

**Anti-Defensive Writing** 帮助作者将犹豫不决的防卫性初稿转化为**论点鲜明、逻辑自信、直奔主题**的专业文本，同时严谨保留方法论、数据范畴和伦理安全所必需的客观精度。

---

## ⚖️ 常见模式与修改方向

| 常见防御性模式（不推荐） | 去防御性改写方向（推荐） |
| :--- | :--- |
| **预设辩解式免责**<br>*“本文无意提供一套完整的理论，仅探讨……”* | **直陈核心贡献**<br>*“本文阐明了治理机制重塑用户参与的具体路径。”* |
| **以局限性作为段落开篇**<br>*“尽管本研究的样本受限于 50 个节点……”* | **优先呈现核心发现**<br>*“在 50 个基准节点测试中，该系统将响应延迟降低了 34%。”* |
| **犹豫词层叠堆砌**<br>*“数据可能在某种程度上潜在暗示 X 或许影响 Y。”* | **精准定标证据力度**<br>*“实证数据表明，X 在此类场景下显著影响 Y。”* |
| **消极否定式框架**<br>*“我们并非主张单一政策即可决定最终结果。”* | **积极阐明交互机制**<br>*“政策执行效果取决于制度设计与行政能力的协同交互。”* |

---

## 💡 核心写作原则

1. **核心论点先行（Lead with the Claim）**：段落以核心发现或主张切入，拒绝以辩解性铺垫开头。
2. **正面界定范围（Positive Scope）**：直接阐明研究“分析了什么、解释了什么、对比了什么”，而非反复声明“没做什么”。
3. **保留必要精度（Preserve Precision）**：真实的方法约束、样本边界与假设条件，应客观放置于研究方法（Methods）或局限性讨论（Limitations）章节中，避免在摘要与引言中零散道歉。
4. **以证据定标，而非以道歉减压**：通过客观的数据边界与逻辑论证界定结论范围，而非依赖虚弱的犹豫词。

---

## 🔍 经典案例对比

### 1. 学术论文引言（Academic Introduction）

> **防御性写法：**<br>
> *本文无意提供一套完整的平台治理理论体系，仅旨在探讨其中的某一具体机制。*
>
> **直接有力写法：**<br>
> *本文阐明了平台治理重塑用户参与的具体机制。*

### 2. 方法创新与实验对比（Methods & Contributions）

> **防御性写法：**<br>
> *尽管我们的评估无法涵盖所有真实场景的变体，但我们试图为模型效率提升提供初步探索。*
>
> **直接有力写法：**<br>
> *在标准 32k 序列基准测试中，SparseBlock 在保持基础困惑度的同时实现了 2.4 倍的推理吞吐提升。*

### 3. 课题申报与研究目标（Grant Proposals）

> **防御性写法：**<br>
> *我们当然不期望能一举解决城市热岛效应，但我们希望该监测框架或许能为城市规划提供些许帮助。*
>
> **直接有力写法：**<br>
> *本项目通过布设 50 个微型传感节点，为城市规划提供精度达 0.5°C 的街区级地表温度预测模型。*

查看更多涵盖完整段落的典型场景修改案例，请访问 [`examples/`](examples/) 目录：
- 📄 [学术论文引言案例](examples/academic-introduction.md)
- 📊 [研究方法与创新论述案例](examples/methods-and-contributions.md)
- 📝 [课题申报与项目规划案例](examples/grant-proposal.md)

---

## 🚀 快速安装与接入

### 1. 一键安装（Codex / CLI Agent 环境）

**macOS / Linux / WSL (sh):**
```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh
```

**Windows (PowerShell):**
```powershell
irm https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1 | iex
```

*自定义目标安装路径：*
```bash
# sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest <skills-dir>

# PowerShell
& ([scriptblock]::Create((irm https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1))) -Dest <skills-dir>
```

---

### 2. Web 端与其他 Agent 快速接入

#### 💬 ChatGPT / Claude 网页端（自定义指令 / Projects）
将以下提示词复制到 **Custom Instructions（自定义指令）**、**System Prompt（系统提示词）** 或 **Project Knowledge（项目知识库）** 中：

```text
你是一位专注于「去防御性写作（Anti-Defensive Writing）」的专业编辑。
在审阅或修改学术论文及专业文档时：
1. 识别并去除防御性表达：不必要的过度免责声明、预设反驳的道歉式措辞、冗余的模态犹豫词（可能、或许、潜在）以及自我贬低的消极限制。
2. 优先陈述核心论点、创新贡献与研究发现。
3. 准确保留必要的科学严谨性、方法边界与适用范围，但将其客观置于恰当的分析语境中，而非作为辩解性铺垫。
4. 保持语言直接、清晰、有力且以论点为核心（claim-forward）。
```

#### 💻 Cursor / Windsurf 编辑器（`.cursorrules` / `.windsurfrules`）
在项目根目录的 `.cursorrules` 或 `.windsurfrules` 中添加：

```markdown
# 去防御性写作规范（Anti-Defensive Writing）
- 在撰写或修改文档、学术内容或项目方案时，避免防御性写作模式。
- 消除冗余的免责与犹豫表达，同时保留客观的技术与方法精度。
- 参考并遵循 SKILL.md 中的去防御性写作准则。
```

#### 🛠️ Claude Code / CLI Agent（`CLAUDE.md`）
在项目的 `CLAUDE.md` 中添加：

```markdown
## 写作风格指南
- 遵循去防御性写作原则（Anti-Defensive Writing）：表达直接有力，优先呈现核心贡献，避免辩解式免责与模糊的犹豫措辞。
```

---

## 📖 使用流程

### 第 1 步：诊断识别问题
调用 Agent 对草稿进行防御性写作专项审查：
```text
$anti-defensive-writing 请审查我的论文草稿，列出其中存在的防御性写作、冗余免责与过度犹豫表达。
```

### 第 2 步：审阅诊断清单
逐条查看 Agent 列出的问题清单，区分哪些属于**纯辩解式冗余**，哪些属于**必须保留的研究范畴与精度约束**。

### 第 3 步：精准重构修改
基于分析结果，让 Agent 执行去防御性重构：
```text
$anti-defensive-writing 请根据刚才列出的问题，修改这些段落和语句，去除不必要的防御性表达，同时保留必要的方法限制与客观严谨度。
```

---

## 📂 仓库结构

```text
.
|-- SKILL.md                 # 核心 Skill 规则定义与提示词标准
|-- README.md                # 英文说明文档
|-- README.zh-CN.md          # 中文说明文档
|-- install.sh               # Unix/macOS 安装脚本
|-- install.ps1              # Windows PowerShell 安装脚本
|-- skill.json               # Skill 规范元数据
|-- agents/
|   `-- openai.yaml          # Agent 配置文件
|-- assets/
|   |-- cover-en.png         # 英文封面图片
|   `-- cover-zh-cn.png      # 中文封面图片
|-- examples/                # 实战段落案例库
|   |-- academic-introduction.md
|   |-- grant-proposal.md
|   `-- methods-and-contributions.md
`-- skill/
    `-- anti-defensive-writing/
        |-- SKILL.md         # 镜像纯净版 Skill
        `-- agents/
            `-- openai.yaml
```

---

## 🧪 验证与测试

验证元数据完整性与镜像文件一致性：

```bash
# JSON 语法验证
python3 -c "import json; json.load(open('skill.json'))"

# 镜像文件一致性校验
diff -u SKILL.md skill/anti-defensive-writing/SKILL.md
diff -u agents/openai.yaml skill/anti-defensive-writing/agents/openai.yaml
```

---

## 📄 开源许可

本项目遵循 [MIT License](LICENSE) 开源协议。
