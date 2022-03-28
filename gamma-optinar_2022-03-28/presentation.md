# About
Modeling problems with propositional and first-order logic, and searching for satisfiable solutions.

Understanding logic is useful for understanding how to formulate constraints for optimization problems.


# Satisfiability (SAT)
Model problem with propositional logic.

Satisfiability aims to find assignment for variables that make the formula true.

---

Formulas consists of

* boolean constants:
  * false $⊥$
  * true $⊤$
* boolean variables:
  * $x∈\{⊥,⊤\}$
* connectives: 
  * and $∧$
  * or $∨$
  * not $¬$

There are also other useful connectives such as
  * implication $→$
  * bi-implication $↔$
  * xor $⊗$

These can be written in terms of "and", "or", and "not" connectives.

---

**Example**: Formula

$$ϕ≡(x_1 ∧ x_2) ∨ ¬x_3$$

with variables

$$x_1,x_2,x_3∈\{⊥,⊤\}$$

has a satisfying solutions such as 

$$(x_1:=⊤,x_2:=⊤,x_3:=⊤)$$

and

$$(x_1:=⊥,x_2:=⊤,x_3:=⊥).$$

---

In practice, formulas are reduced to a conjuctive normal form (CNF) and solved with Conflict-Driven Clause Learning (CDCL) algorithm.


# Constraint Programming (CP)
Constraint programming (CP) is generalization of satisfiability.

---

Variables:

* $y∈N$ have values from domain $N⊆ℤ$ which is a **finite** subset of integers.

---

Example: Constraints

* $y_1+y_2≤y_3$
* $y_1⋅y_2=y_3$
* $\texttt{alldifferent}(y_1,y_2,y_3)$ 
  * We call this a global constraint.
  * There are many different types of global constraints and efficient algorithms for them.
  * Logically equivalent to $(y_1≠y_2) ∧ (y_1≠y_3) ∧ (y_2≠y_3)$

---

Connection to satisfiability:

* Think about a constraints above as boolean variables. 
  * $x_1≡(x_1+y_2≤y_3)$
  * $x_2≡(y_1⋅y_2=y_3)$
  * $x_3≡\texttt{alldifferent}(y_1,y_2,y_3).$

* Use the boolean variable to form a formula, such as $ϕ≡(x_1∧x_2)∨x_3.$

* Solve the formula for satisfiability.

--- 

Example: Modeling all permutations of sequence $(1,2,3).$

Variables: 

$$y_1,y_2,y_3∈\{1,2,3\}$$

Constraints:

$$\texttt{alldifferent}(y_1,y_2,y_3)$$

Now, all satisfying assignments for variables $(y_1,y_2,y_3)$ form a permutation of sequence $(1,2,3).$


# Combinatorial Optimization (COP)
We can form a combinatorial optimization problem (COP) by adding an objective function to constrain program (CP).

---

Example: By expanding the previous example with distance function $d:N×N→ℕ,$ we can write the Traveling Salesman Problem (TSP) as follows:

Variables: 

$$y_1,y_2,...,y_n∈N=\{1,2,...,n\}$$

Constraints:

$$\texttt{alldifferent}(y_1,y_2,...,y_n)$$

Objective:

$$\min \left(∑_{i=1}^{n-1} d(y_{i},y_{i+1}) + d(y_n,y_1)\right)$$

---

We can use the **MiniZinc** modeling language for modeling.

The **Google OR-Tools** solver is effective for solving combinatorial optimization problems.
