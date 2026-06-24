# Formal Languages — Question Bank

Legend: ★★★ = high probability | ★★ = medium | ★ = low

---

## SHORT-ANSWER QUESTIONS (20)

**Q1** ★★★ | Concepts: alphabet, string | Difficulty: 1
Define (a) alphabet Σ, (b) string over Σ, (c) Σ*, (d) Σ+, and (e) language L.
Answer structure: 5 definitions; note ε ∈ Σ* but ε ∉ Σ+

**Q2** ★★★ | Concepts: DFA | Difficulty: 2
Give the formal 5-tuple definition of a DFA. Define the extended transition function δ* and the language L(M) accepted by DFA M.
Answer structure: 5-tuple → δ* recursive definition → L(M) set notation

**Q3** ★★★ | Concepts: regular expression | Difficulty: 2
State the operator precedence rules for regular expressions. What language does each of the following describe: (a) ab* (b) (ab)* (c) a+b (d) a*+b*?
Answer structure: precedence table → each RE expanded

**Q4** ★★★ | Concepts: regular/non-regular | Difficulty: 3
State whether each language is regular. Justify briefly: (a) {a^n | n ≥ 0} (b) {a^n b^n | n ≥ 0} (c) {w | w contains "ab" as substring} (d) {ww^R | w ∈ {a,b}*}
Answer structure: yes/no + one-line reason each

**Q5** ★★★ | Concepts: CFG | Difficulty: 2
Write a CFG for L = {a^n b^n | n ≥ 1}. Show a leftmost and rightmost derivation of "aaabbb."
Answer structure: grammar → leftmost derivation → rightmost derivation

**Q6** ★★ | Concepts: ambiguity | Difficulty: 3
Given grammar S → SS | (S) | ε, show that the string "(())" has exactly one parse tree. Is this grammar ambiguous? Justify.
Answer structure: draw parse tree → second derivation? → yes/no + justification

**Q7** ★★★ | Concepts: CFG simplification | Difficulty: 3
Identify the 4 steps of CFG simplification. For each, state what is removed and why.
Answer structure: 4-row table with step/what/why

**Q8** ★★★ | Concepts: CNF | Difficulty: 3
Define Chomsky Normal Form. Why is it useful? For a string of length n, how many steps does a CNF derivation require?
Answer structure: definition → 2 reasons → 2n-1 formula

**Q9** ★★★ | Concepts: closure properties | Difficulty: 2
(a) Are regular languages closed under complement? If yes, how? (b) Are CFLs closed under intersection? Provide a counterexample if not.
Answer structure: yes + method → no + a^nb^ncm ∩ a^mb^ncn counterexample

**Q10** ★★ | Concepts: Myhill-Nerode | Difficulty: 4
State the Myhill-Nerode theorem. How does it differ from the Pumping Lemma for regular languages?
Answer structure: theorem statement → finite index → PL is necessary only; M-N is iff

**Q11** ★★★ | Concepts: First/Follow/Nullable | Difficulty: 3
Define Nullable(A), First(X), and Follow(A). What does each tell us during LL(1) parsing?
Answer structure: 3 definitions → parsing role for each

**Q12** ★★★ | Concepts: LL(1) | Difficulty: 3
What is an LL(1) conflict? List two causes and their fixes.
Answer structure: definition of conflict (>1 entry in table cell) → First/First conflict → fix: left factoring → First/Follow conflict → fix: grammar rewrite

**Q13** ★★ | Concepts: parsing | Difficulty: 2
Distinguish top-down from bottom-up parsing. Which derivation type does each build?
Answer structure: direction/start/strategy/derivation table

**Q14** ★★★ | Concepts: shift-reduce | Difficulty: 3
Define the 4 actions in shift-reduce parsing. What does "accept" require?
Answer structure: Shift/Reduce/Accept/Error → accept = stack contains S + input is $

**Q15** ★★ | Concepts: LR(0) | Difficulty: 4
What is an LR(0) item? Explain the dot's meaning. When does a state trigger a reduce action?
Answer structure: item definition → dot = parsing position → reduce when dot at end

