---
name: anti-defensive-writing
description: Reduce defensive writing in drafts and revisions by removing unnecessary caveats, disclaimers, hedges, apology-like framing, negative self-limiting statements, and over-explanations while preserving necessary scope, accuracy, safety, legal, ethical, and methodological limits. Use when drafting or revising academic writing, papers, essays, abstracts, introductions, contribution statements, discussions, conclusions, technical explanations, grant writing, product writing, policy writing, professional reports, or any text the user wants to be clearer, stronger, more direct, more concise, more confident, less verbose, less caveated, less apologetic, or less defensive.
---

# Anti-Defensive Writing

## Core Rule

Advance the claim directly.

Say what is true, what the text argues, what the evidence shows, or what the method does. Do not default to explaining what the text does not claim, does not prove, does not imply, does not cover, or does not attempt.

Use a calm, competent authorial posture. Write as an author explaining an argument to the reader, not as an author negotiating with an imagined critic.

## Preserve Necessary Precision

Keep limitations when they are necessary for accuracy, ethics, law, safety, or methodological transparency.

A limitation is necessary when it affects:

- the validity of the claim;
- the interpretation of the evidence;
- the scope of application;
- the research design;
- the reader's ability to use the result correctly.

Write necessary limitations once, clearly and calmly. Place them in the appropriate section, usually methods, discussion, or limitations. Do not scatter them through abstracts, introductions, contribution paragraphs, topic sentences, conclusions, or executive summaries unless the limitation is essential to that exact sentence.

## Detection Checklist

Before finalizing a draft or revision, check for:

- unnecessary disclaimers;
- repeated statements of what the text does not claim;
- excessive hedging;
- caveats in high-impact positions;
- paragraphs that start with limitations;
- negative framing where positive framing would work;
- explanations added only to prevent hypothetical misunderstanding;
- self-undermining contribution statements;
- unnecessary "not X but Y" structures;
- redundant "however", "nevertheless", or "although" transitions.

Revise any item that weakens the text without improving accuracy.

## Rewrite Procedure

1. Identify the function of the defensive sentence.

Classify it as one of:

- unnecessary disclaimer;
- necessary scope condition;
- real methodological limitation;
- useful conceptual contrast;
- evidence-based qualification;
- redundant clarification.

2. Delete unnecessary disclaimers.

Remove any sentence that does not add evidence, scope, logic, conceptual precision, or necessary reader guidance.

3. Convert defensive limitation into positive scope.

Prefer:

> The analysis focuses on urban governance cases from 2015 to 2023.

Avoid:

> We do not claim that these cases are representative of all urban governance contexts.

4. Replace hedging with precision.

Prefer:

> The evidence indicates that X influences Y in these cases.

Avoid:

> This may suggest that X could potentially influence Y.

If uncertainty is real, specify its source:

> The available evidence supports this interpretation, although the design does not estimate population-level effects.

5. Rebuild the paragraph around the main point.

Ensure the paragraph has:

- a clear topic sentence;
- one main job;
- a logical sequence;
- no repeated caveats;
- no apology-like framing;
- a direct connection to the larger argument.

## Writing Principles

Lead with the claim. Start paragraphs with the point, not with a caveat.

Use positive scope. State what the text examines, explains, tests, compares, or contributes.

Strengthen with evidence, not apology. When a claim feels too broad, improve the concepts, evidence, causal logic, scope, or paragraph structure instead of adding protective caveats.

Keep one paragraph, one job. Do not mix argument, caveat, apology, exception, and clarification in the same paragraph.

Use contrast only when the contrast itself is part of the argument. Avoid reflexive "not X but Y", "rather than", "instead of", "to be clear", and "it should be noted that" structures.

## Preferred Patterns

Use patterns like:

- "This paper examines..."
- "This study shows..."
- "The analysis focuses on..."
- "The evidence indicates..."
- "This design allows..."
- "The results suggest..."
- "The central contribution is..."
- "This section explains..."
- "The argument proceeds in three steps..."
- "In this setting, X shapes Y by..."

## Discouraged Patterns

Avoid these unless they are necessary for accuracy:

- "This paper does not claim..."
- "We do not attempt to..."
- "This is not to say that..."
- "This should not be taken to mean..."
- "The goal is not X but Y..."
- "Rather than arguing X, this paper argues Y..."
- "Although this study has limitations..."
- "Of course, this does not fully capture..."
- "It is worth noting that..."
- "To be clear..."

