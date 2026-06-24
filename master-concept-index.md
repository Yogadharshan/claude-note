# Master Concept Index

> Single entry point for all concepts across all courses.
> Format: Concept | Note | Course | Priority | Key Fact

---

## Formal Languages and Applications

| Concept | Note | Priority | Key Fact |
|---------|------|----------|---------|
| Alphabet | [[alphabet]] | Low | Finite non-empty set of symbols Σ |
| Ambiguity (CFG) | [[ambiguity-cfg]] | High | ≥1 string has 2+ distinct parse trees |
| Automaton | [[automaton]] | Medium | Acceptor or transducer; 4 types in Chomsky hierarchy |
| CFG | [[context-free-grammar]] | Very High | A→α; A single non-terminal; G=(V,T,S,P) |
| CFG Simplification | [[cfg-simplification]] | High | 4 steps in order: useless→ε→unit; order critical |
| CFL | [[context-free-language]] | High | L(G) for CFG G; recognized by PDA |
| Chomsky Hierarchy | [[chomsky-hierarchy]] | High | Type 0-3; RL⊂CFL⊂CSL⊂RE |
| Chomsky Normal Form | [[chomsky-normal-form]] | High | A→BC or A→a; 2n-1 steps; enables CYK O(n³) |
| Closure Properties (CFL) | [[closure-properties-cfl]] | High | ∪✓ ·✓ *✓; ∩✗ comp✗; CFL∩Reg=CFL |
| Closure Properties (Regular) | [[closure-properties-regular]] | High | ALL operations closed; strongest closure class |
| Compiler Structure | [[compiler-structure]] | Medium | Lexer→Parser→Semantic→Backend pipeline |
| Context-Sensitive Grammar | [[context-sensitive-grammar]] | Medium | αAβ→αγβ; |RHS|≥|LHS|; handles a^nb^nc^n |
| Derivation | [[derivation]] | High | Leftmost=top-down; rightmost=bottom-up reversed |
| DFA | [[dfa]] | Very High | M=(Q,Σ,δ,q0,F); δ total deterministic function |
| DFA Minimization | [[dfa-minimization]] | High | Mark-Reduce 5-step; remove inaccessible first |
| First/Follow/Nullable Sets | [[first-follow-nullable-sets]] | Very High | Prerequisite for LL(1) table construction |
| Formal Language | [[formal-language]] | High | L⊆Σ*; any subset of strings over alphabet |
| Grammar | [[grammar]] | Very High | G=(V,T,S,P); 4 types in Chomsky hierarchy |
| Grammar Hierarchy (LL/LR) | [[grammar-hierarchy]] | High | LL(1)⊂LR(0)⊂LR(1); LR handles left recursion |
| Kleene Star | [[kleene-star]] | Medium | Σ*=all strings incl ε; Σ+=all excl ε |
| Lexical Analyzer | [[lexical-analyzer]] | High | DFA-based; longest match; dead state backtracking |
| Linear Grammar | [[linear-grammar]] | Medium | Right/left linear; exactly generates regular languages |
| LL(1) Parsing | [[ll1-parsing]] | Very High | Predictive; no backtrack; table M[A,a]; 1 lookahead |
| LR(0) Parsing | [[lr0-parsing]] | High | Bottom-up; 0 lookahead; item sets + action/goto table |
| Myhill-Nerode Theorem | [[myhill-nerode-theorem]] | High | L regular ↔ ≡_L finite index; #classes = min DFA states |
| Parse Tree | [[parse-tree]] | High | Root=S; internal=NT; leaves=terminals; one tree=one derivation |
| Parsing | [[parsing]] | High | Top-down (LL) or bottom-up (LR); membership in CFL |
| PDA | [[pushdown-automaton]] | Medium | NFA+stack; NPDA≠DPDA; recognizes all CFLs |
| POS Tagging | [[pos-tagging]] | Low | Word grammatical role labeling; CFG/CSG application |
| Pumping Lemma (CFL) | [[pumping-lemma-cfl]] | Very High | w=uvxyz; |vxy|≤p; |vy|≥1; BOTH v,y pumped |
| Pumping Lemma (Regular) | [[pumping-lemma-regular]] | Very High | w=xyz; |y|≥1; |xy|≤p; proves non-regularity |
| Recursive Descent Parsing | [[recursive-descent-parsing]] | High | NT→function; no left recursion; backtracking possible |
| Regular Expression | [[regular-expression]] | Very High | ∅,ε,a; +·*; precedence *>·>+; equiv to DFA |
| Regular Language | [[regular-language]] | Very High | RE↔DFA↔linear grammar; 3 equivalent representations |
| Shift-Reduce Parsing | [[shift-reduce-parsing]] | High | Bottom-up; Shift/Reduce/Accept/Error actions |
| String | [[string]] | Low | Finite sequence from Σ; ε=empty; |w|=length |
| Token | [[token]] | Low | (type, value) pair; output of lexical analyzer |

---

## Index Statistics

| Metric | Count |
|--------|-------|
| Total concepts | 37 |
| Very High priority | 8 |
| High priority | 18 |
| Medium priority | 7 |
| Low priority | 4 |
| Active courses | 1 (Formal Languages and Applications) |

---

## Quick Priority Reference

**Very High (study first):**
[[grammar]] · [[dfa]] · [[regular-expression]] · [[regular-language]] · [[context-free-grammar]] · [[ll1-parsing]] · [[first-follow-nullable-sets]] · [[pumping-lemma-regular]] · [[pumping-lemma-cfl]]

**High (study second):**
[[ambiguity-cfg]] · [[cfg-simplification]] · [[context-free-language]] · [[chomsky-hierarchy]] · [[chomsky-normal-form]] · [[closure-properties-cfl]] · [[closure-properties-regular]] · [[derivation]] · [[dfa-minimization]] · [[formal-language]] · [[grammar-hierarchy]] · [[lexical-analyzer]] · [[lr0-parsing]] · [[myhill-nerode-theorem]] · [[parse-tree]] · [[parsing]] · [[recursive-descent-parsing]] · [[shift-reduce-parsing]]

---

*Last updated: 2026-06-24*