**Q16** ★★ | Concepts: grammar hierarchy | Difficulty: 3
State the class inclusion relationship between LL(1), LR(0), and LR(1). Which handles left recursion?
Answer structure: LL(1) ⊂ LR(0) ⊂ LR(1) → LR handles; LL does not

**Q17** ★★★ | Concepts: Chomsky hierarchy | Difficulty: 2
Complete the Chomsky hierarchy table: Type 0-3, grammar name, automaton, language class.
Answer structure: 4-row table

**Q18** ★★ | Concepts: PDA | Difficulty: 3
What additional feature does a PDA have over a DFA? What language class does it recognize? Is NPDA = DPDA in power?
Answer structure: stack → CFLs → NO (unlike DFA/NFA)

**Q19** ★★ | Concepts: left recursion | Difficulty: 3
Given A → Aα | β, show how to eliminate left recursion. Why does left recursion cause problems for recursive descent parsers?
Answer structure: transformation → A → βA'; A' → αA' | ε → infinite loop explanation

**Q20** ★★ | Concepts: lexical analysis | Difficulty: 2
Describe the longest match principle in lexical analysis. What is a dead state and how does it trigger backtracking?
Answer structure: definition → example (int vs int123) → dead state → backtrack to last accept

---

## APPLICATION QUESTIONS (20)

**Q21** ★★★ | Concepts: DFA | Difficulty: 3
Design a DFA over Σ = {0,1} that accepts strings where the number of 0s is divisible by 3.
Answer structure: 3 states (remainder 0,1,2) → transitions for each input

**Q22** ★★★ | Concepts: DFA | Difficulty: 3
Design a DFA over Σ = {a,b} accepting strings that contain "ab" as a substring.
Answer structure: 3 states (init, seen_a, seen_ab) → draw δ table → trace "aab"

**Q23** ★★★ | Concepts: RE | Difficulty: 3
Write regular expressions for: (a) strings over {a,b} ending in "ba" (b) strings with even length (c) strings with at least two a's (d) all strings that DO NOT contain "bb"
Answer structure: 4 REs with brief justification

**Q24** ★★★ | Concepts: Pumping Lemma (Regular) | Difficulty: 4
Prove that L = {0^n 1^n | n ≥ 0} is not regular using the Pumping Lemma.
Answer structure: assume regular → p → w=0^p1^p → xy in 0's → y=0^k → pump i=0 → 0^(p-k)1^p ∉ L → contradiction

**Q25** ★★★ | Concepts: Pumping Lemma (Regular) | Difficulty: 4
Prove that L = {ww^R | w ∈ {a,b}*} (palindromes) is not regular.
Answer structure: choose w = a^p b a^p → xy in a's → pump → breaks palindrome structure

**Q26** ★★★ | Concepts: CFG | Difficulty: 3
Write CFGs for: (a) balanced parentheses (b) arithmetic expressions with +, *, (, ), id (with correct precedence) (c) equal number of 0s and 1s
Answer structure: 3 separate grammars

**Q27** ★★★ | Concepts: parse tree | Difficulty: 3
Given grammar E → E+E | E*E | id, draw two different parse trees for "id + id * id". Explain what this demonstrates.
Answer structure: two trees → demonstrates ambiguity → different operator precedence interpretations

**Q28** ★★ | Concepts: CFG simplification | Difficulty: 4
Simplify the following CFG by applying all 4 simplification steps in order:
S → AB | a, A → aA | ε, B → bB | b, C → c
Answer structure: step 1 (C non-reachable → remove) → step 2 (A is nullable) → step 3 (remove A→ε, adjust S→AB) → step 4 (check unit prods)

**Q29** ★★★ | Concepts: CNF | Difficulty: 4
Convert the following CFG to Chomsky Normal Form:
S → ASB | ε, A → aAS | a, B → SbS | A | bb
Answer structure: remove ε-prods → remove unit prods → convert to binary → fix terminal-NT mixing

