@def title = "The algebra of satisfiability"
@def published = "Mar. 2022" 
@def rss = "The algebra of satisfiability"


# The algebra of boolean satisfiability

> They who are acquainted with the present state of the theory of Symbolical Algebra, are aware, that the validity of the processes of analysis does not depend upon the interpretation of the symbols which are employed, but solely upon the laws of their combination.
-- _The Mathematical Analysis of Logic_, George Boole (1847)



Many roads lead to boolean _satisfiability_. In spite of its theoretical intractability and because of its surprising practical feasability, the problem has acquired a central importance in logic and computer science.

It is easy to state: given a Boolean formula $F$, does there exist an interpretation that satisfies $F$? In other words, it is the problem of determining if there exists an assignment of boolean values to the variables of $F$ that makes it true. 

Boolean satisfiability, which we will just write as SAT from now on, is the paradigmatic NP-complete problem. Despite this theoretical barrier, SAT-solving has undergone a revolution in this millenium, with modern solvers now able to handle instances containing hundreds of thousands or even millions of literals. 

What is there to say about SAT from an algebraic perspective? Surely everything has already been said a long time ago. George Boole worked out the algebraic laws of classical propositional logic in the 19th century. What could I possibly contribute here? Surely, most of what I have writen below is a reformulation of old ideas, in a new language. I am leaving this here in the hope that others with similar interests find them useful and beautiful. 

## SAT is not algebraic

Let's start with a remark that will be obvious to many, but was not for me at first:
*SAT is not a problem that can be stated in the algebraic theory of boolean algebras.* Let me explain.

An algebraic theory is a logical language in which we can form terms using variables and $n$-ary function symbols (including constants, which are just $0$-ary functions), and give axioms as equations between terms with free variables. A model of an algebraic theory is simply a set equipped with *bona-fide* functions of the appropriate arity interpreting each of the function symbols and satisfying the required axioms. 

Thanks to Boole, we know that classical propositional logic can be formulated as an *algebraic theory*, whose models are what we now call boolean algebras. 

There are several presentations of the algebraic theory of boolean algebras. One possible choice uses two binary function symbols $\lor,\land$ for disjunction and conjunction, one unary function symbol $\bar{\cdot}$ for negation, two constants $0,1$. The associated axioms are well-known and I won't list them all here. One example is that the conjunction of the same variable appearing twice, in positive and negative form, is equal to false:
$$x\land \bar{x} = 0$$
This is the algebraic counterpart of the propositional inference rule that allows us to derive a contradiction from... well, contradictory assumptions. Note that we can think of the free variables appearing in an axiom as implicitly *universally quantified*:
$$\forall x (x\land \bar{x} = 0)$$
This is because, in first-order logic, the two formulations make no difference in terms of what we can prove. Indeed, if we can prove a statement $P$ containing some free variable $x$ (meaning that we are not assuming anything about $x$), we can immediately derive a proof of $\forall x. P$. Conversely, if we have a proof of the $\forall x.P$, we can instantiate it by substituting any term into $x$.  

There are many other presentations of the algebraic theory of boolean algebras: for example, it is well-known that a single binary function denoting NAND suffices, albeit with much less intuitive axioms. Nevertheless, the *models* of these different theories are all the same.  



But wait -- didn't I say that we are only allowed to use terms involving free variables for axioms? Satisfiability involves some existential quantifiers, so it is not clear how we could state it in an algebraic theory. Given a term $f$ in the theory of boolean algebras, containing free variables $x_1,\dots, x_n$, the logical statement that $f$ is satisfiable is
$$\exists x_1\dots\exists x_n (f = 1)$$
which is outside of the algebraic realm. It is not difficult to see that this statement is equivalent to
$$\lnot(\forall x_1\dots\forall x_n (\bar{f} =0))$$
The first-order formula $\forall x_1\dots\forall x_n  \bar{f} =0$ can be seen as the equivalent unquantified statement $\bar{f} =0$ which *is* algebraic. So if we can prove $\bar{f} =0$, we know that $f$ is satisfiable. But if we cannot, this does not mean we have proven $\lnot(\forall x_1\dots\forall x_n \bar{f} =0)$. Not finding a proof of something is different from having a proof of its negation!

Hopefully this has convinced you that the algebraic theory of boolean algebras is insufficiently expressive to encode SAT as a statement in the theory itself. Of course, we can just use a first-order existential statement to encode it, and use the full might of first-order logic to reason about SAT instances. But I'm looking for something that is more closely tailored to SAT itself, sufficiently expressive to encode the problem, but not much more. More importantly, I am looking for a genuinely algebraic treatment, in which simple equational axioms are sufficient to derive the (un)satisfiability of any given instance.

I will show below that an algebraic treatment of SAT is possible, if we are willing to move to a different syntax. Unsurprisingly, this syntax will be diagrammatic.

## SAT is algebraic, diagrammatically

Why would we need a diagrammatic syntax? As we saw in the previous section, the algebraic theory of boolean algebras is insufficiently expressive. So we're looking for some more other formal system. Remember that the existential quantification is what gives SAT a particularly relational flavour: we are not simply evaluating boolean functions, but checking that there exists some assignment for which the function evaluates to true. This is a fundamentally relational, not functional constraint. In my experience, diagrammatic calculi are particularly well suited to express relational constraints. In fact, one way to think about string diagrams for relations is as a generalisation of standard algebraic syntax to the regular fragment of first-order logic, *i.e.* the fragment containing truth, conjunction, and existential quantification. In this setting, string diagrams have the advantage of highlighting key structural features, such as dependencies and connectivity between different sub-terms/diagrams.

