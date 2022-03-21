@def title = "The algebra of satisfiability"
@def published = "Mar. 2022" 
@def rss = "The algebra of satisfiability"


# The algebra and geometry of boolean satisfiability

> They who are acquainted with the present state of the theory of Symbolical Algebra, are aware, that the validity of the processes of analysis does not depend upon the interpretation of the symbols which are employed, but solely upon the laws of their combination.
-- _The Mathematical Analysis of Logic_, George Boole (1847)



Many roads lead to the problem of boolean _satisfiability_. The question is so fundamental that, despite its theoretical intractability and because of its surprising practical feasability, it has acquired a central importance in logic and computer science. 

It is easy to state: given a Boolean formula $F$ (usually in conjuctive normal form, *i.e.* as a conjunction of disjunctions of literals), does there exist an interpretation that satisfies $F$? In other words, it is the problem of determining if there exists an assignment of boolean values to the variables of $F$ that makes it true. 

Boolean satisfiability, which we will just write as SAT from now on, is the paradigmatic NP-complete problem -- this is the celebrated Cook-Levin theorem. Despite this theoretical barrier, SAT-solving (this is the name for the field/industry dedicated to finding practical solutions to SAT) has undergone a revolution in this millenium, with modern solvers now able to handle instances with hundreds of thousands or even millions of literals. 

From an algebraic perspective, it seems that everything has already been said a long time ago. George Boole worked out the algebraic laws of classical propositional logic in the 19th century. What could I possibly write here that is new? 


## Graphical boolean algebra

In this post, I'll present a graphical syntax in which we can represent SAT instances, along with algebraic laws that are sound and complete for deriving their (un)satisfiability.


- A piece of wire is used to encode an implication between two variables, from top to bottom: $\lnot y\lor x$. 


- A white node constrains the associated variables to satisfy $\lnot y_1 \lor \dots\lor \lnot y_n \lor x_1 \lor \dots \lor x_m$.

- A ternary black node with two bottom legs can be thought of as copying its top leg and enforces $(\lnot y_1\lor x)\land (\lnot y_2\lor x)$

- A unary black node places no constraints on its only associated variable. 
