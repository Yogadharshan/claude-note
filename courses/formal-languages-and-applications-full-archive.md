# Formal Languages and Applications — Full Knowledge Archive
**Source:** BITS Pilani (Coursera) — 193 lecture transcripts
**Processed:** 2026-06-24

---

## Module 1: Elements of Formal Languages

### Alphabet (Σ)
- Finite, non-empty set of symbols
- Order doesn't matter; no duplicates
- Examples: {0,1}, {a,b,c}, ASCII character set

### String
- Finite sequence of symbols from Σ
- Empty string = ε (epsilon), length 0
- |w| = number of symbols in string w
- Concatenation: uv (append v after u)
- Reverse: w^R (reverse order of symbols)
- Prefix: x is prefix of y if ∃z such that xz = y
- Suffix: x is suffix of y if ∃z such that zx = y
- Substring: contiguous segment of a string

### Kleene Star / Plus
- Σ* = set of ALL strings over Σ including ε
- Σ+ = Σ* \ {ε} (all non-empty strings)
- Both are infinite sets (for any non-empty Σ)

### Language
- Any set of strings over Σ: L ⊆ Σ*
- Operations: union, intersection, complement, concatenation, closure (L*), positive closure (L+)
- L* includes ε by definition

### Grammar G = (V, T, S, P)
- V = variables (non-terminals)
- T = terminals (alphabet symbols)
- S ∈ V = start symbol
- P = set of production rules (rewriting rules)
- Used to generate strings of a language

### Automaton
- Abstract machine that reads input symbol by symbol
- Acceptor: outputs yes/no (string accepted or rejected)
- Transducer: outputs a transformed string
- Foundation for all computational models in the course

### Proof by Induction
- Key proof technique throughout the course
- Basis: prove property holds for smallest case
- Inductive step: prove if holds for n, holds for n+1

---

## Module 2: Regular Languages

### Regular Expressions (RE)
- Compact notation for language patterns
- Primitive REs: ∅ (empty language), λ/ε (empty string language), each symbol a ∈ Σ
- Combination rules:
  - r1 + r2 → union (either r1 or r2)
  - r1 · r2 → concatenation (r1 followed by r2)
  - r1* → Kleene star (zero or more repetitions)
  - (r1) → parenthesization for grouping
- Operator precedence: * > · > + (star binds tightest)

### Regular Language
- Language associated with any RE
- L is regular iff ∃ RE that describes it
- Equivalently: L is regular iff ∃ DFA that accepts it
- Equivalently: L is regular iff ∃ right/left linear grammar that generates it

### DFA (Deterministic Finite Automaton)
- 5-tuple M = (Q, Σ, δ, q0, F)
  - Q: finite set of states
  - Σ: input alphabet
  - δ: Q × Σ → Q (transition function — exactly one transition per state-symbol pair)
  - q0 ∈ Q: initial state
  - F ⊆ Q: set of accepting/final states
- Extended transition function δ*: (Q × Σ*) → Q (handles entire string)
- L(M) = {w ∈ Σ* | δ*(q0, w) ∈ F}
- Design methodology: identify what "memory" is needed; each state = relevant history

### Linear Grammars
- Right linear: A → xB or A → x (non-terminal only at rightmost position)
- Left linear: A → Bx or A → x (non-terminal only at leftmost position)
- Both right and left linear grammars generate exactly the regular languages
- Key equivalence: RE ↔ DFA ↔ Right Linear Grammar ↔ Left Linear Grammar

### Chomsky Hierarchy (preview)
- Regular ⊂ Context-Free ⊂ Context-Sensitive ⊂ Recursively Enumerable
- More detail in Module 8

---

## Module 3: DFA Implementation & Lexical Analysis

### DFA Implementation Approaches

| Feature | Direct (switch-case) | Table-Driven |
|---------|---------------------|--------------|
| Speed | Faster (no lookup) | Slower (array lookup) |
| Maintainability | Poor (rewrite for new DFA) | Good (change table only) |
| Implementation | Hard-coded transitions | 2D array: table[state][input] = next_state |

### Compiler Structure
- Front-end: Lexical Analyzer → Parser → Semantic Analyzer
- Back-end: Code optimization, code generation
- Front-end outputs an intermediate representation (IR) passed to back-end