**Q30** ★★★ | Concepts: Pumping Lemma (CFL) | Difficulty: 5
Prove that L = {a^n b^n c^n | n ≥ 1} is not context-free.
Answer structure: assume CFL → p → w=a^pb^pc^p → vwx spans ≤2 blocks → all cases lead to unequal counts → contradiction

**Q31** ★★ | Concepts: closure properties CFL | Difficulty: 3
Show that CFLs are NOT closed under intersection by providing a concrete counterexample.
Answer structure: L1 = a^nb^nc^m, L2 = a^mb^nc^n → both CFL → L1∩L2 = a^nb^nc^n → prove not CFL

**Q32** ★★★ | Concepts: First/Follow/Nullable | Difficulty: 4
For the grammar E → TX, X → +TX | ε, T → FY, Y → *FY | ε, F → id | (E):
Compute Nullable, First, and Follow for all non-terminals.
Answer structure: show iteration steps → final sets

**Q33** ★★★ | Concepts: LL(1) parsing | Difficulty: 4
Build the LL(1) parsing table for the grammar in Q32. Then trace the parse of "id + id * id".
Answer structure: table → trace (stack + input + action at each step)

**Q34** ★★ | Concepts: recursive descent | Difficulty: 3
Write recursive descent parsing functions in pseudocode for: E → TE', E' → +TE' | ε, T → id
Answer structure: 3 functions: parse_E, parse_E_prime, parse_T

**Q35** ★★ | Concepts: LR(0) | Difficulty: 5
Given grammar S → A, A → aAb | ab, construct the LR(0) item sets and the parsing table.
Answer structure: I0, I1, I2,... → action/goto table

**Q36** ★★ | Concepts: shift-reduce | Difficulty: 4
Trace shift-reduce parsing of "id * id + id" using the grammar: E → E+T|T, T → T*F|F, F → id.
Answer structure: step-by-step table: stack | input | action

**Q37** ★★ | Concepts: DFA minimization | Difficulty: 4
Given a DFA with states {q0,q1,q2,q3,q4}, Σ={0,1}, q0=start, F={q3,q4}:
δ: q0→q1(0), q0→q2(1), q1→q3(0), q1→q4(1), q2→q3(0), q2→q4(1), q3→q3(0), q3→q3(1), q4→q4(0), q4→q4(1)
Minimize using Mark-Reduce.
Answer structure: mark (q3,q4) vs (q0,q1,q2) → check q1≡q2 → merge → final 4-state DFA

**Q38** ★★ | Concepts: Chomsky hierarchy | Difficulty: 3
Classify each language in the Chomsky hierarchy: (a) {a^n | n prime} (b) {ww | w ∈{0,1}*} (c) {a^n b^n c^n} (d) all C programs that compile without errors
Answer structure: (a) Regular? No. CFL? No. CSL? Yes. (b)-(d) similar

**Q39** ★★ | Concepts: context-sensitive grammar | Difficulty: 3
Explain why a^n b^n c^n requires a context-sensitive grammar. What production in a CSG enforces the count relationship?
Answer structure: why CFG fails (PL argument) → CSG rule form CB→BC shows context-dependent reordering

**Q40** ★ | Concepts: Myhill-Nerode | Difficulty: 5
Use the Myhill-Nerode theorem to prove that L = {a^n b^n | n≥0} is not regular. Show infinite equivalence classes.
Answer structure: show strings a^0, a^1, a^2,... are pairwise inequivalent → each needs distinct suffix b^i → infinite index

---

## COMPARISON QUESTIONS (20)

**Q41** ★★★ | Concepts: RE vs DFA vs linear grammar | Difficulty: 2
Compare the three representations of regular languages. When would you prefer each?
Answer structure: descriptive power (equivalent) → human readability → computational form → 3-column table

**Q42** ★★★ | Concepts: regular vs CFL | Difficulty: 3
Compare regular and context-free languages. Include: expressive power, recognizer, closure under ∩, ability to count.
Answer structure: comparison table with 6 rows

