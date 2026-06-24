---
name: pushdown-automaton
description: PDA — NFA with an additional unbounded stack; recognizes exactly the context-free languages
metadata:
  type: user
---

## definition

A **Pushdown Automaton** (PDA) is a non-deterministic finite automaton augmented with an unbounded stack. It recognizes exactly the context-free languages.

Formal definition: PDA = (Q, Σ, Γ, δ, q0, Z0, F)
- Q = finite set of states
- Σ = input alphabet
- Γ = stack alphabet
- δ = transition function: Q × (Σ ∪ {ε}) × Γ → P(Q × Γ*) (non-deterministic)
- q0 = initial state
- Z0 = initial stack symbol
- F = accepting states

**Acceptance:** either by final state (stack content irrelevant) or by empty stack.

## intuition

A DFA has finite memory = no counting power. A PDA adds an unbounded stack = can count one thing, match balanced structures, or handle one level of nesting. The stack is the critical addition that enables context-free language recognition.

## why it exists

DFAs cannot count or match nested structures. PDAs solve exactly those problems by providing a stack — push when going "in," pop when coming "out." This is why programming language syntax (with balanced braces, parentheses, function calls) can be parsed by PDAs.

## PDA ↔ CFG equivalence

Every CFL can be recognized by some PDA, AND every PDA accepts some CFL. The two models are completely equivalent:
- Given a CFG, construct a PDA (by simulating leftmost derivation)
- Given a PDA, construct a CFG

This equivalence is the fundamental theorem connecting generative (grammar) and computational (automaton) views of CFLs.

## applications

- **Programming language parsing**: LL/LR parsers implement PDA-like behavior (stack-based)
- **Balanced structure checking**: {w | w has balanced parentheses} recognized by simple PDA
- **Expression evaluation**: push operands, pop and evaluate on seeing operators
- **XML/HTML validation**: nested tag structure matches PDA recognition

## Stack Operations

| Operation | Meaning |
|-----------|---------|
| Push | Add symbol to top of stack |
| Pop | Remove symbol from top of stack |
| Replace | Pop one, push another (most common) |
| Peek | Check top without removing |

## advantages

- Recognizes all CFLs (more powerful than DFA)
- Stack gives exactly the right amount of memory for nested structures
- Direct correspondence to CFGs (can mechanically convert)

## limitations

- Cannot recognize all languages (cannot count two independent things simultaneously)
- Non-deterministic PDAs are strictly more powerful than deterministic PDAs (unlike DFA/NFA)
- Not all CFLs can be recognized by deterministic PDAs (DPDA)

## deterministic vs non-deterministic

- **DPDA**: at most one move per configuration; recognizes deterministic CFLs (DCFLs)
- **NPDA**: multiple possible moves; recognizes ALL CFLs
- Unlike finite automata: NFA = DFA in power, but NPDA ≠ DPDA in power
- Programming language parsers use DPDA (LL, LR parsers are deterministic)

## misconceptions

- PDA is NOT the same as a stack machine computer — PDAs have restricted control (finite states)
- Deterministic PDAs are STRICTLY less powerful than non-deterministic PDAs
- The course covers PDAs conceptually only — detailed PDA construction is NOT covered in this course

## related concepts

- [[context-free-language]] — exactly what PDAs recognize
- [[context-free-grammar]] — equivalent generative model
- [[dfa]] — PDAs extend DFAs with a stack
- [[parsing]] — practical implementation of PDA-based recognition
- [[ll1-parsing]] and [[lr0-parsing]] — deterministic PDA implementations
- [[chomsky-hierarchy]] — PDAs = Type 2 in the hierarchy

## examples

**PDA for {a^n b^n | n ≥ 0}:**
- Initial state q0, stack starts with Z0
- On reading 'a': push 'a' onto stack; stay in q0
- On reading 'b': pop 'a' from stack; move to q1
- In q1, on reading 'b': pop 'a'; stay in q1
- Accept when stack has only Z0 (empty stack) after all input consumed

**PDA for balanced parentheses:**
- Push '(' when seen
- Pop '(' when ')' seen
- Accept if stack empty at end of input

## exam relevance
**medium** — PDA concepts and their equivalence with CFGs; detailed PDA construction not tested deeply in this course

## project relevance
Every parser you implement (recursive descent, LL(1), LR) is fundamentally implementing a PDA. Understanding the theoretical model helps reason about what parsers can and cannot do.

---
**Scores:** Exam importance: 3/5 | Difficulty: 3/5 | Future usefulness: 4/5 | Project relevance: 4/5 | Interconnectedness: 4/5
