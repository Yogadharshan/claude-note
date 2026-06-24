# Concept Index — Formal Languages
> Alphabetical. Find any concept in under 5 seconds.

| Concept | Note | Exam Priority | Key Fact |
|---------|------|--------------|----------|
| Alphabet Σ | [[alphabet]] | Low | Finite non-empty set of symbols |
| Ambiguity (CFG) | [[ambiguity-cfg]] | High | ≥1 string has 2 parse trees |
| Automaton | [[automaton]] | Low | Abstract machine: acceptor or transducer |
| CFG | [[context-free-grammar]] | Very High | A→α; A is single non-terminal |
| CFG Simplification | [[cfg-simplification]] | High | 4 steps: useless→null→unit; order matters |
| CFL | [[context-free-language]] | High | L(G) for some CFG; recognized by PDA |
| Chomsky Hierarchy | [[chomsky-hierarchy]] | High | Type 0-3; Regular ⊂ CFL ⊂ CSL ⊂ RE |
| Chomsky Normal Form | [[chomsky-normal-form]] | High | A→BC or A→a; 2n-1 steps; enables CYK |
| Closure Properties CFL | [[closure-properties-cfl]] | High | ∪✓ ∩✗ comp✗ ·✓ *✓ ∩Reg✓ |
| Closure Properties Regular | [[closure-properties-regular]] | High | ALL operations closed |
| Compiler Structure | [[compiler-structure]] | Medium | Lexer→Parser→Semantic→Backend |
| Context-Free Grammar | [[context-free-grammar]] | Very High | G=(V,T,S,P); rules A→α |
| Context-Sensitive Grammar | [[context-sensitive-grammar]] | Medium | αAβ→αγβ; \|RHS\|≥\|LHS\| |
| DFA | [[dfa]] | Very High | M=(Q,Σ,δ,q0,F); δ total deterministic |
| DFA Minimization | [[dfa-minimization]] | High | Mark-Reduce; 5 steps |
| Derivation | [[derivation]] | High | Leftmost=top-down; Rightmost=bottom-up reversed |
| First/Follow/Nullable | [[first-follow-nullable-sets]] | Very High | Required for LL(1) table |
| Formal Language | [[formal-language]] | High | L ⊆ Σ*; any set of strings |
| Grammar | [[grammar]] | Very High | G=(V,T,S,P); 4 types in Chomsky hierarchy |
| Grammar Hierarchy (LL/LR) | [[grammar-hierarchy]] | High | LL(1) ⊂ LR(0) ⊂ LR(1) |
| Kleene Star | [[kleene-star]] | Medium | Σ*=all strings including ε; Σ+=no ε |
| Left Recursion | in [[recursive-descent-parsing]] | High | A→Aα: eliminate! A→βA'; A'→αA'\|ε |
| Lexical Analyzer | [[lexical-analyzer]] | High | DFA-based; outputs tokens; longest match |
| Linear Grammar | [[linear-grammar]] | Medium | Right/Left linear; generates regular languages |
| LL(1) Parsing | [[ll1-parsing]] | Very High | Predictive; no backtrack; table M[A,a] |
| LR(0) Parsing | [[lr0-parsing]] | High | Bottom-up; 0 lookahead; LR(0) items |
| Myhill-Nerode Theorem | [[myhill-nerode-theorem]] | High | L regular ↔ ≡_L has finite index |
| Parse Tree | [[parse-tree]] | High | Root=S; leaves=terminals; one tree=leftmost deriv |
| Parsing | [[parsing]] | High | Reverse of derivation; top-down or bottom-up |
| PDA | [[pushdown-automaton]] | Medium | NFA+stack; recognizes CFLs |
| POS Tagging | [[pos-tagging]] | Low | Word labeling; modeled as CFG parsing |
| Pumping Lemma (CFL) | [[pumping-lemma-cfl]] | Very High | w=uvwxy; 5-part; proves non-CFL-ness |
| Pumping Lemma (Regular) | [[pumping-lemma-regular]] | Very High | w=xyz; 3-part; proves non-regularity |
| Recursive Descent Parsing | [[recursive-descent-parsing]] | High | Top-down; each NT=function; cannot handle left recursion |
| Regular Expression | [[regular-expression]] | Very High | ∅,ε,a; +·*; precedence *>·>+ |
| Regular Language | [[regular-language]] | Very High | RE↔DFA↔Linear grammar |
| Shift-Reduce Parsing | [[shift-reduce-parsing]] | High | Shift/Reduce/Accept/Error; bottom-up |
| String | [[string]] | Low | Finite sequence from Σ; \|w\|=length |
| Token | [[token]] | Low | (type, value); output of lexer |

---

## Quick Lookup by Module

**Module 1 (Foundations):** alphabet, string, kleene-star, formal-language, grammar, automaton
**Module 2 (Regular):** regular-expression, dfa, regular-language, linear-grammar
**Module 3 (Lexer):** lexical-analyzer, token, compiler-structure
**Module 4 (DFA theory):** dfa-minimization, myhill-nerode-theorem, pumping-lemma-regular, closure-properties-regular
**Module 5 (CFL):** context-free-grammar, context-free-language, pushdown-automaton, parse-tree, ambiguity-cfg, cfg-simplification, chomsky-normal-form, pumping-lemma-cfl, closure-properties-cfl, derivation
**Module 6 (Top-down parsing):** parsing, recursive-descent-parsing, ll1-parsing, first-follow-nullable-sets
**Module 7 (Bottom-up parsing):** shift-reduce-parsing, lr0-parsing, grammar-hierarchy
**Module 8 (Applications):** pos-tagging, context-sensitive-grammar, chomsky-hierarchy