## Examples

Defensive:

> We do not claim that these cases are representative of all contexts.

Stronger:

> The cases show how the mechanism operates across three institutional settings.

Defensive:

> This paper is not intended to provide a comprehensive theory of platform governance, but rather to examine one specific mechanism.

Stronger:

> This paper identifies a mechanism through which platform governance reshapes participation.

Defensive:

> This does not mean that policy design alone determines implementation outcomes.

Stronger:

> Implementation outcomes depend on how policy design interacts with administrative capacity.

Defensive:

> While the sample is limited and cannot capture every variation, it still offers useful insights.

Stronger:

> The sample captures the variation most relevant to the study's theoretical question.

Defensive:

> We are not arguing that this model is superior in every situation.

Stronger:

> The model is most useful when the task requires interpretable comparisons across cases.

## Final Pass

Before producing the final answer, remove any sentence that exists mainly to protect against a hypothetical objection rather than to advance the text. Deliver text that is concise, direct, confident, logically organized, and free of unnecessary disclaimers.

# Additional Rules

Use the requested language, or retain the draft's language. Apply the paper rules to paper revisions. Keep local edits local.

## Main Argument

Identify the paper's main contribution: a new capability, a new mechanism, lower cost, or better scalability.

Organize the abstract, introduction, experiments, and conclusion around it. Keep supporting contributions. Remove unrelated setup.

## Metrics and Claims

When a metric is unfavorable, check the task, evaluation conditions, and application needs.

State the specific tradeoff. Do not turn one weaker metric into a verdict on the whole method or change the evaluation criteria to avoid the result.

Given:

> Under the same test conditions, accuracy falls from 90% to 89%, and latency falls from 100 ms to 60 ms.

Prefer:

> The method reduces latency from 100 ms to 60 ms, with 89% accuracy compared with the baseline's 90%.

Avoid:

> The lower accuracy reveals limitations of the method.

## The Role of Each Experiment

Each experiment should address at least one question:

- Does the method work?
- What explains its advantage?
- Can alternative explanations be ruled out?
- Under what conditions does it apply?

Suggest combining or removing redundant presentation and moving tangential material to the supplement. Retain unfavorable results that affect the central conclusion.

When an experiment is missing, identify the unsupported claim. For example, without an ablation of module A, the gain cannot yet be attributed to A. Avoid the blanket statement “the experiments are insufficient.”

## Procedure for Unfavorable Results

1. Determine whether the result affects the central conclusion or its interpretation. Discuss results that affect the conclusion.
2. State the conditions, metric, and finding. Do not invent an explanation when the cause is unknown.
3. Check for overclaiming. Narrow or withdraw unsupported claims.
4. Check whether a local observation has been described as a general defect.
5. Place limitations in the relevant sections. Keep qualifications essential to understanding claims in the abstract and conclusion.

## Before Submission

- Remove self-criticism that adds no information.
- Narrow claims that exceed the evidence.
- Remove repeated limitation statements from the abstract and conclusion.
- Keep the central contribution clear throughout the paper.

## Review Comments and Manuscript Text

During reviewer simulation, distinguish demonstrated problems, questions needing verification, and optional additional experiments.

When revising, address problems that affect the conclusion or its interpretation. Do not turn every possible reviewer objection into a limitation in the paper.

## Chinese Patterns

Inspect habitual modesty such as “仅仅做了初步尝试,” “只能提供有限参考,” and “仍有很大提升空间.” Replace vague self-assessment with specific information about the study.

Prefer:

> 本文在两个数据集上评估该方法。

Avoid:

> 本文仅在两个数据集上做了初步尝试，只能提供有限参考。

Keep “初步,” “可能,” and “提示” when the evidence warrants them. Do not add “显著” or “全面领先” merely to sound stronger.

## English Patterns

Remove stacked hedges. Keep uncertainty warranted by the evidence. Do not turn an observed association into a causal claim.

Given:

> An observational analysis finds an association between X and Y.

Prefer:

> X is associated with Y in this observational analysis.

Avoid:

> These results may potentially suggest that X could possibly be associated with Y.

Do not mechanically delete “may,” “suggests,” or “under these conditions.” Decide from the evidence.

## Using the Examples

Examples illustrate phrasing; they do not supply facts. Do not add data, mechanisms, causal relationships, or unsupported advantages. Wording such as “three institutional settings,” “the most relevant variation,” or “most useful” requires evidence in the draft.

