---
name: context-sensitive-grammar
description: Type 1 grammar — production rules depend on surrounding context (αAβ → αγβ); generates context-sensitive languages
metadata:
  type: user
---

## definition

A **Context-Sensitive Grammar** (CSG) is a formal grammar where every production rule has the form:
- αAβ → αγβ
- Where A ∈ V (single non-terminal), α, β ∈ (V ∪ T)* (surrounding context), γ ∈ (V ∪ T)+ (non-empty string)
- **Length requirement**: |right-hand side| ≥ |left-hand side| (no string shortening)

The surrounding context α and β determine whether the rule αAβ → αγβ can be applied — hence "context-sensitive."

## intuition

Unlike CFGs where A can be replaced anywhere regardless of surroundings, in CSGs the replacement of A is only allowed in specific contexts (surrounded by α on the left and β on the right). This enables encoding relationships between distant parts of a string.

## why it exists

Some languages require rules that depend on the surrounding context:
- Type checking: the type of an expression depends on surrounding declaration context
- Natural language agreement: verb form depends on subject number/gender
- Biological sequences: amino acid substitution depends on neighboring acids
- a^n b^n c^n: all three counts must match — requiring awareness of context

## comparison with CFG

| Feature | CFG | CSG |
|---------|-----|-----|
| Rule form | A → α | αAβ → αγβ |
| Context needed | None | Surrounding α, β |
| Length | RHS can be shorter | \|RHS\| ≥ \|LHS\| |
| Power | Can match 2 equal counts | Can match 3+ equal counts |
| Automaton | PDA | Linear Bounded Automaton |

## example: L = {a^n b^n c^n | n ≥ 1}

This language is NOT context-free but IS context-sensitive.

Grammar:
1. S → aSBC | aBC
2. CB → BC (rearrange: move B past C)
3. aB → ab (in context of 'a': replace B with b)
4. bB → bb
5. bC → bc
6. cC → cc

The trick: B's and C's are produced together, then context-sensitive rules enforce the right order.

## applications

**Type checking / variable scoping:**
- Rule: type(x) → int IF x declared as int in surrounding scope
- The "scope" is the context

**Natural language agreement:**
- English: subject must agree with verb in number
- "The dog runs" (singular) vs "The dogs run" (plural)
- Rule: VERB_FORM depends on SUBJECT NUMBER in context

**Biological sequence analysis:**
- Protein folding: amino acid substitution depends on neighboring acids
- DNA/RNA secondary structure modeling

**HTML/XML validation:**
- Certain tags valid only inside specific parent tags
- e.g., `<td>` valid inside `<tr>` which is inside `<table>`

**Hierarchical data modeling:**
- Taxonomic classification: species must be inside correct genus/family context

## advantages

- More expressive than CFG
- Can model context-dependent constraints
- Captures complex real-world language phenomena

## limitations

- Generally PSPACE-complete: computationally expensive to parse
- Few efficient parsers exist for arbitrary CSGs
- Often approximated by simpler grammar types in practice
- Mostly studied theoretically; rarely used directly in practice

## misconceptions

- Context-sensitive does NOT mean the grammar is context-dependent in the human sense — it refers to the formal rule form
- The length requirement (|RHS| ≥ |LHS|) is what distinguishes Type 1 from Type 0 (unrestricted)
- Possibly allows S → ε as a special case if S doesn't appear on any RHS

## related concepts

- [[chomsky-hierarchy]] — Type 1 grammar in the hierarchy
- [[context-free-grammar]] — less powerful Type 2
- [[grammar]] — parent concept
- [[formal-language]] — CSGs generate context-sensitive languages
- [[pos-tagging]] — NLP application where CSG is relevant

## exam relevance
**medium** — understanding what CSG is, its position in Chomsky hierarchy, and key examples

## project relevance
Type checking and scoping in real compilers often require context-sensitive reasoning. While modern compilers don't use formal CSG machinery, understanding the theory explains why type checkers need symbol tables (storing context information).

---
**Scores:** Exam importance: 3/5 | Difficulty: 3/5 | Future usefulness: 4/5 | Project relevance: 3/5 | Interconnectedness: 4/5