### Lexical Analyzer
- First phase of compiler
- Reads source code character by character
- Outputs a token stream to the parser
- Strips whitespace and comments
- Uses DFAs internally

### Token
- Smallest meaningful unit of source code
- Types: keyword, identifier, operator, literal, delimiter
- Tokenization: define RE for each token type → build DFA per token → combine DFAs

### Longest Match Principle
- On reaching a dead state (no valid transition), return the last recognized token
- "int123" → identifier (not keyword "int" + number "123")
- Ensures maximal munch: always return the longest valid token

### Dead State
- State from which no accepting state is reachable
- Triggers backtracking: return to last accepted position, output that token

---

## Module 4: DFA Minimization & Regular Language Properties

### Equivalent DFAs
- Multiple DFAs can accept the same language
- Minimum-state DFA is unique (up to state renaming)

### Indistinguishable States
- States p and q are indistinguishable if: for all w ∈ Σ*, δ*(p,w) ∈ F ↔ δ*(q,w) ∈ F
- If indistinguishable, states can be merged without changing accepted language

### Mark-Reduce Algorithm (DFA Minimization)
1. Mark all (accepting, non-accepting) pairs as distinguishable
2. Iteratively mark pairs (p,q) where ∃ symbol a: (δ(p,a), δ(q,a)) already marked
3. Merge all unmarked (indistinguishable) pairs into single states

### Non-Regular Languages
- 0^n 1^n (equal number of 0s then 1s) — NOT regular (needs counting)
- Proved non-regular using Pumping Lemma

### Myhill-Nerode Theorem
- L is regular ↔ the number of equivalence classes of ≡_L is finite
- x ≡_L y if ∀z: xz ∈ L ↔ yz ∈ L
- Each equivalence class corresponds to a state in the minimal DFA
- Provides both a proof of regularity AND a minimization technique

### Pumping Lemma for Regular Languages
- If L is regular, ∃ pumping length p > 0 such that:
  - For all w ∈ L with |w| ≥ p
  - w can be split into xyz where |y| ≥ 1, |xy| ≤ p
  - For all i ≥ 0: xy^i z ∈ L
- Used to PROVE languages are NOT regular (contrapositive)
- Cannot prove a language IS regular