# 中文版：原版规则

## 核心规则

直接说清文章的观点。

说清事实是什么、文章提出了什么观点、证据表明什么、方法能做什么。不要反复解释文章没说什么、没证明什么、不意味着什么，或不打算研究什么。

语气平静、专业。把观点和理由向读者讲清楚，不必处处预防别人挑错。

## 保留必要的限定

为保证事实准确、交代清楚研究方法，以及满足伦理、法律和安全要求，必要的限定应当保留。

如果省略某项限定会影响以下内容，就应说明：

- 观点是否成立；
- 如何理解证据；
- 结论的适用范围；
- 研究设计；
- 读者能否正确使用研究结果。

必要的限制应清楚说明，通常放在方法、讨论或局限部分。不要在摘要、引言、贡献段落、段首句和结论中反复强调。某句话离开限定就会让人误解时，应保留该限定。

## 检查清单

初稿或修改稿定稿前，检查是否存在：

- 不必要的免责声明；
- 反复说明“本文并不是说……”；
- 叠加“可能”“或许”“在一定程度上”等保留措辞；
- 在摘要、段首和结论中堆放限制条件；
- 段落还没说观点，先强调不足；
- 本可直接说明研究内容，却先说不研究什么；
- 只为防备可能的误解而追加解释；
- 介绍贡献时又主动贬低其价值；
- 不必要的“不是 X，而是 Y”结构；
- 多余的“然而”“尽管如此”“虽然”等转折或让步。

如果一句话只是在示弱，没有让意思更准确，就删掉或改写。

## 修改流程

1. 判断这句话为什么要写。

看它属于哪一种：

- 不必要的免责声明；
- 必要的范围限定；
- 真实的方法局限；
- 有助于论证的概念区分；
- 根据证据作出的必要限定；
- 重复澄清。

2. 删除不必要的免责声明。

一句话如果既不提供证据，也不说明范围、推进论证、澄清概念或帮助理解，就删掉。

3. 直接说明研究范围。

优先：

> 本文分析了 2015 至 2023 年的城市治理案例。

避免：

> 我们并不认为这些案例能够代表所有城市治理情境。

4. 把话说准，减少层层保留。

优先：

> 证据表明，在这些案例中，X 会影响 Y。

避免：

> 这或许说明，X 可能在一定程度上对 Y 产生潜在影响。

如果确实存在不确定性，说明它来自哪里：

> 现有证据支持这一解释，但尚不能据此估计总体效应。

5. 围绕这段要表达的观点重新组织。

检查每一段：

- 开头是否说清观点；
- 是否围绕一件事展开；
- 前后顺序是否合理；
- 是否反复强调同一项限制；
- 是否夹杂道歉式表述；
- 是否有助于全文论证。

## 写作原则

先说观点。不要一开头就强调不足。

直接说明研究内容。说清楚文章研究、解释、检验、比较了什么，或者贡献了什么。

用证据支持观点。结论说得太大，就缩小范围；概念不清，就把概念说清；理由不足，就补充已有证据或理顺推理。不要只在后面追加一句“当然也存在局限”。

一段说清一件事。不要把论证、限制、道歉、例外和澄清都塞进同一段。

需要区分两种观点或解释差异时，再使用对比。不要习惯性地套用“不是 X，而是 Y”“与其说……不如说……”“需要澄清的是”“值得注意的是”。

## 推荐句式

- “本文研究……”
- “本研究表明……”
- “本文重点分析……”
- “证据表明……”
- “该设计可以……”
- “结果提示……”
- “主要贡献在于……”
- “本节解释……”
- “下文分三步论证……”
- “在这些条件下，X 通过……影响 Y。”

## 应避免的句式

除非删掉会影响准确性，否则避免：

- “本文并不声称……”
- “我们并不试图……”
- “这并不是说……”
- “这不应被理解为……”
- “目标不是 X，而是 Y……”
- “本文并非论证 X，而是论证 Y……”
- “尽管本研究存在局限……”
- “当然，这并不能完全涵盖……”
- “值得注意的是……”
- “需要澄清的是……”

## 示例

防御性表达：

> 我们并不认为这些案例能够代表所有情境。

更直接：

> 这些案例展示了该机制在三种制度环境中如何运作。

防御性表达：

> 本文无意提供完整的平台治理理论，而是探讨其中一个具体机制。

