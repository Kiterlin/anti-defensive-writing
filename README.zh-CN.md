<p align="center">
  <img src="assets/cover.png" alt="Anti-Defensive Writing" width="100%">
</p>

# Anti-Defensive Writing

<p align="center">
  <a href="README.md">English README</a>
</p>

<p align="center">
  <img alt="Codex Skill" src="https://img.shields.io/badge/Codex-Skill-101820">
  <img alt="Agent Skill" src="https://img.shields.io/badge/Agent-Skill-2C7A66">
  <img alt="Writing" src="https://img.shields.io/badge/Writing-Editing-D94F3D">
  <img alt="License MIT" src="https://img.shields.io/badge/License-MIT-blue">
</p>

Anti-Defensive Writing 是一个用于减少“防御性写作”的 Codex skill。

防御性写作指文本过度预判反对意见、边界情况、读者误解、审稿批评或表达缺陷，于是加入不必要的 caveat、免责声明、犹豫表达、自我限制和过度解释。结果通常是文本变长、变弱、重点变散。

这个 skill 的目标是让文本更直接、更清楚、更有论证姿态，同时保留真正必要的范围限定、方法限制、法律伦理限制和准确性说明。

## 适用场景

- 论文、摘要、引言、贡献段、讨论、结论
- Essay、研究计划、基金申请、政策文本、专业报告
- 技术解释、产品文案、说明性文字
- 需要变得更清楚、更有力、更简洁、更少 caveat、更少道歉式语气的草稿

## 示例

防御性写法：

> This paper is not intended to provide a comprehensive theory of platform governance, but rather to examine one specific mechanism.

更强的写法：

> This paper identifies a mechanism through which platform governance reshapes participation.

## 安装

### 一行安装

安装到 Codex 默认 skills 目录：

```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh
```

安装到其他 agent 工具时，传入它的 skills 父目录：

```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest <skills-dir>
```

示例：

```bash
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest ~/.codex/skills
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest ~/.local/share/agent/skills
```

### 使用 Codex Skill Installer

如果你的 Codex 带有 `skill-installer` 系统 skill，可以直接从 GitHub 安装：

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo Kiterlin/anti-defensive-writing \
  --path skill/anti-defensive-writing
```

### 让 AI 帮你安装

目前不同 agent 工具没有统一的 skill 安装协议，也没有所有工具都共同支持的安装脚本。很多工具只是约定一个本地 skills 目录，并要求把 skill 文件夹复制进去。

如果你不确定自己的工具把 skills 放在哪里，可以直接让 AI 帮你安装。给它这个提示：

```text
请帮我从 GitHub 安装这个 skill：
https://github.com/Kiterlin/anti-defensive-writing

请先判断我当前 agent 工具的 skills 目录在哪里，然后 clone 这个仓库，把 skill/anti-defensive-writing 复制到对应的 skills 目录。如果这个工具要求 skill 位于仓库根目录，就使用仓库根目录的 SKILL.md。不要复制 logs、cache 或无关文件。
```

### 手动安装

克隆仓库：

```bash
git clone https://github.com/Kiterlin/anti-defensive-writing.git
```

安装到 Codex：

```bash
mkdir -p ~/.codex/skills
cp -R anti-defensive-writing/skill/anti-defensive-writing ~/.codex/skills/
```

安装到其他 agent 工具：

```bash
cp -R anti-defensive-writing/skill/anti-defensive-writing <skills-dir>/
```

安装后重启 agent，让它重新加载 skills。

## 使用方法

1. 使用 `$anti-defensive-writing` 审查论文是否存在防御性写作。

   示例：

   ```text
   $anti-defensive-writing 请审查我的论文，列出其中存在的防御性写作问题。
   ```

2. AI 列出所有存在的问题后，先逐条过目一遍。

   重点确认哪些问题确实需要修改，哪些限制说明属于研究范围、方法透明度或论证准确性所必需的内容。

3. 根据以上分析，使用 `$anti-defensive-writing` 修改论文中存在防御性写作的段落和语句。

   示例：

   ```text
   $anti-defensive-writing 请根据刚才列出的问题，修改这些段落和语句，去掉不必要的防御性写作，同时保留必要的研究范围和方法限制。
   ```

## 仓库结构

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

干净的可安装 skill 位于 `skill/anti-defensive-writing/`。

仓库根目录也保留了 `SKILL.md` 和 `agents/openai.yaml`，供只识别 GitHub 仓库根目录的 agent 工具使用。

`skill.json` 是机器可读 metadata，记录 skill 路径、入口文件、仓库地址和通用安装命令。

## 校验

如果你本地有 Codex 的 `skill-creator` 系统 skill，可以运行：

```bash
python3 ~/.codex/skills/.system/skill-creator/scripts/quick_validate.py skill/anti-defensive-writing
```

预期输出：

```text
Skill is valid!
```

## License

MIT
