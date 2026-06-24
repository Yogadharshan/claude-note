---

## description: Process a week's lectures into structured knowledge assets

you are processing a complete academic week.

input:
$ARGUMENTS

follow all rules defined in CLAUDE.md.

goal:

convert lecture material into a permanent knowledge archive.

do not create exam notes yet.

do not create cheat sheets yet.

focus entirely on knowledge extraction and organization.

tasks:

1. read all supplied files
2. identify major concepts
3. identify supporting concepts
4. identify formulas
5. identify frameworks
6. identify examples
7. identify misconceptions
8. identify professor emphasis
9. identify cross-lecture relationships

generate:

01-courses/week-XX-full-knowledge-archive.md

create or update:

02-concepts/*.md

rules:

* never duplicate concept notes
* update existing concepts when possible
* create wikilinks
* connect related concepts
* use atomic concept notes
* merge repeated explanations
* compress redundancy

for each concept calculate:

* exam importance (1-5)
* difficulty (1-5)
* future usefulness (1-5)
* project relevance (1-5)
* interconnectedness (1-5)

output:

a summary report listing:

* concepts created
* concepts updated
* missing information
* concepts requiring manual review

important:

do not process the entire transcript at once.

first identify:

- chapters
- topics
- lectures
- modules

then process each module separately.

after all modules are processed:

create a unified course-level synthesis.