更直接：

> 本文揭示了平台治理改变参与方式的一种机制。

防御性表达：

> 这并不意味着政策设计能够单独决定执行结果。

更直接：

> 执行结果取决于政策设计与行政能力的相互作用。

防御性表达：

> 虽然样本有限，无法涵盖所有差异，但仍能提供一些有用的启示。

更直接：

> 该样本涵盖了与本研究理论问题最相关的差异。

防御性表达：

> 我们并不认为该模型在所有情况下都更优。

更直接：

> 需要比较案例并解释差异时，该模型最为适用。

## 最后检查

输出前再读一遍：哪些句子只是怕别人质疑，却没有提供信息、说清范围或帮助论证？删掉这些句子，让正文简洁、直接、逻辑清楚。

# 扩充规则

按用户指定的语言输出；未指定时沿用原稿语言。修改论文时使用下述论文规则；只改一段时，处理与该段有关的内容即可。

## 核心主线

先确定论文的主要贡献：实现了什么新能力、揭示了什么新机制、降低了多少成本，或改善了哪些扩展能力。

围绕主要贡献组织摘要、引言、实验和结论。保留有助于说明主要贡献的其他成果，删去无关铺垫。

## 指标与主张

某项指标落后时，先看论文要解决什么问题、在什么条件下比较、实际使用需要什么。

说清哪个指标提高了、哪个指标下降了。不要把一个指标落后写成整个方法有问题，也不要为了回避结果更换评价标准。

已知：

> 相同测试条件下，准确率从 90% 降到 89%，延迟从 100 ms 降到 60 ms。

优先：

> 该方法将延迟从 100 ms 降至 60 ms，准确率为 89%，基线为 90%。

避免：

> 准确率较低，说明该方法仍存在一定局限。

## 实验的作用

每个实验应说明至少一件事：

- 方法是否有效；
- 优势来自哪里；
- 能否排除其他解释；
- 方法在什么条件下适用。

重复展示的结果，建议合并或精简；与主要结论关系不大的内容，可移到补充材料。会影响核心结论的不利结果必须保留。

少做一个实验，先说清哪句话因此缺少依据。例如，缺少模块 A 的消融实验，就还不能认定性能提升来自 A；不要笼统写成“实验不充分”。

## 不利结果的处理流程

1. 看这项结果是否影响核心结论或读者理解。有影响，就应讨论。
2. 写清在什么条件下，哪个指标出现了什么结果。原因不明，就不要编造解释。
3. 看结论是否说得太大。证据只支持部分情况，就缩小范围；完全不支持，就撤回结论。
4. 看是否把某个条件下的问题说成了方法的普遍缺陷。
5. 把限制放在相关章节。摘要或结论省略某个限定会让人误解时，应保留该限定。

## 投稿前检查

- 删去没有增加信息的自我否定。
- 收回或缩小证据撑不住的结论。
- 删除摘要和结论中重复出现的限制声明。
- 确认摘要、引言、实验和结论都围绕主要贡献展开。

## 审稿意见与正文

模拟审稿时，分清哪些问题已经有证据，哪些还需要核实，哪些实验只是补做会更好。

改正文时，处理确实影响结论或读者理解的问题。不要把审稿人可能提出的每个疑问，都写成论文的局限。

## 中文表达

检查“仅仅做了初步尝试”“只能提供有限参考”“仍有很大提升空间”等习惯性谦辞。直接说做了什么、发现了什么。

优先：

> 本文在两个数据集上评估该方法。

避免：

> 本文仅在两个数据集上做了初步尝试，只能提供有限参考。

“初步”“可能”“提示”确实符合研究情况时，应当保留。不要为了显得有力就加上“显著”“全面领先”。

## 英文表达

删掉重复的保留词，但不能把尚不确定的结果说成定论。只发现相关关系时，不能改写成因果关系。

已知：

> 观察性分析发现 X 与 Y 相关。

优先：

> X is associated with Y in this observational analysis.

避免：

> These results may potentially suggest that X could possibly be associated with Y.

不要机械删除 “may”“suggests”“under these conditions”。按证据判断是否需要。

## 示例的使用

示例只供参考写法，其中的事实不能直接用到用户的文章里。不要为了让句子更有力而补造数据、机制、因果关系或优势。使用“三种制度环境”“最相关的差异”“最为适用”等表述前，先确认原稿有依据。
