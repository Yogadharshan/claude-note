---
name: linear-grammar
description: Right/left linear grammars generate exactly the regular languages — third equivalent representation alongside DFA and RE
metadata:
  type: user
---

## definition

**Right Linear Grammar:** every production rule has the form:
- A → xB (terminal string followed by at most one non-terminal at the END)
- A → x (terminal string only — no non-terminal)

Where x ∈ T* and A, B ∈ V.

**Left Linear Grammar:** every production rule has the form:
- A → Bx (at most one non-terminal at the START, followed by terminal string)
- A → x (terminal string only)

## intuition

Linear grammars are grammars so restricted that they can only generate regular languages. The "linear" refers to the fact that there is at most one non-terminal in each right-hand side, and it must appear at one end (left or right) — no nesting possible.

## why it exists

This is the grammar characterization of regular languages. It provides the bridge between the declarative (RE), computational (DFA), and generative (grammar) views of regular languages.

**Equivalences:**
```
Regular Expression ↔ DFA ↔ Right Linear Grammar ↔ Left Linear Grammar
```

## applications

- Theoretical: connecting grammar theory to automata theory
- Proving equivalences between grammar types and automata
- Understanding limits of regular languages from a generative perspective

## converting DFA to Right Linear Grammar

For DFA M = (Q, Σ, δ, q0, F):
1. Each state q becomes a non-terminal
2. q0 is the start symbol
3. For each transition δ(qi, a) = qj: add rule qi → a qj
4. For each accepting state qf: add rule qf → ε

## advantages

- Simple: each rule is straightforward
- Direct correspondence to DFA states and transitions
- Proves that regular languages have a grammar characterization

## limitations

- Can only generate regular languages (by definition)
- Both right and left linear generate the same class, but mixing them (general linear grammar where non-terminal can be anywhere in the middle) generates more than regular languages

## misconceptions

- A grammar with non-terminals only at one end of each rule is NOT the same as a grammar with non-terminals anywhere
- Right and left linear grammars generate the same class (both = regular), but they are different grammars
- "Linear grammar" (non-terminal anywhere in middle) is NOT the same as "right linear grammar"

## related concepts

- [[regular-language]] — linear grammars generate exactly regular languages
- [[dfa]] — equivalent computational model
- [[regular-expression]] — equivalent descriptive notation
- [[grammar]] — parent concept
- [[context-free-grammar]] — relaxes the linear restriction

## examples

**Right linear grammar for L = {a^n b | n ≥ 1}:**
- S → aS | ab

**Right linear grammar for L = {a, b}*:**
- S → aS | bS | ε

**Right linear grammar for L = {w | w ends in "ab"}:**
- S → aS | bS | aA
- A → bB
- B → ε

**Left linear grammar for L = {a^n b^n | ...}** — NOT possible! a^n b^n is not regular, so no linear grammar exists for it.

## exam relevance
**medium** — may be asked to convert DFA ↔ linear grammar or identify if a grammar is linear

## project relevance
Understanding linear grammars helps clarify why certain patterns require more than regular expressions. If you can write a right/left linear grammar for a language, it's regular and a DFA can handle it.

---
**Scores:** Exam importance: 3/5 | Difficulty: 2/5 | Future usefulness: 3/5 | Project relevance: 2/5 | Interconnectedness: 4/5