**Q43** ★★★ | Concepts: top-down vs bottom-up | Difficulty: 3
Compare top-down (LL) and bottom-up (LR) parsing. Include: direction, derivation built, left recursion handling, power.
Answer structure: side-by-side table → conclusion: LR is more powerful

**Q44** ★★★ | Concepts: LL(1) vs LR(0) | Difficulty: 3
Compare LL(1) and LR(0) parsing. Which is more powerful? Can you construct a grammar that is LR(0) but not LL(1)?
Answer structure: comparison table → LL(1) ⊂ LR(0) → example grammar

**Q45** ★★ | Concepts: DFA vs PDA | Difficulty: 3
Compare DFA and PDA. What does the stack in PDA enable? Is NPDA ≡ DPDA the way NFA ≡ DFA?
Answer structure: finite memory vs stack → counting and nesting → NO: NPDA ≠ DPDA

**Q46** ★★★ | Concepts: pumping lemmas | Difficulty: 4
Compare the Pumping Lemma for regular languages and CFLs. How many parts? What is pumped? What are the constraints?
Answer structure: side-by-side table: parts | what pumped | key constraint | what it proves

**Q47** ★★ | Concepts: leftmost vs rightmost derivation | Difficulty: 2
Compare leftmost and rightmost derivations. Which corresponds to top-down parsing? Bottom-up?
Answer structure: direction → corresponding parser → both produce same string → different sequences

**Q48** ★★ | Concepts: ambiguous vs unambiguous CFG | Difficulty: 3
Compare ambiguous and unambiguous CFGs. What are the consequences of ambiguity in a compiler? How do you fix it?
Answer structure: definition → compiler impact (undefined parse → undefined code gen) → fixes (operator precedence stratification, left factoring)

**Q49** ★★ | Concepts: CFG vs CSG | Difficulty: 3
Compare context-free grammars and context-sensitive grammars. What languages can each generate that the other cannot?
Answer structure: rule form | what's added | language power | example | computational cost

**Q50** ★★★ | Concepts: LL(1) vs recursive descent | Difficulty: 3
Compare LL(1) parsing with recursive descent parsing. Is every recursive descent parser an LL(1) parser?
Answer structure: table (backtracking, table, lookahead) → No: RD can backtrack; LL(1) is strictly predictive

**Q51** ★★ | Concepts: Myhill-Nerode vs Pumping Lemma | Difficulty: 4
Compare the Myhill-Nerode theorem and the Pumping Lemma for proving non-regularity. Which is more powerful?
Answer structure: both prove non-regularity → M-N is iff; PL is only necessary → M-N more powerful → when to prefer each

**Q52** ★★ | Concepts: CNF vs unconstrained CFG | Difficulty: 3
Compare CFG in CNF with a general CFG. What is gained and lost in conversion to CNF?
Answer structure: binary branching | 2n-1 steps | enables CYK | may increase rule count | same language

**Q53** ★★ | Concepts: closure properties | Difficulty: 3
For each closure property (union, intersection, complement, concatenation), compare regular vs CFL behavior and provide justification.
Answer structure: table with 5 properties × 2 classes + justification column

**Q54** ★★ | Concepts: LR(0) vs LR(1) | Difficulty: 4
Compare LR(0) and LR(1) parsing. What is an LR(1) item? How does the extra lookahead help?
Answer structure: items format → lookahead → resolve which reduce to apply → more grammars handled

**Q55** ★★ | Concepts: DFA minimization approaches | Difficulty: 4
Compare Mark-Reduce (table-filling) with Myhill-Nerode for DFA minimization. Are the results identical?
Answer structure: both compute same thing → M-N is theoretical basis → Mark-Reduce is algorithm → yes, same result

**Q56** ★★ | Concepts: ε-productions | Difficulty: 3
Compare a CFG with ε-productions to one without (after removal). What changes? What is preserved?
Answer structure: language preserved (unless ε∈L) → grammar structure changes → nullable sets track what was removed

