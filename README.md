# Compiler Construction Assignment: Lexical Analyzer

## Project Overview
This project implements a simple lexical analyzer (lexer) using **Flex/Lex** for a small custom language. It reads source code and identifies tokens such as keywords, identifiers, numbers, string literals, operators, and punctuation.

## Features
The lexer recognizes:

- **Keywords:** `start`, `end`, `let`, `if`, `show`
- **Operators:** `<=`, `=`, `+`, `*`
- **Punctuation:** `;`, `(`, `)`
- **Literals:** integer numbers and double-quoted strings
- **Identifiers:** names that begin with a letter and may contain letters, digits, or underscores
- **Whitespace:** spaces, tabs, and newlines are ignored
- **Unknown characters:** reported as `UNKNOWN`

## Project Files
- `asif.l` — Flex/Lex source file containing the token rules.
- `input.txt` — Sample source code used to test the lexer.
- `README.md` — Project documentation.
- `lex.yy.c` — Generated C source file, if included.
- `a.exe` — Compiled Windows executable, if included. You can omit this file if your instructor does not require it.

## Requirements
To regenerate and compile the lexer, install **Flex** and a compatible C compiler such as GCC. On Windows, these tools can be used through environments such as MSYS2 or a suitable Unix-like terminal.

## How to Build and Run

### Option 1: Run the existing Windows executable
If `a.exe` is compatible with your computer, place `input.txt` in the same folder and run:

```bash
..exe < input.txt
```

### Option 2: Generate and compile from the Flex source
Run these commands in a terminal where Flex and GCC are installed:

```bash
flex asif.l
gcc lex.yy.c -o lexer
```

Then run the lexer with the sample input:

```bash
./lexer < input.txt
```

On Windows, run the generated executable as:

```bash
lexer.exe < input.txt
```

## Sample Input

```text
start
let a;
a = 3*4+2;
show(a);
show("Tinny day");
if(a<=4)
show(a*a);
end
```

## Expected Behavior
When the lexer processes the sample input, it prints each recognized token and its category, for example:

```text
Lexer started...
KEYWORD_START: start
KEYWORD_LET: let
IDENTIFIER: a
SEMICOLON: ;
IDENTIFIER: a
OPERATOR_ASSIGN: =
NUMBER: 3
OPERATOR_MUL: *
NUMBER: 4
OPERATOR_PLUS: +
NUMBER: 2
SEMICOLON: ;
```

The complete output continues with the remaining tokens in the sample input.

## Notes
- The lexer recognizes tokens; it does not parse the program or execute its statements.
- The rules are case-sensitive, so `start` and `START` are treated differently.
- The identifier rule requires the first character to be a letter. Underscores are allowed after the first character.
- The sample input currently contains the string literal `"Tinny day"`; change it if a different test string is intended.

## Author
**Asif Siddique**

## Course
Compiler Construction
