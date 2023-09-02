# Lark Grammar for Natural Deduction Proof Checker

- **Author**: Ramneet Singh, IIT Delhi

- Developed for [COL703 (Logic for CS) at IIT Delhi, Sem I '23-24](
https://kumarmadhukar.github.io/courses/logic-diwali23/index.html
)

## Description

This file describes a grammar for a Fitch-style natural deduction proof, meant
for the purpose of checking if the proof is correct or not. The grammar is to be
used with the [lark](https://github.com/lark-parser/lark) parser toolkit for
assignment 1 in the course.

## Proof File Syntax

The first line of the input proof file will always be the sequent whose validity
is being proven. The second line will be an empty line, and the proof will begin
from the third line. Each line of the proof will have an explanation preceeding 
the proof statement. The explanations can only be of the following forms (where 
i, j, k, l, m, n denote line numbers in the proof file, as expected): [premise],
[assumption], [copy i], [mp i, j], [mt i, j], [and-in i, j], [and-e1 i],
[and-e2 i], [or-in1 i], [or-in2 i], [or-el i, j-k, l-m], [impl-in i-j],
[neg-in i-j], [neg-el i, j], [bot-el i], [dneg-in i], [dneg-el i], [pbc i-j],
[lem].

The keywords are self-explanatory, and the precise interpretation of these rules
can be found in Chapter 1 of the book by Huth and Ryan. Please also note that we
will denote the logical symbols \\land and \\lor using backward and forward
slashes, \\neg using the ! symbol, \\rightarrow using ->, \\bot using \\bot and
\\vdash using |- in the text file.

## Instructions for Students

The file is meant to be used with [lark](https://github.com/lark-parser/lark) to
construct a standalone parser, which you can further use in your solution for 
assignment 1. Remember that we will not install any modules (including `lark`), 
so you *need* to create a  standalone parser *if* you choose to use this grammar.
You may find the following tutorials helpful:

- [Guide to the Standalone Tool](https://lark-parser.readthedocs.io/en/stable/examples/index.html#standalone-example)

- [JSON Parser - Tutorial](https://lark-parser.readthedocs.io/en/stable/json_tutorial.html)