**Q57** ★★ | Concepts: unit vs ε-productions | Difficulty: 3
Compare ε-productions and unit productions in CFGs. How are they removed? Which is removed first?
Answer structure: ε: remove by cloning rules with/without nullable NTs → unit: inline NT's rules → ε first (can create unit prods); unit second

**Q58** ★★ | Concepts: CFL decidability | Difficulty: 3
Compare: membership problem (w∈L?), emptiness problem (L=∅?), and equivalence problem (L1=L2?) for CFLs.
Answer structure: membership=decidable O(n³) | emptiness=decidable | equivalence=UNDECIDABLE

**Q59** ★ | Concepts: compiler phases | Difficulty: 2
Compare the roles of the lexical analyzer and parser. What does each receive as input? Produce as output? Which formal language class does each correspond to?
Answer structure: table: input/output/formalism for each

**Q60** ★ | Concepts: Chomsky hierarchy | Difficulty: 2
Compare all four grammar types in the Chomsky hierarchy: rule form, automaton, example language, computational complexity.
Answer structure: 5-column table

---

## SYNTHESIS QUESTIONS (20)

**Q61** ★★★ | Concepts: DFA + RE + linear grammar | Difficulty: 3
Given L = {w ∈ {0,1}* | w ends in "01"}: (a) write a RE (b) construct a DFA (c) write a right linear grammar. Verify all three generate/accept the same language.
Answer structure: RE → DFA (3 states) → grammar (DFA state = NT) → trace common string through all three

**Q62** ★★★ | Concepts: CFG + parse tree + ambiguity | Difficulty: 4
Given grammar S → S+S | S*S | id: (a) show it's ambiguous for "id+id*id" (b) rewrite to enforce * > + precedence (c) is the rewritten grammar LL(1)? Build table if yes.
Answer structure: two parse trees → E→E+T; T→T*F; F→id → compute First/Follow → table → no conflicts → LL(1)

**Q63** ★★★ | Concepts: PL (Regular) + closure | Difficulty: 4
Prove that L = {a^n b^m | n > m} is not regular. Then use closure properties to show L ∪ {a^nb^n | n≥0} is also not regular.
Answer structure: PL proof for L → if L∪{a^nb^n} were regular → their intersection arguments → contradiction

**Q64** ★★★ | Concepts: PL (CFL) + closure | Difficulty: 5
(a) Prove {ww | w ∈ {0,1}*} is not context-free using the CFL pumping lemma. (b) Show that the complement of this language IS context-free.
Answer structure: PL CFL proof → complement: construct CFG for {xy | |x|≠|y| or x≠y}

