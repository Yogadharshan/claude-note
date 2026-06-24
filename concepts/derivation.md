---
name: derivation
description: Sequential application of grammar production rules from S to a terminal string — leftmost and rightmost derivations correspond to top-down/bottom-up parsing
metadata:
  type: user
---

## definition

A **derivation** in a CFG G = (V, T, S, P) is a sequence of sentential forms:
S = α0 ⟹ α1 ⟹ α2 ⟹ ... ⟹ αn = w

Where each step αi ⟹ αi+1 replaces one non-terminal in αi with the right-hand side of a production rule.

**Sentential form:** any string in (V ∪ T)* reachable from S — may contain both variables and terminals.

## types of derivation

**Leftmost derivation (⟹_lm):** always replace the leftmost non-terminal in the current sentential form.

**Rightmost derivation (⟹_rm):** always replace the rightmost non-terminal.

**Any-order derivation:** replace any non-terminal.

All produce the same SET of strings (same language), but different derivation sequences.

## why it matters

1. **Leftmost derivation** corresponds to top-down parsing (LL parsers): parsers expand the leftmost non-terminal first
2. **Rightmost derivation** corresponds to bottom-up parsing (LR parsers): LR parsers reconstruct rightmost derivation IN REVERSE
3. A string has two leftmost derivations ↔ grammar is ambiguous ([[ambiguity-cfg]])

## derivation vs parse tree

- One parse tree = one leftmost derivation = one rightmost derivation
- Multiple parse trees = ambiguous grammar
- The parse tree is the "tree" form; derivation is the "sequence" form

## notation

- α ⟹ β: one step derivation (apply one rule)
- α ⟹* β: zero or more steps
- α ⟹+ β: one or more steps

## related concepts

- [[context-free-grammar]] — source of production rules
- [[parse-tree]] — visual tree form of derivation
- [[ambiguity-cfg]] — multiple leftmost derivations = ambiguous
- [[ll1-parsing]] — implements leftmost derivation
- [[lr0-parsing]] — constructs rightmost derivation in reverse

## examples

**Grammar:** S → AB, A → aA | a, B → b

**String "aab" — leftmost derivation:**
S ⟹ AB (replace S with AB)
⟹ aAB (replace A — leftmost — with aA)
⟹ aaB (replace A with a)
⟹ aab (replace B with b)

**Same string — rightmost derivation:**
S ⟹ AB
⟹ Ab (replace B — rightmost — with b)
⟹ aAb (replace A — now rightmost non-terminal — with aA)
⟹ aab (replace A with a)

Both produce "aab" but in different orders.

## exam relevance
**high** — writing leftmost/rightmost derivation steps is a common exam question

## project relevance
Understanding derivation helps reason about how parsers work: LL parsers expand (apply rules), LR parsers reduce (reverse rules). Knowing which derivation a parser constructs helps debug parsing issues.

---
**Scores:** Exam importance: 4/5 | Difficulty: 2/5 | Future usefulness: 4/5 | Project relevance: 4/5 | Interconnectedness: 5/5
