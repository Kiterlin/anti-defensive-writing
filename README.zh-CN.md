# Anti-Defensive Writing（反防御性写作）

[English](README.md)

用于论文、项目申请和专业文本的中英文写作技能。删掉多余辩解、反复强调的局限和自我贬低，保留必要限定和证据应有的强度。

完整规则和示例见 [SKILL.md](SKILL.md)，按“英文主规则、英文补充、中文主规则、中文补充”排列。

## 安装后有什么

只安装一个文件：

```text
<技能目录>/
└── anti-defensive-writing/
    └── SKILL.md
```

安装器直接下载 `SKILL.md`，不会下载整个仓库压缩包，也不会把 README、安装脚本、图片、测试或 Agent 配置放进技能目录。无需 Git、Python、Node.js 或包管理器。macOS/Linux/WSL 使用 `sh` 和 `curl`；Windows 使用 PowerShell 7。

## 选择安装目录

| 目录用途 | 用户级：所有项目可用 | 项目级：当前项目可用 |
| --- | --- | --- |
| 当前 Codex 技能目录 | `~/.agents/skills` | `.agents/skills` |
| 旧版 Codex 技能目录 | `~/.codex/skills` | `.codex/skills` |
| Claude Code 技能目录 | `~/.claude/skills` | `.claude/skills` |

`~` 表示用户主目录。相对路径从运行安装命令的位置算起。安装到项目中时，请先进入项目根目录。

当前 [Codex 官方文档](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills)推荐 `.agents/skills`。安装器也支持[较早 Codex 文档](https://developers.openai.com/blog/eval-skills)中的 `.codex/skills`，适合仍读取该路径的版本。[Claude Code](https://code.claude.com/docs/en/skills#choose-where-skills-load) 读取 `.claude/skills`。

默认安装到 `~/.agents/skills`。按你使用的 Agent 选择目录即可。

## macOS / Linux / WSL 安装

下面三个命令**任选一个**。

### 安装到 `.agents/skills`

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills"
```

### 安装到 `.codex/skills`

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.codex/skills"
```

### 安装到 `.claude/skills`

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.claude/skills"
```

只想在当前项目使用，就改成相对路径。例如：

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest ".claude/skills"
```

同样可以换成 `.agents/skills` 或 `.codex/skills`。`--dest` 也接受其他自定义目录。

## Windows 安装

打开 **PowerShell 7**（`pwsh`），把 `$skillsDir` 设为你需要的目录，再运行：

```powershell
$skillsDir = "$HOME/.agents/skills"
$installSkill = [scriptblock]::Create((Invoke-RestMethod 'https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.ps1'))
& $installSkill -Dest $skillsDir
```

用户级安装可将 `$skillsDir` 改为 `"$HOME/.codex/skills"` 或 `"$HOME/.claude/skills"`。项目级安装则在项目根目录使用 `".agents/skills"`、`".codex/skills"` 或 `".claude/skills"`。

安装器在内存中运行，不会保存到技能文件夹。

## 更新已有安装

已有技能文件夹默认不会被覆盖。添加 `--force`（Shell）或 `-Force`（PowerShell）后，将用新的 `SKILL.md` 替换该技能文件夹，清除其中的旧文件。新文件下载并检查成功后才替换；下载失败会保留原来的安装。

```sh
curl -fsSL https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/install.sh | sh -s -- --dest "$HOME/.agents/skills" --force
```

PowerShell 可沿用安装示例中的 `$installSkill` 和 `$skillsDir`：

```powershell
& $installSkill -Dest $skillsDir -Force
```

如需指定分支、标签或提交，添加 `--ref <ref>` 或 `-Ref <ref>`。

## 手动安装

在选定的技能目录下创建 `anti-defensive-writing` 文件夹，将[原始 SKILL.md](https://raw.githubusercontent.com/Kiterlin/anti-defensive-writing/main/SKILL.md) 保存为该文件夹中的 `SKILL.md`。无需其他文件。

## 使用方法

Codex 中调用：

```text
$anti-defensive-writing 修改下面的段落，删掉多余的防御性表达，保留必要限定，不增加原文没有的事实。
```

Claude Code 中调用：

```text
/anti-defensive-writing 修改下面的段落，删掉多余的防御性表达，保留必要限定，不增加原文没有的事实。
```

也可以直接告诉 Agent 使用这个技能。安装后若未显示，重启 Agent。网页聊天工具则可以将 `SKILL.md` 粘贴或上传为写作指令。

技能包含直接表达观点、说明研究范围、减少层叠保留、固定论文主线、安排实验和处理不利结果等规则。真实的限制仍须保留，不能把相关关系改成因果关系，也不能为了写得有力而新增事实。

完整段落的修改案例见 [examples/](examples/)：[论文引言](examples/academic-introduction.md)、[方法与贡献](examples/methods-and-contributions.md)、[项目申请](examples/grant-proposal.md)。

## 仓库结构

```text
SKILL.md                         # 技能正文，修改以此为准
skill/anti-defensive-writing/
└── SKILL.md                      # 仅含正文的可安装副本
README.md / README.zh-CN.md       # 安装与使用说明
install.sh / install.ps1          # 安装入口，不进入技能目录
skill.json                       # 包元数据
examples/                        # 写作案例，不随技能安装
LICENSE                          # MIT 许可证
.github/                         # CI 与贡献模板，不随技能安装
tests/                           # 安装验证，不随技能安装
```

可安装副本与根目录的 `SKILL.md` 保持一致，供按目录安装技能的工具使用。使用其他安装器时，选择 `skill/anti-defensive-writing`，不要选择仓库根目录。

## 许可证

[MIT](LICENSE)。
