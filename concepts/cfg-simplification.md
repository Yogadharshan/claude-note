---
name: cfg-simplification
description: Four methods to simplify a CFG while preserving its language — removes useless symbols, ε-productions, unit productions
metadata:
  type: user
---

## definition

**CFG Simplification** is the process of reducing a context-free grammar to an equivalent form that is simpler or more structured, without changing the language generated.

Four simplification methods (applied in order):
1. Substitution rule
2. Remove useless symbols
3. Remove ε-productions (null productions)
4. Remove unit productions

## why it exists

Raw CFGs may have redundant rules, unreachable symbols, or structural features that complicate parsing. Simplified CFGs:
- Are more efficient to parse
- Enable standard form conversions (CNF, GNF)
- Have cleaner proofs of properties

## Method 1: Substitution Rule

If A → XBY and B → G1 | G2, then replace with A → XG1Y | XG2Y.

Effectively inlines one non-terminal into another's rules. Removes an indirection but may increase the number of rules.

## Method 2: Remove Useless Symbols

**Non-generating symbols:** Non-terminals that can never derive any terminal string.
- Detection: iteratively find non-terminals that CAN generate terminal strings; rest are non-generating
- Removal: delete all rules containing non-generating symbols

**Non-reachable symbols:** Non-terminals that cannot be reached from the start symbol S.
- Detection: BFS/DFS from S through all reachable non-terminals
- Removal: delete all rules involving unreachable symbols

**Order matters:** First remove non-generating, then remove non-reachable.

## Method 3: Remove ε-Productions (Null Productions)

A → ε for A ≠ S

**Steps:**
1. Find all **nullable** non-terminals (can derive ε directly or indirectly)
2. For each rule containing nullable non-terminal(s), create new versions with the nullable symbol included and excluded
3. Remove all ε-productions (except S → ε if ε ∈ L)

**Example:**
- A → AaA, A → ε
- A is nullable
- New rules: A → AaA | Aa | aA | a (all versions of AaA with/without each A)
- Remove A → ε

## Method 4: Remove Unit Productions

A → B where A, B ∈ V (single non-terminal on right-hand side)

**Steps:**
1. Find all non-terminals reachable from A via chain of unit productions (A →* B)
2. For each such B with productions B → α (non-unit): add A → α

**Example:**
- B → A, A → small_b
- Replace: B → small_b (skip the A redirect)
- Remove B → A

## applications

- **Before converting to CNF**: must remove useless symbols, ε-productions, and unit productions first
- **Before building LL/LR parsing tables**: cleaner grammars produce cleaner tables
- **For proof purposes**: simplified grammars are easier to reason about

## advantages

- Equivalent transformation: language is preserved
- Enables conversion to Chomsky Normal Form
- Reduces grammar size and parsing complexity

## limitations

- May increase number of production rules (especially ε-production removal)
- Order of application matters
- Multiple passes may be needed (removing ε-productions can reintroduce null-derivable symbols)

## misconceptions

- Simplification does NOT change the generated language (for ε-productions: language preserved except possibly removing/keeping ε)
- Removing ε-productions does NOT make it impossible to generate ε — if S is nullable, we keep S → ε
- Unit production removal inlines non-terminals but may produce more rules, not fewer

## related concepts

- [[context-free-grammar]] — what is being simplified
- [[chomsky-normal-form]] — the target form after full simplification
- [[ambiguity-cfg]] — simplification can sometimes remove ambiguity (not guaranteed)
- [[ll1-parsing]] — cleaner grammars parse better
- [[derivation]] — simplification preserves the set of strings derivable from S

## examples

**Grammar G:**
- S → AbS | b
- A → aA | ε

**Step 1 (nullable): A is nullable**

**Step 2 (remove ε-production from A):**
- S → AbS | bS | b (add version with A absent in AbS)
- A → aA | a (add version with A absent in aA)

**Step 3 (no unit productions to remove)**

**Result:**
- S → AbS | bS | b
- A → aA | a

Same language: strings of the form (a*b)+ — any number of optional a's before each b, with at least one b.

## exam relevance
**high** — step-by-step simplification is commonly asked; must show each method's effect on the grammar

## project relevance
Parser generators automatically simplify grammars. Understanding manual simplification helps debug parser conflicts and optimize hand-written grammars for tools like ANTLR or yacc.

---
**Scores:** Exam importance: 4/5 | Difficulty: 4/5 | Future usefulness: 3/5 | Project relevance: 3/5 | Interconnectedness: 4/5