**Q65** ★★ | Concepts: CFG + CFL + CL intersection | Difficulty: 4
L1 = {w ∈ {a,b,c}* | #a(w) = #b(w)} is CFL. R = {w | w doesn't contain "cc"} is regular. Argue L1 ∩ R is CFL without constructing the grammar.
Answer structure: CFL ∩ Regular = CFL → cite theorem → done (no explicit grammar needed)

**Q66** ★★★ | Concepts: CFG simplification + CNF | Difficulty: 5
Starting from G: S → ASB | ε, A → aAS | a, B → SbS | A | bb. Convert to CNF, showing each step (simplification then CNF conversion).
Answer structure: step 1-4 of simplification → CNF conversion steps → final grammar

**Q67** ★★★ | Concepts: LL(1) full pipeline | Difficulty: 5
For grammar: stmt → if(expr)stmt | if(expr)stmt else stmt | other, expr → id:
(a) Show the grammar has a conflict (b) explain which conflict type (c) resolve it (d) build the LL(1) table for the resolved grammar
Answer structure: conflict identification → First/Follow conflict (dangling else) → add explicit else rule → table

**Q68** ★★ | Concepts: LL vs LR trade-offs | Difficulty: 4
Design a grammar that is LR(0) but NOT LL(1). Explain why it fails LL(1) and succeeds in LR(0).
Answer structure: left-recursive example grammar → LL(1): infinite loop → LR(0): handles with reduce on dot-at-end

**Q69** ★★ | Concepts: Chomsky hierarchy integration | Difficulty: 4
A language L1 is known to be regular. L2 requires counting two independent values. L3 requires type-checking with scope. L4 requires arbitrary computation. Classify each in the Chomsky hierarchy and identify the appropriate recognizer for each.
Answer structure: L1=Type 3 DFA; L2=Type 2 PDA; L3=Type 1 LBA; L4=Type 0 TM

**Q70** ★★ | Concepts: POS tagging + CFG | Difficulty: 3
Show how POS tagging can be modeled as a CFG parsing problem. Given sentence "The cat sat on the mat", write the CFG rules and the resulting parse tree.
Answer structure: rules (S→NP VP; NP→Det N; VP→V PP; PP→Prep NP) → parse tree with POS labels

**Q71** ★★ | Concepts: CSG motivation | Difficulty: 3
Explain why a^n b^n c^n cannot be context-free (sketch pumping lemma argument). Then give the key production rule in a CSG that enforces the balance between b's and c's.
Answer structure: CFL PL sketch → CB→BC as the key context-sensitive rule

**Q72** ★★ | Concepts: DFA design + optimization | Difficulty: 4
Design a DFA for "strings with an even number of a's and an even number of b's." Then minimize it. What is the minimum number of states?
Answer structure: 4 states (ee, eo, oe, oo) → mark (oo as trap? no, all may be accept) → check minimality

**Q73** ★★ | Concepts: compiler + formal languages | Difficulty: 3
Explain how formal language theory underpins each phase of a compiler's front-end. Which language class does each phase correspond to?
Answer structure: lexer=RE/DFA → parser=CFG/PDA → semantic=CSG-level → type theory → formal connection

**Q74** ★ | Concepts: recursive descent + LL(1) | Difficulty: 4
Start with a left-recursive, ambiguous grammar for arithmetic. Apply all necessary transformations to make it LL(1). Build the resulting recursive descent parser.
Answer structure: original → eliminate left recursion → left factor → compute sets → table → code

**Q75** ★★ | Concepts: Myhill-Nerode + DFA minimization | Difficulty: 5
Prove that the minimal DFA for L = {w ∈ {0,1}* | w has odd number of 1s} has exactly 2 states using the Myhill-Nerode theorem.
Answer structure: 2 equivalence classes (odd/even count of 1s seen) → show exactly 2 → minimal DFA

**Q76** ★★ | Concepts: CFL closure + non-examples | Difficulty: 4
Prove that CFLs are not closed under intersection using two distinct pairs of CFLs whose intersection is provably not a CFL.
Answer structure: pair 1: a^nb^nc^m ∩ a^mb^nc^n = a^nb^nc^n → pair 2: another counterexample

**Q77** ★★ | Concepts: shift-reduce + grammar hierarchy | Difficulty: 4
Given a grammar that is LL(1), trace both an LL(1) parse and an LR(0) parse of the same string. Compare the order of reductions/expansions.
Answer structure: LL trace (leftmost expand) → LR trace (rightmost in reverse) → comparison

**Q78** ★ | Concepts: CFG applications | Difficulty: 3
Show that the following are context-free by constructing grammars: (a) HTML-like nested tags (b) simple Python-like arithmetic with parentheses (c) JSON objects with string keys and integer values.
Answer structure: 3 grammars with brief explanation

**Q79** ★★ | Concepts: PL both + comparison | Difficulty: 5
Prove the same language L = {a^n b^n | n ≥ 0} is not regular using: (a) Pumping Lemma for regular languages (b) Myhill-Nerode theorem. Compare the two approaches.
Answer structure: PL proof → M-N proof with infinite equivalence classes → comparison (which is cleaner, more general)

**Q80** ★ | Concepts: full hierarchy synthesis | Difficulty: 4
Trace the path of a simple C program from source text to parse tree, identifying at each step which class of formal language theory is applied and what automaton implements the recognition.
Answer structure: characters → DFA lexer → token stream → CFG parser → parse tree → semantic phase (context-sensitive reasoning)

---

## DIFFICULT PROFESSOR-STYLE QUESTIONS (10)

**Q81** ★★★ | Concepts: DFA + complement | Difficulty: 3
A DFA M accepts L. Describe precisely how to construct a DFA M' for L' (complement). If M has n states with k accepting, how many accepting states does M' have?
Answer structure: swap F and Q\F → n-k accepting states → same transitions → L(M') = Σ* \ L(M)

**Q82** ★★★ | Concepts: PL for CFL | Difficulty: 5
Prove that L = {a^i b^j c^k | i = j or j = k} is NOT context-free.
Hint: Consider strings where i ≠ j ≠ k to force specific pumping constraints.
Answer structure: choose w = a^pb^pc^(p+p!) → argue vwx position → all splits lead to violation of i=j or j=k

**Q83** ★★★ | Concepts: LL(1) conflicts | Difficulty: 4
Given grammar S → aS | a, show this is NOT LL(1). Then modify it to be LL(1) while preserving the language. Compute First/Follow for the original and modified grammars.
Answer structure: First(S) = {a} for both S→aS and S→a → conflict on 'a' → rewrite: S → aS' ; S' → S | ε

**Q84** ★★ | Concepts: DFA product + intersection | Difficulty: 4
Construct the DFA for the intersection of: L1 = {w | w has even # of a's} and L2 = {w | w has odd # of b's} over Σ = {a, b}.
Answer structure: L1 DFA: 2 states; L2 DFA: 2 states → product = 4 states → F = {(even,odd)} → trace a,b

**Q85** ★★★ | Concepts: CFG ambiguity + unambiguous rewrite | Difficulty: 5
The grammar E → E+E | E-E | n is ambiguous. Rewrite it to handle: (a) both + and - have equal precedence (b) left associativity for both. Prove the rewritten grammar is unambiguous.
Answer structure: E → E+T | E-T | T ; T → n → proves left assoc and equal prec → uniqueness argument

**Q86** ★★ | Concepts: Myhill-Nerode + minimization | Difficulty: 5
Prove that the minimum DFA for L = {a^m b^n | m,n ≥ 1} has exactly 4 states by identifying the 4 Myhill-Nerode equivalence classes.
Answer structure: 4 classes: {strings with 0 a's seen}, {started a's}, {started b's after a's}, {dead state} → distinguish each pair with a suffix

**Q87** ★★ | Concepts: CFL membership decidability | Difficulty: 4
Explain how the CYK algorithm decides membership w ∈ L(G) for a CFG G in CNF. What is the time complexity? Why does CNF simplify this?
Answer structure: DP table T[i,j] = {A | A⟹*ai..aj} → base and recursive case → O(n³|G|) → CNF ensures binary branching

**Q88** ★★ | Concepts: LL(1) + grammar transformation | Difficulty: 5
Grammar: A → AbC | bC, show this is left-recursive. Eliminate left recursion. Then determine if the resulting grammar is LL(1). If not, apply further transformations.
Answer structure: A→AbC is left-recursive → A→bCA'; A'→bCA'|ε → compute First/Follow → check table → proceed

**Q89** ★★ | Concepts: closure properties chain | Difficulty: 4
Suppose L1 is CFL and L2 is regular. Prove each of the following is CFL: (a) L1 ∩ L2 (b) L1 · L2 (c) L1* (d) L1 ∪ L2
Answer structure: (a) PDA+DFA simultaneous → (b) CFG concatenation rule → (c) CFG star rule → (d) CFG union rule

**Q90** ★★★ | Concepts: full pipeline synthesis | Difficulty: 5
You are building a simple interpreter for arithmetic expressions. (a) What token types does your lexer need? Write a RE for each. (b) Write a CFG for the expressions (handling precedence). (c) Is your CFG LL(1)? Compute the First/Follow sets. (d) Trace the parse of "id + id * id" using your LL(1) table.
Answer structure: lexer (4 token types + REs) → grammar (E→TX; X→+TX|ε; T→FY; Y→*FY|ε; F→id|(E)) → compute sets → table → 10-step trace
