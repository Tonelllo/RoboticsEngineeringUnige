# Lessons report 2023/2024
# How to install Metric-FF
For Linux systems:
[Download from here](https://fai.cs.uni-saarland.de/hoffmann/ff/FF-v2.3-newlines-parse-goldman.tgz)
For the full documentation refer to:
[Main page](https://fai.cs.uni-saarland.de/hoffmann/ff.html)<br>
Inside the downloaded folder you will find the already built binary: `ff`. Put that in a folder inside your path, and you are
good to go.<br>
If you are asking yourself: path? What path? Then follow these steps:
- Open a terminal
- Type `echo $PATH`
- The output should be something like: `/usr/sbin:/usr/bin:/sbin:/bin`
- This is not the optimal way but now copy the `ff` executable inside `/usr/bin`. Please note that you will need root privileges to do that
- Done! You can use `ff` wherever you want

There is also a Windows version that you can find here:
https://fai.cs.uni-saarland.de/hoffmann/metric-ff.html
## 04/10/23
- Tseitin's encoding
- Truth tables
- Simplifications for formulas in CNF
- Resolution rule
- Variable elimination

## 05/10/23
- Resolution Rule
- Pseudo-code for implementation of this rule
- DPLL
## 11/10
- First order logic
- Introduction and limitations of propositional logic
- Terms, Constants, Variables, Function symbols, Quantifiers, Propositional Variables, Predicate Symbols
- Grounding and Atomic formulas to display the magnitude of the low-pass Gaussian filter:
- wffs
- Bounded and free formulas
- Syntax and semantics
- Examples of first order logic
- Functions and interpretations
## 12/10
- Slides 36-42
- Exercises on First order logic
- Models satisfiability, validity
- Logical equivalence
- Logical consequence

## 18/10
- Prenex normal form
- Conjunctive and disjunctive normal form
- skolem normal form
- Herbrand interpretation
- Herbrand and compactness theorem

## 08/11
- Examples of classical planning examples: dock example and block example
- PDDL introduction
## 09/11
- Lab on PDDL
- exercise on balls and blocks
## 15/11
- Finished blocks example
- Introduction to reinforcement learning
