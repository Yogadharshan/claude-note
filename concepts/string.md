---
name: string
description: Finite sequence of symbols from an alphabet — the atomic unit that languages are composed of
metadata:
  type: user
---

## definition

A string over alphabet Σ is a finite sequence of symbols from Σ. The empty string ε (epsilon) has length 0 and contains no symbols.

- |w| = length of string w (number of symbols)
- ε has |ε| = 0

## intuition

A string is like a word written from the alphabet's letters. You can put symbols together in any order, repeat them, or use none at all (ε).

## why it exists

Strings are the elements that languages are made of. A formal language is a set of strings. Without defining strings precisely, we cannot define languages, grammar rules, or what it means for an automaton to "accept" something.

## applications

- Source code is a string over the ASCII alphabet
- DNA sequences are strings over {A, T, G, C}
- Binary data is a string over {0, 1}

## advantages

- Simple and well-defined
- Supports rich set of operations

## limitations

- Must be finite (infinite sequences are not strings in formal language theory)

## misconceptions

- ε ≠ ∅: ε is the empty string (exists, has length 0); ∅ is the empty language (contains no strings)
- A string is a sequence, not a set — order matters and repetition is allowed
- "abc" ≠ "bac" as strings even though {a,b,c} = {b,a,c} as sets

## String Operations

| Operation | Notation | Definition |
|-----------|----------|------------|
| Length | \|w\| | number of symbols |
| Concatenation | uv | u followed by v |
| Reverse | w^R | symbols in reverse order |
| Prefix | x is prefix of y | ∃z: xz = y |
| Suffix | x is suffix of y | ∃z: zx = y |
| Substring | contiguous segment of w | |

**Concatenation properties:**
- |uv| = |u| + |v|
- w · ε = ε · w = w (ε is identity for concatenation)
- Concatenation is associative: (uv)w = u(vw)

## related concepts

- [[alphabet]] — the symbol set strings are drawn from
- [[kleene-star]] — the set of all strings over Σ
- [[formal-language]] — a set of strings
- [[regular-expression]] — compact notation for string patterns

## examples

- Over Σ = {0,1}: "0", "11", "010", ε are all strings
- |"hello"| = 5
- "abc"^R = "cba"
- "ab" is a prefix of "abc"

## exam relevance
**high** — string operations (concatenation, length, reverse, prefix) frequently tested

## project relevance
String manipulation is core to all text processing, lexers, parsers, protocol implementations, and pattern matching.

---
**Scores:** Exam importance: 4/5 | Difficulty: 1/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 5/5
