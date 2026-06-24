---
name: automaton
description: Abstract machine that processes input symbol by symbol — acceptor (yes/no) or transducer (output string); foundation of computation
metadata:
  type: user
---

## definition

An **automaton** is an abstract mathematical model of a machine that:
- Reads input symbols one at a time
- Transitions between internal states based on the input
- Either **accepts or rejects** the input (acceptor) or **produces output** (transducer)

## types in Chomsky Hierarchy

| Automaton | Language Class | Memory |
|-----------|---------------|--------|
| Finite Automaton (DFA/NFA) | Regular | Finite states only |
| Pushdown Automaton (PDA) | Context-Free | Finite states + stack |
| Linear Bounded Automaton | Context-Sensitive | Finite states + bounded tape |
| Turing Machine | Recursively Enumerable | Finite states + unbounded tape |

## acceptor vs transducer

**Acceptor:** outputs accept/reject — "Is this string in the language?"
- Example: DFA checking if a string matches a regex

**Transducer:** outputs a transformed string — "What is the transformation of this string?"
- Example: Mealy machine computing binary addition

## why it exists

Automata provide the computational model — the "machine" perspective — complementing the generative (grammar) perspective. Together, automata and grammars give two equivalent views of formal languages.

## the central theme

Every language class has:
- A **grammar** (generative perspective): describes what strings belong to the language
- An **automaton** (computational perspective): decides if a given string belongs to the language

These are always equivalent within each class.

## related concepts

- [[dfa]] — deterministic finite automaton (Type 3)
- [[pushdown-automaton]] — PDA (Type 2)
- [[formal-language]] — languages recognized by automata
- [[chomsky-hierarchy]] — classifies automata by power
- [[grammar]] — complementary generative perspective
- [[linear-grammar]] — grammar equivalent of finite automaton (Type 3)
- [[context-sensitive-grammar]] — grammar for Type 1; recognized by linear bounded automaton

## exam relevance
**medium** — conceptual understanding; specific automata types are tested more deeply

## project relevance
Every software system that processes structured input uses an automaton in some form — regex engines, parsers, protocol state machines, and game AI all implement automata concepts.

---
**Scores:** Exam importance: 3/5 | Difficulty: 2/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 5/5
