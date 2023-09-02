// File: AST Construction for Natural Deduction Proof Checker
// Author: Ramneet Singh, IIT Delhi
// Developed for COL703 (Logic for CS) at IIT Delhi, Sem I '23-24
// ================
// 
// This program designs a grammar for a Fitch-style natural deduction proof, meant
// for the purpose of checking if the proof is correct or not.
// 
// The first line of the input proof file will always be the sequent whose validity
// is being proven. The second line will be an empty line, and the proof will begin
// from the third line. Each line of the proof will have an explanation preceeding 
// the proof statement. The explanations can only be of the following forms (where 
// i, j, k, l, m, n denote line numbers in the proof file, as expected): [premise],
// [assumption], [copy i], [mp i, j], [mt i, j], [and-in i, j], [and-e1 i],
// [and-e2 i], [or-in1 i], [or-in2 i], [or-el i, j-k, l-m], [impl-in i-j],
// [neg-in i-j], [neg-el i, j], [bot-el i], [dneg-in i], [dneg-el i], [pbc i-j],
// [lem].
// 
// The keywords are self-explanatory, and the precise interpretation of these rules
// can be found in Chapter 1 of the book by Huth and Ryan. Please also note that we
// will denote the logical symbols \\land and \\lor using backward and forward
// slashes, \\neg using the ! symbol, \\rightarrow using ->, and \\vdash using |-
// in the text file.

start: sequent proof -> natded

sequent: formula "|-" formula -> sequent

proof: proof_line* -> proof

proof_line: "[" explanation "]" formula -> proof_line

explanation:  "premise" -> premise
            | "assumption" -> assumption
            | "copy" NUMBER -> copy_op
            | "mp" NUMBER "," NUMBER -> modus_ponens
            | "and-in" NUMBER "," NUMBER -> and_intro
            | "and-e1" NUMBER -> and_elim1
            | "and-e2" NUMBER -> and_elim2
            | "or-in1" NUMBER -> or_intro1
            | "or-in2" NUMBER -> or_intro2
            | "or-el" NUMBER "," range "," range -> or_elim
            | "impl-in" range -> impl_intro
            | "neg-in" range -> neg_intro
            | "neg-el" NUMBER "," NUMBER -> neg_elim
            | "bot-el" NUMBER -> bot_elim
            | "dneg-in" NUMBER -> d_neg_intro
            | "dneg-el" NUMBER -> d_neg_elim
            | "pbc" range -> proof_by_contra
            | "lem" -> lem

range: NUMBER "-" NUMBER -> num_range

formula: APROP -> atomic_prop
        | "(" formula "/\\" formula ")" -> and_op
        | "(" formula "\\/" formula ")" -> or_op
        | "(" formula "->" formula ")" -> implies_op
        | "("  "!" formula ")" -> not_op

LCASE_LETTER: "a".."z"
UCASE_LETTER: "A".."Z"

LETTER: UCASE_LETTER | LCASE_LETTER
WORD: LETTER+

APROP: ("_"|LETTER) ("_"|LETTER|DIGIT)*

DIGIT: "0".."9"
HEXDIGIT: "a".."f"|"A".."F"|DIGIT

NUMBER: DIGIT+

WS: /[ \t\f\r\n]/+

%ignore WS