### Closure Properties of Regular Languages
Regular languages are closed under:
- Union (L1 ∪ L2)
- Intersection (L1 ∩ L2)
- Complement (L')
- Concatenation (L1 · L2)
- Kleene Star (L*)
- Reverse (L^R)
- Homomorphism
- Right quotient (L1/L2)

---

## Module 5: Context-Free Languages

### Limitations of Regular Languages
- No memory: cannot count or track balanced structures
- Cannot recognize a^n b^n, palindromes, balanced parentheses

### Context-Free Grammar (CFG)
- G = (V, T, S, P) where P contains rules of form A → α (single non-terminal → any string)
- "Context-free" = left-hand side is always a single non-terminal (no surrounding context required)
- Can express: a^n b^n, a^n b^m c^n (n a's and c's, any b's), equal 0s and 1s

### CFG Examples
| Language | Grammar Rules |
|----------|--------------|
| a^n b^n (n≥1) | S → aSb \| ab |
| Equal 0s and 1s | S → 1S0S \| 0S1S \| ε |
| a^n b^m c^n | S → aSc \| aBc, B → bB \| b |

### Derivation
- Process of applying production rules from S to generate a string
- Leftmost derivation: always replace the leftmost non-terminal first
- Rightmost derivation: always replace the rightmost non-terminal first
- Both produce the same set of strings from a grammar

### Context-Free Language (CFL)
- L is context-free if ∃ CFG G such that L = L(G)
- Recognized by Pushdown Automata (PDA)
- CFG and PDA are equivalent in expressive power

### Pushdown Automaton (PDA)
- Like NFA but with an additional unbounded stack
- Stack provides the "memory" to count and match nested structures
- Every CFL can be recognized by some PDA, and vice versa
- PDA is to CFLs as DFA/NFA is to regular languages

### Parse Tree
- Graphical representation of a derivation from a CFG
- Root = start symbol S
- Internal nodes = non-terminals
- Leaves = terminals (form the derived string)
- Each level corresponds to one production rule application

### Ambiguity in CFG
- A grammar G is ambiguous if ∃ string w ∈ L(G) with more than one parse tree
- Multiple parse trees = multiple structural interpretations
- Causes problems for compilers and parsers
- Some languages are inherently ambiguous (no unambiguous grammar exists)
- Unambiguous: exactly one parse tree for each string in the language

### CFG Simplification
Four methods to simplify CFGs while preserving the language:

1. **Substitution Rule**: Replace A → XBY (where B has rules B → G1 | G2) with A → XG1Y | XG2Y
2. **Remove Useless Symbols**:
   - Non-generating: can't derive any terminal string
   - Non-reachable: can't be reached from start symbol S
3. **Remove Empty Productions (ε-productions)**: A → ε (where A ≠ S)
   - Identify all nullable non-terminals
   - For each rule containing nullable non-terminal, add version with/without it
4. **Remove Unit Productions**: A → B (single non-terminal)
   - Replace A → B with all productions of B substituted into A

### Chomsky Normal Form (CNF)
- Every production is either A → BC (two non-terminals) or A → a (single terminal)
- Possibly S → ε if ε ∈ L
- Every CFG has an equivalent CNF
- Advantage: derivation of string of length n takes exactly 2n-1 steps
- Enables exhaustive search algorithms for membership

### Pumping Lemma for CFLs
- If L is CFL, ∃ pumping length p > 0 such that:
  - For all w ∈ L with |w| ≥ p
  - w = uvwxy where |vwx| ≤ p, |vx| ≥ 1
  - For all i ≥ 0: uv^i wx^i y ∈ L
- Two parts pumped simultaneously (v and x) — unlike regular PL (one part)
- Used to prove languages are NOT context-free
- Examples of non-CFLs: a^n b^n c^n, {ww | w ∈ {0,1}*}

### Closure Properties of CFLs
| Operation | CFL Closed? |
|-----------|-------------|
| Union | YES |
| Concatenation | YES |
| Kleene Star | YES |
| Intersection | NO |
| Complement | NO |
| Intersection with Regular | YES |

### Decidable Properties of CFLs
- **Membership**: Is w ∈ L(G)? → Decidable (use PDA parsing)
- **Emptiness**: Is L(G) = ∅? → Decidable (check if S can derive terminal string)
- **Infinity**: Is L(G) infinite? → Decidable (detect cycles in CNF grammar)
- **Equivalence**: Is L(G1) = L(G2)? → UNDECIDABLE

### Applications of CFLs
- Arithmetic expressions (a^n b^n structure)
- Balanced parentheses
- Palindromes
- Programming language syntax (Java, C, Python grammar rules)
- XML/HTML document parsing
- Natural language processing (sentence structure)
- Formal verification

---

## Module 6: Introduction to Parsing

### What is Parsing?
- Analyzing a stream of symbols to determine grammatical structure
- Reverse of derivation: given string, find the production rules that generated it
- Two major approaches: top-down and bottom-up

### Top-Down Parsing
- Starts from start symbol S, tries to generate the input string
- Expands non-terminals into terminals guided by grammar rules
- Example: Recursive Descent Parsing, LL(1) Parsing

### Bottom-Up Parsing
- Starts from input string, tries to reduce to start symbol S
- Applies production rules in reverse (rightmost derivation in reverse)
- Example: Shift-Reduce Parsing, LR(0), LR(1)

### Recursive Descent Parsing
- Top-down technique
- Each non-terminal in the grammar → one recursive function in the parser
- Functions call each other to match production rules against input tokens
- Parser consumes tokens one by one until all processed

**Key properties:**
- Easy to implement directly from grammar structure
- Cannot handle left recursion (causes infinite recursion)
- Cannot handle ambiguous grammars efficiently

**Issues and Fixes:**
1. **Left Recursion**: A → Aα (non-terminal refers to itself first)
   - Fix: Introduce new non-terminal A', rewrite as right recursion
   - A → βA', A' → αA' | ε
2. **Left Factoring**: Two rules share common prefix
   - Fix: Factor out common prefix, introduce new non-terminal
   - A → αβ1 | αβ2 becomes A → αA', A' → β1 | β2
3. **Useless Symbols**: Remove non-generating and unreachable non-terminals

### LL(1) Parsing
- **L**: left-to-right scan of input
- **L**: leftmost derivation
- **(1)**: one look-ahead symbol
- Top-down, uses predictive parsing table (no backtracking)

**Components:**
- Nullable set: non-terminals that can derive ε
- First(X): set of terminals that can appear as first symbol derived from X
- Follow(A): set of terminals that can appear immediately after A in a valid derivation
- Parsing table T[A,a]: production to apply when non-terminal A is on stack top and input is a

**First Set Rules:**
- First(a) = {a} for terminal a
- If X → Y1Y2...Yn, add First(Y1) to First(X); if Y1 nullable, add First(Y2), etc.
- If X →* ε, add ε to First(X)

**Follow Set Rules:**
- Always add $ to Follow(S) (start symbol)
- If A → αBβ: add First(β)\{ε} to Follow(B)
- If A → αB or β can derive ε: add Follow(A) to Follow(B)

**Table Construction:**
- For production A → α: for each a ∈ First(α), set T[A,a] = A → α
- If ε ∈ First(α): for each b ∈ Follow(A), set T[A,b] = A → α

**LL(1) Conflicts:**
- First/First conflict: two productions for A have overlapping First sets
- First/Follow conflict: ε-production and another production share a terminal
- Left recursion causes infinite loops
- Resolution: left factoring, eliminate left recursion, or use LLK/LR parsers

**LL(k) Parsers:**
- LL(2) looks ahead 2 symbols, can resolve more conflicts
- LL(k) exponentially larger table; rarely used beyond LL(1) in practice

---

## Module 7: LR Parsing

### Weaknesses of LLK Parsers
- Cannot handle left-recursive grammars natively
- Limited lookahead may be insufficient for complex grammars
- Only parses LLK grammars (strict subset of all CFLs)
- Motivation for LR parsers

### Shift-Reduce Parsing (Bottom-Up)
- Four actions: Shift, Reduce, Accept, Error
- **Shift**: move next input symbol onto stack
- **Reduce**: replace right-hand side of a production on stack with left-hand side
- **Accept**: stack contains start symbol + input empty
- **Error**: no valid action possible

### LR Parsing Table
- Pre-computed structure: Action Table + GOTO Table
- **Action Table**: given (current state, input terminal) → shift/reduce/accept/error
- **GOTO Table**: given (current state, non-terminal after reduction) → next state
- Without this table, LR parsing would be non-deterministic

### LR(0) Parsing
- Simplest LR parser; zero lookahead symbols
- **LR(0) Item**: production rule with dot indicating parsing position
  - E → •E+T (dot before E: haven't parsed anything yet)
  - E → E•+T (dot after E: E has been recognized)
  - E → E+T• (dot at end: entire production recognized, ready to reduce)
- States are sets of LR(0) items (closure of items)

**Table Construction:**
1. Augment grammar: S' → S
2. Compute closure of initial item set
3. Build automaton of item sets connected by transitions
4. Fill action table: shift on terminals, reduce when dot at end
5. Fill goto table: transitions on non-terminals after reductions

**Limitations:**
- Cannot handle all context-free grammars
- Prone to reduce-reduce conflicts (two competing reductions)
- No lookahead to resolve ambiguities

### LR(1) Parsing
- Uses 1 lookahead symbol
- LR(1) item: [A → α•β, a] where a is the lookahead terminal
- More powerful than LR(0): resolves many shift-reduce conflicts
- Used in practice by tools like Yacc/Bison
- Every LL(1) grammar is also LR(1)

### LR(k) Parsing
- Generalizes LR(1) with k lookahead symbols
- Table grows exponentially with k; rarely used beyond k=1 in practice
- LR(k) for k>1 adds minimal power over LR(1) for most real grammars

### Grammar Class Hierarchy (LL vs LR)
```
LL(1) ⊂ LL(2) ⊂ ... ⊂ LL(k)
LL(1) ⊂ LR(0) ⊂ LR(1) ⊂ LR(k) ⊂ all deterministic CFLs
```
- LL parsers: top-down, cannot handle left recursion, simpler to implement
- LR parsers: bottom-up, can handle left recursion, more expressive, more complex
- LR(1) handles far more grammars than LL(1) or LR(0)

---

## Module 8: POS Tagging, Context-Sensitive Grammar & Chomsky Hierarchy

### Part-of-Speech (POS) Tagging
- Identifying and labeling parts of speech (noun, verb, adjective, etc.) in text
- Applications: syntax analysis, named entity recognition (NER), sentiment analysis, machine translation, information retrieval
- Techniques: rule-based, statistical (HMM, CRF), neural networks (transformers)
- CFG connection: sentence structure rules (S → NP VP) can guide POS tagging

### CFG for POS Tagging
- S → NP VP (sentence = noun phrase + verb phrase)
- NP → Det N (noun phrase = determiner + noun)
- VP → V PP (verb phrase = verb + prepositional phrase)
- Parse tree gives structural analysis; leaves are POS tags
- Limitation: inherent ambiguity in natural language (e.g., "I shot an elephant in my pajamas")

### Context-Sensitive Grammar (CSG)
- Type 1 in Chomsky Hierarchy
- Production rules can depend on surrounding context
- Form: αAβ → αγβ (A replaced by γ only when surrounded by α and β)
- Length requirement: |right-hand side| ≥ |left-hand side| (no length reduction)
- More expressive than CFG: can enforce agreement between distant parts of string
- Example: a^n b^n c^n language (requires all three counts to match)

**CSG Applications:**
- Type checking and variable scoping in programming languages
- Gender/number agreement in natural language (NLP)
- Biological sequence analysis (protein folding dependencies)
- HTML/XML nested structure validation
- Taxonomic classification systems

### Chomsky Hierarchy (Complete)
| Type | Grammar | Automaton | Language Class |
|------|---------|-----------|---------------|
| 0 | Unrestricted | Turing Machine | Recursively Enumerable |
| 1 | Context-Sensitive | Linear Bounded Automaton | Context-Sensitive |
| 2 | Context-Free | Pushdown Automaton | Context-Free |
| 3 | Regular | Finite Automaton (DFA/NFA) | Regular |

- Strict inclusion: Regular ⊂ Context-Free ⊂ Context-Sensitive ⊂ Recursively Enumerable
- Type 0 is most powerful: can express any algorithmically describable language
- As we go up (0→3), expressiveness decreases but computational efficiency increases

---

## Key Connections & Cross-Module Relationships

```
Formal Language Theory
├── Regular Languages
│   ├── RE ↔ DFA ↔ Linear Grammar (equivalent)
│   ├── Pumping Lemma → proves non-regularity
│   └── DFA → Lexical Analyzer (compiler front-end)
│
├── Context-Free Languages
│   ├── CFG ↔ PDA (equivalent)
│   ├── Pumping Lemma → proves non-CFL-ness
│   ├── CFG → Parser (compiler front-end)
│   │   ├── Top-Down: Recursive Descent, LL(1)
│   │   └── Bottom-Up: Shift-Reduce, LR(0), LR(1)
│   └── CFG → POS Tagging (NLP)
│
└── Context-Sensitive Languages
    ├── CSG ↔ Linear Bounded Automaton
    └── Applications: type checking, NLP agreement
```

## Professor Emphasis Points
- DFA design: "think of states as memory of relevant history"
- Pumping Lemma: always a proof by contradiction; assume regularity/CFL-ness, derive contradiction
- CFG ambiguity: crucial to avoid in compiler design; unambiguous grammar essential
- Left recursion: must eliminate before implementing recursive descent or LL(1) parsers
- LL vs LR: LL is simpler to implement; LR is more powerful and handles more real-world grammars
- Chomsky Hierarchy: the unifying framework for all language classes in this course

## Concepts NOT Covered (course explicitly skipped)
- NFA (Non-Deterministic Finite Automata): professor stated "did not go into NFA to keep scope"
- Turing Machines (mentioned in Chomsky Hierarchy context only)
- Detailed PDA construction algorithms
- LALR parsers (mentioned but not covered in depth)
