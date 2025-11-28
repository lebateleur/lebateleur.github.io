+++
title = "Research"
hascode = true
date = Date(2019, 3, 22)
rss = "Robin Piedeleu's research (preprints and publications)"
+++
@def tags = ["syntax", "code"]

# Papers & work in progress

\toc

## Preprints

**The Algebra of Parity Games** -- [ArXiv](https://arxiv.org/abs/2501.18499)
 
In recent work, Watanabe, Eberhart, Asada, and Hasuo have shown that parity games can be seen as string diagrams, that is, as the morphisms of a symmetric monoidal category, an algebraic structure with two different operations of composition. Furthermore, they have shown that the winning regions associated to a given game can be computed functorially, i.e. compositionally. Building on their results, this paper focuses on the equational properties of parity games, giving them a sound and complete axiomatisation. The payoff is that any parity game can be solved using equational reasoning directly at the level of the string diagram that represents it. Finally, we translate the diagrammatic language of parity games to an equally expressive symbolic calculus with fixpoints, and equip it with its own equational theory. 

    
## Conference papers


**Graphical Quadratic Algebra** with [Dario Stein](https://dario-stein.de/), [Fabio Zanasi](https://www.zanasi.com/fabio/), and Richard Samuelson, ICTAC 2025 (_Best Paper Award_) -- [ArXiv](https://arxiv.org/abs/2403.02284) 


We introduce Graphical Quadratic Algebra (GQA), a string diagrammatic calculus extending the language of Graphical Affine Algebra with a new generator characterised by invariance under rotation matrices. We show that GQA is a sound and complete axiomatisation for three different models: quadratic relations, which are a compositional formalism for least-squares problems, Gaussian stochastic processes, and Gaussian stochastic processes extended with non-determinisms. The equational theory of GQA sheds light on the connections between these perspectives, giving an algebraic interpretation to the interplay of stochastic behaviour, relational behaviour, non-determinism, and conditioning. As applications, we discuss various case studies, including linear regression, probabilistic programming, and electrical circuits with realistic (noisy) components. 


**A Complete Axiomatisation of Equivalence for Discrete Probabilistic Programming** with Mateo Torres-Ruiz, [Alexandra Silva](https://alexandrasilva.org), and [Fabio Zanasi](https://www.zanasi.com/fabio/), ESOP '25 -- [ArXiv](https://arxiv.org/abs/2408.14701)

We introduce a sound and complete equational theory capturing equivalence of discrete probabilistic programs, that is, programs extended with primitives for Bernoulli distributions and conditioning, to model distributions over finite sets of events. To do so, we translate these programs into a graphical syntax of probabilistic circuits, formalised as string diagrams, the two-dimensional syntax of symmetric monoidal categories. We then prove a first completeness result for the equational theory of the conditioning-free fragment of our syntax. Finally, we extend this result to a complete equational theory for the entire language. Note these developments are also of interest for the development of probability theory in Markov categories: our first result gives a presentation by generators and equations of the category of Markov kernels, restricted to objects that are powers of the two-elements set. 

**A Complete Diagrammatic Calculus for Automata Simulation** with Thibaut Antoine, [Alexandra Silva](https://alexandrasilva.org), and [Fabio Zanasi](https://www.zanasi.com/fabio/), CSL '25 -- [DOI](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.CSL.2025.27)

We give a sound and complete (in)equational theory for simulation of finite state automata. Our approach uses a string diagrammatic calculus to represent automata and a functorial semantics to capture simulation in a compositional way. Interestingly, in contrast to other approaches based on regular expressions, fixpoints are a derived notion in our calculus and the resulting axiomatisation is finitary.

**On Iteration in Discrete Probabilistic Programming** with Mateo Torres-Ruiz, [Alexandra Silva](https://alexandrasilva.org), and [Fabio Zanasi](https://www.zanasi.com/fabio/), FSCD '24 -- [DOI](https://doi.org/10.4230/LIPIcs.FSCD.2024.20)

Discrete probabilistic programming languages provide an expressive tool for representing and reasoning about probabilistic models. These languages typically define the semantics of a program through its posterior distribution, obtained through exact inference techniques.
While the semantics of standard programming constructs in this context is well understood, there is a gap in extending these languages with tools to reason about the asymptotic behaviour of programs. In this paper, we introduce unbounded iteration in the context of a discrete probabilistic programming language, give it a semantics, and show how to compute it exactly. This allows us to express the stationary distribution of a probabilistic function while preserving the efficiency of exact inference techniques. We discuss the advantages and limitations of our approach, showcasing their practical utility by considering examples where bounded iteration poses a challenge due to the inherent difficulty of assessing the proximity of a distribution to its stationary point.

**A Complete Diagrammatic Calculus for Boolean Satisfiability**
with Tao Gu and [Fabio Zanasi](https://www.zanasi.com/fabio/), MFPS '22 -- [ArXiv](https://arxiv.org/abs/2211.12629)

We propose a diagrammatic calculus to reason about satisfiability of Boolean formulas, and prove it to be sound and complete. We then showcase our calculus in a few case studies. First, we consider the relationship of our calculus with resolution proof systems and modern SAT-solving heuristics. Second, we consider Horn clauses, which leads us to a new decision method for propositional logic programs equivalence under Herbrand model semantics.

**Graphical Piecewise-Linear Algebra**,
with [Guillaume Boisseau](https://www.cs.ox.ac.uk/people/guillaume.boisseau/), FoSSaCS'22 -- [ArXiv](https://arxiv.org/abs/2111.03956)

Graphical (Linear) Algebra is a family of diagrammatic languages allowing to reason about different kinds of subsets of vector spaces compositionally. It has been used to model various application domains,
from signal-flow graphs to Petri nets and electrical circuits. In this paper,
we introduce to the family its most expressive member to date: Graphical Piecewise-Linear Algebra, a new language to specify piecewise-linear subsets of vector spaces.
Like the previous members of the family, it comes with a complete axiomatisation, which means it can be used to reason about the corresponding semantic domain purely equationally, forgetting the set-theoretic
interpretation. We show completeness using a single axiom on top of Graphical Polyhedral Algebra, and show that this extension is the small-
est that can capture a variety of relevant constructs.
Finally, we showcase its use by modelling the behaviour of stateless electronic circuits of ideal elements, a domain that had remained outside the
remit of previous diagrammatic languages.

**A String Diagrammatic Axiomatisation of Finite-State Automata**,
with [Fabio Zanasi](https://www.zanasi.com/fabio/), FoSSaCS '21 -- [ArXiv](https://arxiv.org/abs/2009.14576), [DOI](https://doi.org/10.1007/978-3-030-71995-1_24)

We develop a fully diagrammatic approach to the theory of finite-state automata, based on reinterpreting their usual state-transition graphical representation as a two-dimensional syntax of string diagrams. Moreover, we provide an equational theory that completely axiomatises language equivalence in this new setting. The proposed axiomatisation is finitary -- a result which is provably impossible to obtain for the one-dimensional syntax of regular expressions.


**ERRATUM.**  Unfortunately, this paper contains a mistake in the completeness proof. The implementation of determinisation via equational reasoning does not work as expected in full generality. As a result, we cannot claim completeness of the proposed equational theory. However, it is sill possible to obtain a finite axiomatisation via another route: we have devised an extended syntax equipped with a finite equational theory that is sufficient to prove language equivalence for all diagrams corresponding to automata (*i.e.* completeness for the fragment of interest). This axiomatisation has been accepted for publication in LMCS (see [Journal articles](#journal_papers) below) and can be found on the [ArXiv](https://arxiv.org/abs/2211.16484).

**Contextual Equivalence for Signal Flow Graphs**,
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  FOSSACS '20 -- [ArXiv](https://arxiv.org/abs/2002.08874), [DOI](https://doi.org/10.1007/978-3-030-45231-5_5)

We extend the signal flow calculus---a compositional account of the classical signal flow graph model of computation---to encompass affine behaviour, and furnish it with a novel operational semantics. The increased expressive power allows us to define a canonical notion of contextual equivalence, which we show to coincide with denotational equality. Finally, we characterise the realisable fragment of the calculus: those terms that express the computations of (affine) signal flow graphs.


**Bialgebraic Semantics for String Diagrams**,
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  CONCUR '19 -- [ArXiv](https://arxiv.org/abs/1906.01519), [DOI]()

Turi and Plotkin's bialgebraic semantics is an abstract approach to specifying the operational semantics of a system, by means of a distributive law between its syntax (encoded as a monad) and its dynamics (an endofunctor). This setup is instrumental in showing that a semantic specification (a coalgebra) satisfies desirable properties: in particular, that it is compositional. In this work, we use the bialgebraic approach to derive well-behaved structural operational semantics of string diagrams, a graphical syntax that is increasingly used in the study of interacting systems across different disciplines. Our analysis relies on representing the two-dimensional operations underlying string diagrams in various categories as a monad, and their bialgebraic semantics in terms of a distributive law for that monad. 

**Graphical Affine Algebra**,
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  LiCS '19  -- [PDF](https://piedeleu.com/publications/BPSZ-lics19.pdf), [DOI](https://doi.org/10.1109/LICS.2019.8785877)

Graphical linear algebra is a diagrammatic language allowing to reason compositionally about different types of linear computing devices. In this paper, we extend this formalism with a connector for affine behaviour. The extension, which we call graphical affine algebra, is simple but remarkably powerful: it can model systems with richer patterns of behaviour such as mutual exclusion---with modules over the natural numbers as semantic domain---or non-passive electrical components---when considering modules over a certain field. Our main technical contribution is a complete axiomatisation for graphical affine algebra over these two interpretations. We also show, as case studies, how graphical affine algebra captures electrical circuits and the calculus of stateless connectors---a coordination language for distributed systems.

**Diagrammatic Algebra: from Linear to Concurrent Systems**,
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), Josh Holland, [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  POPL'19 -- [PDF](https://piedeleu.com/publications/BHPSZ-popl19.pdf), [DOI](https://doi.org/10.1145/3290338)

We introduce the resource calculus, a string diagrammatic language for concurrent systems. Significantly, it uses the same syntax and operational semantics as the signal flow calculus --- an algebraic formalism for signal flow graphs, which is a combinatorial model of computation of interest in control theory. Indeed, our approach stems from the simple but fruitful observation that, by replacing real numbers (modelling signals) with natural numbers (modelling resources) in the operational semantics, concurrent behaviour patterns emerge. The resource calculus is canonical: we equip it and its stateful extension with equational theories that characterise the underlying space of definable behaviours---a convex algebraic universe of additive relations---via isomorphisms of categories. Finally, we demonstrate that our calculus is sufficiently expressive to capture behaviour definable by classical Petri nets.

## Journal papers

**Rewriting for Symmetric Monoidal Categories with Commutative (Co)Monoid Structure** with Aleksandar Milosavljevic, and [Fabio Zanasi](https://www.zanasi.com/fabio/), LMCS -- [DOI](https://doi.org/10.46298/lmcs-21(1:12)2025), [ArXiv](https://arxiv.org/abs/2204.04274)

String diagrams are pictorial representations for morphisms of symmetric monoidal categories. They constitute an intuitive and expressive graphical syntax, which has found application in a very diverse range of fields including concurrency theory, quantum computing, control theory, machine learning, linguistics, and digital circuits. Rewriting theory for string diagrams relies on a combinatorial interpretation as double-pushout rewriting of certain hypergraphs. As previously studied, there is a 'tension' in this interpretation: in order to make it sound and complete, we either need to add structure on string diagrams (in particular, Frobenius algebra structure) or pose restrictions on double-pushout rewriting (resulting in 'convex' rewriting). From the string diagram viewpoint, imposing a full Frobenius structure may not always be natural or desirable in applications, which motivates our study of a weaker requirement: commutative monoid structure. In this work we characterise string diagram rewriting modulo commutative monoid equations, via a sound and complete interpretation in a suitable notion of double-pushout rewriting of hypergraphs. 

**A Finite Axiomatisation of Automata using String Diagrams**,
with [Fabio Zanasi](https://www.zanasi.com/fabio/), LMCS (Special Issue) -- [ArXiv](https://arxiv.org/abs/2211.16484)

We develop a fully diagrammatic approach to finite-state automata, based on reinterpreting their usual state-transition graphical representation as a two-dimensional
syntax of string diagrams. In this setting, we are able to provide a complete equational theory for language equivalence, with two notable features. First, the proposed axiomatisation is finite. Second, the Kleene star is a derived concept, as it can be decomposed into more primitive algebraic blocks.

**This is the journal version of our FoSSaCS'21 paper. It corrects a fundamental mistake in the conference version (see erratum above).**


**Bialgebraic Foundations for the Operational Semantics of String Diagrams**,
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/) -- [DOI](https://doi.org/10.1016/j.ic.2021.104767)

This is the journal version of [our CONCUR '19 paper](#bialgebraic_semantics_for_string_diagrams).

## Book

**_An Introduction to String Diagrams for Computer Scientists_**, with Fabio Zanasi -- Cambridge University Press (Elements in Applied Category Theory series), [Arxiv](https://arxiv.org/abs/2305.08768)

This document is an elementary introduction to string diagrams. It takes a computer science perspective: rather than using category theory as a starting point, we build on intuitions from formal language theory, treating string diagrams as a syntax with its semantics. After the basic theory, pointers are provided to contemporary applications of string diagrams in various fields of science.

## Theses

_Picturing Resources in Concurrency_. DPhil (PhD) thesis, University of Oxford, 2019 -- [PDF](https://piedeleu.com/publications/thesis.pdf)

_Ambiguity in Categorical Models of Meaning_. MSc thesis, University of Oxford, 2014 -- [PDF](https://www.cs.ox.ac.uk/people/bob.coecke/Robin.pdf)