We'll proceed in two steps. First I'll present a diagrammatic syntax in which we can represent SAT instances (and I will show how). Then, I will explain the algebraic laws that this language satisfies, which allow us to derive the (un)satisfiability of any given instance.

### A diagrammatic syntax for SAT

**The basic syntax.** The language I'll introduce now is a graphical notation for managing sets of boolean constraints expressed in *conjunctive normal form* (CNF), *i.e.* as a conjunction of disjunctions of literals. The constraints comes from setting the clauses appearing in the CNF formula to $1$. We will keep this implicit from now on, writing $(x_1\lor \bar x_2\lor x_3)\land (x_2\lor \bar x_1)$ instead of $(x_1\lor \bar x_2\lor x_3)\land (x_2\lor \bar x_1) = 1$. A diagram with $n$ dangling wires at the top and $m$ at the bottom is interpreted as a set of CNF formulas over the set of variables $y_1,\dots,y_m,x_1,\dots,x_n$. 

We have a few simple generating nodes, listed below.

- A piece of wire is used to encode an implication between two variables, from top to bottom: $\lnot y\lor x$. 
$$DIAGRAM$$
- A white node constrains the associated variables to satisfy $\lnot y_1 \lor \dots\lor \lnot y_n \lor x_1 \lor \dots \lor x_m$. A white node with only one bottom leg and no top leg represents the constraint $\lnot y_1$ (forces this variable to be false) and, conversely, a white node with a single top leg but no bottom leg, represents the constraint $x_1$ (which forces this variable to be true).  
$$DIAGRAM$$
- A ternary black node with two bottom legs can be thought of as copying its top leg and enforces $(\lnot y_1\lor x)\land (\lnot y_2\lor x)$
$$DIAGRAM$$
- A unary black node places no constraints on its only associated variable. 
$$DIAGRAM$$
We also need to explain how to interpret composite diagrams. 
- Placing any two diagram side by side (without connecting any of their wires) corresponds to taking the conjunction of all their constraints:
$$DIAGRAM$$ 
- Things get a bit more interesting when we connect two wires. This is interpreted by first identifying the two variables that share the same wire, and existentially quantifying over this variable: 
$$DIAGRAM$$

Oh, I almost forgot - we're allowed to cross wires however we like.


**Encoding SAT.** Given these generators and rules to compose them, we can represent any SAT instance as a diagram. Before giving you the general procedure, let's see it at work on two simple examples.

The first is $(\bar x\lor y)\land (x\lor \bar y)$. Here, we have two variables that appear in negative and positive forms. So we will need two white nodes -- one for $x,\bar x$ and one for $y,\bar y$, each with two bottom wires, to encode the relationship $x\lor \bar x$ and $y\lor \bar y$:
$$DIAGRAM$$
Each of these wires correspond to a literal that appears precisely once in one of the two clauses. We can just connect them directly to two white nodes representing each of the two clauses in $(\bar x\lor y)\land (x\lor \bar y)$. This gives:
$$DIAGRAM$$

For another example, let's consider the formula $(x\lor y)\land (\bar x\lor y)\land (x\lor \bar y)\land (\bar x\lor \bar y)$. Applying the same principle as above, we need two white nodes with two bottom wires each. We now have four clauses, so we will need four white nodes, each with two top wires for each of the variables appearing within the relevant clause:
$$DIAGRAM$$
Each literal appears in two clauses, so we have more wires at the bottom of the diagram than at the top. To deal with this, we can simply duplicate each of the wires to connect the corresponding literal to the appropriate clause and get the diagram encoding the whole SAT instance:
$$DIAGRAM$$

From these two examples, it is clear how one can use the same idea to encode arbitrary SAT instances. First, juxtapose as many white nodes with two bottom wires (and no top wires) as there are variables in the formula. Then, for each clause add a white node with as many top wires as it contains literals (and no bottom wires). Finally, connect the clauses to literals, duplicating or discarding wires where necessary. This takes the following form:
$$DIAGRAM$$ 

## Algebraic axioms for SAT

We don't just want to draw SAT instances as diagrams in this syntax; we would also like to reason about them diarectly at the level of the diagrams themselves. In particular, we would like to derive their (un)satisfiability purely equationally, as we do when reasoning about standard algebraic syntax using axioms.

The axioms we'll need all take the form of equations between diagrams with potentially dangling wires. This is the diagrammatic counterpart of axioms between algebraic terms involving free variables. The difference is that a diagrammatic axiom can involve some composite diagram with wires that are *not* dangling. At the semantic leve, this allows us to specify equations that involve existentially quantified variables, when at the syntactic level we are reasoning purely equationally. This is where, in my opinion, lies the power of diagrammatic algebra.

Some of these axioms can look daunting for the uninitiated. But, like for algebraic theories, there is a recurring cast of familiar characters that one learns to recognise. First of all, as I explained earlier, the diagrammatic syntax generalises algebraic syntax so, if you're familiar with the latter, you will recognise the usual suspects, like monoids, semirings, or rings, some commutative, some idempotent etc. Diagrammatic syntax also allows us to speak about dual operations, like co-monoids, that can cohabit with their standard algebraic counterpart, and interact with them in different ways.

I'll introduce the cast progressively. 


