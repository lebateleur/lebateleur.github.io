+++
title = "Research"
hascode = true
date = Date(2019, 3, 22)
rss = "Robin Piedeleu's research (preprints and publications)"
+++
@def tags = ["syntax", "code"]

# Published papers & work in progress

\toc

## Preprints

### Graphical Piecewise-Linear Algebra
with [Guillaume Boisseau](https://www.cs.ox.ac.uk/people/guillaume.boisseau/), submitted to FoSSaCS'22 -- ArXiv version coming soon.

Graphical (Linear) Algebra is a family of diagrammatic languages allowing to reason about different kinds of subsets of vector spaces compositionally. It has been used to model various application domains,
from signal-flow graphs to Petri nets and electrical circuits. In this paper,
we introduce to the family its most expressive member to date: Graphical Piecewise-Linear Algebra, a new language to specify piecewise-linear subsets of vector spaces.
Like the previous members of the family, it comes with a complete axiomatisation, which means it can be used to reason about the corresponding semantic domain purely equationally, forgetting the set-theoretic
interpretation. We show completeness using a single axiom on top of Graphical Polyhedral Algebra, and show that this extension is the small-
est that can capture a variety of relevant constructs.
Finally, we showcase its use by modelling the behaviour of stateless electronic circuits of ideal elements, a domain that had remained outside the
remit of previous diagrammatic languages.

### A Finite Axiomatisation of Automata using String Diagrams
with [Fabio Zanasi](https://www.zanasi.com/fabio/), submitted to LMCS Special Issue -- [PDF](https://piedeleu.com/publications/diagrammatic-automata-lmcs-submission.pdf), ArXiv version coming soon.

We develop a fully diagrammatic approach to finite-state automata, based on reinterpreting their usual state-transition graphical representation as a two-dimensional
syntax of string diagrams. In this setting, we are able to provide a complete equational theory for language equivalence, with two notable features. First, the proposed axiomatisation is finite. Second, the Kleene star is a derived concept, as it can be decomposed into more
primitive algebraic blocks.

**This is the journal version of our FoSSaCS'21 paper. It corrects a fundamental mistake in the conference version (see erratum below).**


## Conference papers


### A String Diagrammatic Axiomatisation of Finite-State Automata
with [Fabio Zanasi](https://www.zanasi.com/fabio/), FoSSaCS '21 -- [ArXiv preprint](https://arxiv.org/abs/2009.14576), [DOI](https://doi.org/10.1007/978-3-030-71995-1_24)

We develop a fully diagrammatic approach to the theory of finite-state automata, based on reinterpreting their usual state-transition graphical representation as a two-dimensional syntax of string diagrams. Moreover, we provide an equational theory that completely axiomatises language equivalence in this new setting. The proposed axiomatisation is finitary -- a result which is provably impossible to obtain for the one-dimensional syntax of regular expressions.


**ERRATUM.**  Unfortunately, this paper contains a mistake in the completeness proof. The implementation of determinisation via equational reasoning does not work as expected in full generality. As a result, we cannot claim completeness of the proposed equational theory. However, it is sill possible to obtain a finite axiomatisation via another route: we have devised an extended syntax equipped with a finite equational theory that is sufficient to prove language equivalence for all diagrams corresponding to automata (*i.e.* completeness for the fragment of interest). This axiomatisation will appear in a subsequent journal version of the paper and on the arXiv soon.

### Contextual Equivalence for Signal Flow Graphs
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  FOSSACS '20 -- [ArXiv preprint](https://arxiv.org/abs/2002.08874), [DOI](https://doi.org/10.1007/978-3-030-45231-5_5)

We extend the signal flow calculus---a compositional account of the classical signal flow graph model of computation---to encompass affine behaviour, and furnish it with a novel operational semantics. The increased expressive power allows us to define a canonical notion of contextual equivalence, which we show to coincide with denotational equality. Finally, we characterise the realisable fragment of the calculus: those terms that express the computations of (affine) signal flow graphs.


### Bialgebraic Semantics for String Diagrams
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  CONCUR '19 -- [ArXiv preprint](https://arxiv.org/abs/1906.01519), [DOI]()

Turi and Plotkin's bialgebraic semantics is an abstract approach to specifying the operational semantics of a system, by means of a distributive law between its syntax (encoded as a monad) and its dynamics (an endofunctor). This setup is instrumental in showing that a semantic specification (a coalgebra) satisfies desirable properties: in particular, that it is compositional. In this work, we use the bialgebraic approach to derive well-behaved structural operational semantics of string diagrams, a graphical syntax that is increasingly used in the study of interacting systems across different disciplines. Our analysis relies on representing the two-dimensional operations underlying string diagrams in various categories as a monad, and their bialgebraic semantics in terms of a distributive law for that monad. 

### Graphical Affine Algebra
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  LiCS '19  -- [PDF](https://piedeleu.com/publications/BPSZ-lics19.pdf), [DOI](https://doi.org/10.1109/LICS.2019.8785877)

Graphical linear algebra is a diagrammatic language allowing to reason compositionally about different types of linear computing devices. In this paper, we extend this formalism with a connector for affine behaviour. The extension, which we call graphical affine algebra, is simple but remarkably powerful: it can model systems with richer patterns of behaviour such as mutual exclusion---with modules over the natural numbers as semantic domain---or non-passive electrical components---when considering modules over a certain field. Our main technical contribution is a complete axiomatisation for graphical affine algebra over these two interpretations. We also show, as case studies, how graphical affine algebra captures electrical circuits and the calculus of stateless connectors---a coordination language for distributed systems.

### Diagrammatic Algebra: from Linear to Concurrent Systems
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), Josh Holland, [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/),  POPL'19 -- [PDF](https://piedeleu.com/publications/BHPSZ-popl19.pdf), [DOI](https://doi.org/10.1145/3290338)

We introduce the resource calculus, a string diagrammatic language for concurrent systems. Significantly, it uses the same syntax and operational semantics as the signal flow calculus --- an algebraic formalism for signal flow graphs, which is a combinatorial model of computation of interest in control theory. Indeed, our approach stems from the simple but fruitful observation that, by replacing real numbers (modelling signals) with natural numbers (modelling resources) in the operational semantics, concurrent behaviour patterns emerge. The resource calculus is canonical: we equip it and its stateful extension with equational theories that characterise the underlying space of definable behaviours---a convex algebraic universe of additive relations---via isomorphisms of categories. Finally, we demonstrate that our calculus is sufficiently expressive to capture behaviour definable by classical Petri nets.

## Journal papers

### Bialgebraic Foundations for the Operational Semantics of String Diagrams
with [Filippo Bonchi](https://scholar.google.com/citations?user=RMy4gDsAAAAJ&hl=en), [Paweł Sobociński](https://www.ioc.ee/~pawel/) and [Fabio Zanasi](https://www.zanasi.com/fabio/) -- [DOI](https://doi.org/10.1016/j.ic.2021.104767)

This is the journal version of [our CONCUR '19 paper](#bialgebraic_semantics_for_string_diagrams).

## PhD thesis: Picturing Resources in Concurrency

[PDF](https://piedeleu.com/publications/thesis.pdf)





