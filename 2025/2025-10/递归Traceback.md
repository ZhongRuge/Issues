# 递归 Backtracking

### Level 1：基础组合 / 排列入门（核心：会写框架 + 去重雏形）
- 子集 Subsets (LC 78)
- 子集 II Subsets II (LC 90) — 排序 + 同层去重
- 组合总和 Combination Sum (LC 39)
- 组合总和 II Combination Sum II (LC 40) — 只能用一次 + 去重
- 组合总和 III Combination Sum III (LC 216) — 限制个数 k
- 排列 Permutations (LC 46)
- 排列 II Permutations II (LC 47) — 排序 + used + 同层去重

### Level 2：结构 / 约束增强（加入合法性与切分）
- 电话号码的字母组合 Letter Combinations (LC 17)
- 括号生成 Generate Parentheses (LC 22)
- 分割回文串 Palindrome Partitioning (LC 131)
- 恢复 IP 地址 Restore IP Addresses (LC 93)
- 目标和 Target Sum (LC 494) — 可回溯/可转 DP

### Level 3：棋盘 / 二维搜索（访问标记与冲突检测）
- N 皇后 N-Queens (LC 51)
- N 皇后 II (LC 52) — 计数
- 解数独 Sudoku Solver (LC 37)
- 单词搜索 Word Search (LC 79)
- 单词搜索 II Word Search II (LC 212) — Trie + 剪枝

### Level 4：更复杂剪枝 / 组合与顺序混合
- 递增子序列 Increasing Subsequences (LC 491) — 同层 set 去重
- 重新安排行程 Reconstruct Itinerary (LC 332) — 有向图 + 字典序
- 贴纸拼词 Stickers to Spell Word (LC 691) — 回溯 + 记忆化
- 为运算表达式添加括号 Different Ways to Add Parentheses (LC 241)
- 单词拆分 II Word Break II (LC 140) — DFS + Memo

### Level 5：高级 / 位压 / 大状态
- N 皇后优化（位运算版本）
- 数独优化（位掩码 + 最少候选格启发）
- 旅行商小规模 TSP（回溯 + 剪枝，对比位压 DP）
- 全排列 + 约束（例如相邻差值限制）自定义题
- 复杂组合 + Trie/位掩码混合练习

---

### 回溯模板要点（速记）
```
path = []
result = []
def dfs(state):
	if 终止条件: 收集并 return
	for choice in 当前可选集合:
		if 剪枝(choice): continue
		做选择 (path.push / 标记)
		dfs(新状态)
		撤销选择 (path.pop / 取消标记)
```

### 常见剪枝分类
- 同层去重：排序后 if (i>0 && nums[i]==nums[i-1] && !used[i-1]) continue
- 目标超过/不足：当前和 + 最小可能 > target 或 最大可能 < target 则剪
- 结构约束：括号数量、棋盘列/对角线占用、Trie 前缀不存在
- 选择顺序：组合问题索引递增避免重复排列

### 建议练习顺序
1. Subsets → Subsets II → Combination Sum → Combination Sum II
2. Permutations → Permutations II
3. Generate Parentheses → Palindrome Partitioning → Restore IP
4. N-Queens → Word Search → Word Search II
5. Sudoku → 进阶（Reconstruct Itinerary / Stickers / Word Break II）

（标记 ✅ 的表示已完成或已有实现，后续可在本文件逐题添加“状态定义 / 选择 / 约束 / 终止”四项小卡片。）
