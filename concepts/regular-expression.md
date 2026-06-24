---
name: regular-expression
description: Compact algebraic notation for specifying regular languages using union (+), concatenation (·), and Kleene star (*)
metadata:
  type: user
---

## definition

A **regular expression** (RE) over alphabet Σ is defined inductively:

**Primitive (base) REs:**
- ∅ — denotes the empty language {}
- ε (or λ) — denotes the language {ε}
- a, for each a ∈ Σ — denotes the language {a}

**Compound REs** (if r1, r2 are REs):
- r1 + r2 — union: L(r1) ∪ L(r2)
- r1 · r2 — concatenation: L(r1) · L(r2)
- r1* — Kleene star: (L(r1))*
- (r1) — parenthesization (grouping)

## intuition

A regex is a concise pattern description. Instead of listing all valid strings, you describe the pattern they follow. Think of it as algebra: you build complex language descriptions from simple ones using three operations.

## why it exists

Specifying languages by listing strings is impossible for infinite languages. Regular expressions give a finite, readable description of potentially infinite regular languages.

## operator precedence (critical for exam)

**Highest to lowest:**
1. * (star) — binds tightest
2. · (concatenation)
3. + (union) — binds loosest

So: a + bc* = a + (b(c*)) — NOT (a+b)(c*)

Always parenthesize if unsure.

## RE ↔ DFA equivalence

A language L is regular ↔ ∃ RE for L ↔ ∃ DFA for L ↔ ∃ linear grammar for L

These three representations are interconvertible:
- RE → NFA (Thompson construction) → DFA (subset construction)
- DFA → RE (state elimination method)

## applications

- **Text search**: grep, sed, Python re module
- **Lexical analysis**: define token patterns (identifier = [a-zA-Z][a-zA-Z0-9]*)
- **Input validation**: email formats, phone numbers, dates
- **Protocol specification**: simple message pattern definitions

## advantages

- Concise and human-readable
- Directly usable in programming tools (regex libraries)
- Strong mathematical theory guarantees correctness

## limitations

- Can ONLY express regular languages (no a^n b^n, no balanced parens)
- Can become unreadable for complex patterns
- Regex libraries often add extensions (lookahead, backreferences) that go beyond formal REs

## misconceptions

- Programming "regexes" (PCRE) are more powerful than formal REs (backreferences can match non-regular patterns)
- r* means ZERO or more; r+ means one or more (r+ = rr*)
- ∅ ≠ ε: ∅ is the empty language RE; ε is the empty string RE
- (a+b)* ≠ a* + b*: the first matches any mix; the second only matches all-a or all-b strings

## related concepts

- [[formal-language]] — RE describes a formal language
- [[regular-language]] — exactly what REs can express
- [[dfa]] — equivalent computational model
- [[kleene-star]] — the * operation
- [[lexical-analyzer]] — REs define token patterns

## examples

Over Σ = {a, b}:
- a* = {ε, a, aa, aaa, ...}
- ab* = {a, ab, abb, abbb, ...}
- (a+b)* = Σ* = all strings
- (a+b)*abb = strings ending in "abb"
- a*b*a* = strings with a block of a's, then b's, then a's
- (aa)* = strings with even number of a's

Precedence example:
- a+bc* = a + (b · (c*)) = {"a"} ∪ {bc^n | n≥0}
- NOT (a+b)(c*) which would give {ac^n, bc^n | n≥0}

## exam relevance
**very high** — writing REs and identifying RE-language pairs are staple exam questions

## project relevance
Every text processing task uses regex. Understanding the formal definition helps debug complex patterns and recognize when something cannot be expressed as a regex.

---
**Scores:** Exam importance: 5/5 | Difficulty: 3/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 5/5
