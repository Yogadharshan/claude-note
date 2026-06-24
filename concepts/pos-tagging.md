---
name: pos-tagging
description: Part-of-Speech tagging — labeling words in text with their grammatical role (noun, verb, adj); foundation for NLP
metadata:
  type: user
---

## definition

**Part-of-Speech (POS) Tagging** is the process of labeling each word in a sentence with its grammatical category (noun, verb, adjective, adverb, preposition, determiner, etc.).

## example

Sentence: "The quick brown fox jumps"
Tags: Det Adj Adj N V
→ the(Det) quick(Adj) brown(Adj) fox(N) jumps(V)

## intuition

POS tagging is the "type annotation" for text. Just as a compiler assigns types to variables, a POS tagger assigns grammatical roles to words. This structural information enables higher-level NLP tasks.

## why it exists

NLP tasks need to understand sentence structure, not just individual words:
- "Run" can be a noun or verb: "a run" vs "I run"
- Grammar checking requires knowing which word is the subject, verb, object
- Machine translation needs to map grammatical structures across languages

## connection to formal language theory

POS tagging can be viewed as a **parsing problem** using CFGs:
- Define grammar: S → NP VP, NP → Det N, VP → V NP, etc.
- Parse the sentence according to the grammar
- Leaf labels in the parse tree are the POS tags
- Example: S→NP VP→ Det N V NP→ "The cat sat on the mat" with corresponding tags

## techniques for POS tagging

| Approach | Method | Characteristic |
|----------|--------|----------------|
| Rule-based | Predefined linguistic rules | Simple, may lack accuracy for complex text |
| Statistical | Hidden Markov Models (HMM), CRF | Probability-based, considers sentence context |
| Neural | LSTM, transformers (BERT) | Contextualized embeddings, state-of-the-art |

**HMM approach:** Sequence labeling problem — P(tags | words)
**Transformer approach:** Use pre-trained contextual embeddings (BERT, etc.)

## applications

- **Syntax analysis**: foundation for syntactic parsing and grammar checking
- **Named Entity Recognition (NER)**: proper nouns identified, then classified
- **Sentiment analysis**: adjectives and adverbs key to polarity
- **Machine translation**: grammatical structure alignment
- **Information retrieval**: understand word roles in queries
- **Question answering**: identify the type of answer expected

## CFG rules for sentence structure (course example)

```
S  → NP VP
NP → Det N | Det Adj N | NP PP
VP → V NP | V PP | VP PP
PP → Prep NP
Det → the | a
N  → cat | mat | elephant
V  → sat | shot | jumps
Adj → quick | brown
Prep → on | in | with
```

Parse tree of "The cat sat on the mat":
```
S → NP VP
NP → Det(the) N(cat)
VP → V(sat) PP
PP → Prep(on) NP
NP → Det(the) N(mat)
```

## ambiguity in POS tagging

Natural language is inherently ambiguous:
- "I shot an elephant in my pajamas" — did I wear pajamas or the elephant?
- Different parse trees → different POS interpretations
- Modern approaches use probabilistic models to choose the most likely parse

## limitations of CFG-based POS tagging

1. **Rigidity**: CFG rules may not cover all natural language constructs
2. **Ambiguity**: many sentences have multiple valid parse trees
3. **Complexity**: real sentences often have complex nested structures
4. **Context**: CFGs cannot handle all context-dependent agreement rules (gender, number) → requires CSG or statistical models

## related concepts

- [[context-free-grammar]] — grammar for sentence structure
- [[parse-tree]] — structural representation of tagged sentence
- [[parsing]] — process of finding grammatical structure
- [[context-sensitive-grammar]] — needed for full NL agreement rules
- [[chomsky-hierarchy]] — NL fits roughly between Type 2 and Type 1
- [[ambiguity-cfg]] — natural language sentences are frequently structurally ambiguous
- [[formal-language]] — POS tagging applies formal language theory to natural language

## exam relevance
**medium** — understanding POS tagging as a parsing problem and CFG/CSG connection

## project relevance
NLP pipelines universally include POS tagging as an early step. Understanding the formal language theory foundation helps design rule-based NLP systems and understand the limits of different approaches.

---
**Scores:** Exam importance: 3/5 | Difficulty: 2/5 | Future usefulness: 5/5 | Project relevance: 5/5 | Interconnectedness: 4/5
