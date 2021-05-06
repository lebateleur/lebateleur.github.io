---
layout: page
title: Papers
sidebar_link: true
---

## 2021

<ul>
<details><summary><strong>A String Diagrammatic Axiomatisation of Finite-State Automata</strong></summary><p>We develop a fully diagrammatic approach to the theory of finite-state automata, based on reinterpreting their usual state-transition graphical representation as a two-dimensional syntax of string diagrams. Moreover, we provide an equational theory that completely axiomatises language equivalence in this new setting. The proposed axiomatisation is finitary -- a result which is provably impossible to obtain for the one-dimensional syntax of regular expressions. <br><strong>ERRATUM.</strong> Unfortunately, this paper contains a mistake in the completeness proof. The implementation of determinisation via equational reasoning does not work as expected in full generality. As a result, we cannot claim completeness of the proposed equational theory. However, it is sill possible to obtain a finite axiomatisation: we have devised an alternative approach for an extended syntax equipped with a finite equational theory that is sufficient to prove language equivalence for all diagrams corresponding to automata (i.e. completeness for the fragment of interest). This axiomatisation will appear in a subsequent journal version of the paper and on the arXiv soon.</p>
</details><em>with Fabio Zanasi,&nbsp; </em><em><a href="https://etaps.org/user-profile/list-articles/449-fossacs-2021-accepted-papers">FOSSACS'21</a>. <br/></em><em><a href="https://arxiv.org/abs/2009.14576">Preprint</a> </em>
</ul>

## 2020

<ul>
<details><summary><strong>Contextual Equivalence for Signal Flow Graphs</strong></summary><p>We extend the signal flow calculus---a compositional account of the classical signal flow graph model of computation---to encompass affine behaviour, and furnish it with a novel operational semantics. The increased expressive power allows us to define a canonical notion of contextual equivalence, which we show to coincide with denotational equality. Finally, we characterise the realisable fragment of the calculus: those terms that express the computations of (affine) signal flow graphs.</p>
</details><em>with Filippo Bonchi, Paweł Sobociński and Fabio Zanasi,&nbsp; </em><em><a href="https://link.springer.com/chapter/10.1007%2F978-3-030-45231-5_5">FOSSACS'20</a>. <br /></em><em><a href="https://arxiv.org/abs/2002.08874">Preprint</a> </em>
</ul>


## 2019

<ul>
<details><summary><strong>Bialgebraic Semantics for String Diagrams</strong></summary><p>Turi and Plotkin's bialgebraic semantics is an abstract approach to specifying the operational semantics of a system, by means of a distributive law between its syntax (encoded as a monad) and its dynamics (an endofunctor). This setup is instrumental in showing that a semantic specification (a coalgebra) satisfies desirable properties: in particular, that it is compositional. 

In this work, we use the bialgebraic approach to derive well-behaved structural operational semantics of <em>string diagrams</em>, a graphical syntax that is increasingly used in the study of interacting systems across different disciplines. Our analysis relies on representing the two-dimensional operations underlying string diagrams in various categories as a monad, and their bialgebraic semantics in terms of a distributive law for that monad. </p>
</details><em>with Filippo Bonchi, Paweł Sobociński and Fabio Zanasi,&nbsp; </em><em><a href="https://event.cwi.nl/concur2019/">CONCUR'19</a>. <br /></em><em><a href="publications/BPSZ-concur19.pdf">PDF</a> </em>
</ul>

<ul>
<details><summary><strong>Graphical Affine Algebra</strong></summary><p>Graphical linear algebra is a diagrammatic language allowing to reason compositionally about different types of linear computing devices. In this paper, we extend this formalism with a connector for <em>affine</em> behaviour. The extension, which we call graphical affine algebra, is simple but remarkably powerful: it can model systems with richer patterns of behaviour such as mutual exclusion---with modules over the natural numbers as semantic domain---or non-passive electrical components---when considering modules over a certain field. Our main technical contribution is a complete axiomatisation for graphical affine algebra over these two interpretations. We also show, as case studies, how graphical affine algebra captures electrical circuits and the calculus of stateless connectors---a coordination language for distributed systems.</p>
</details><em>with Filippo Bonchi, Paweł Sobociński and Fabio Zanasi,&nbsp; </em><em><a href="http://lics.siglog.org/lics19/">LICS'19</a>. <br /></em><em><a href="publications/BPSZ-lics19.pdf">PDF</a> </em>
</ul>

<ul>
<details><summary><strong>Diagrammatic Algebra: from Linear to Concurrent Systems</strong></summary><p>We introduce the resource calculus, a string diagrammatic language for concurrent systems. Significantly, it uses the same syntax and operational semantics as the signal flow calculus --- an algebraic formalism for signal flow graphs, which is a combinatorial model of computation of interest in control theory. Indeed, our approach stems from the simple but fruitful observation that, by replacing real numbers (modelling signals) with natural numbers (modelling resources) in the operational semantics, concurrent behaviour patterns emerge. 

The resource calculus is canonical: we equip it and its stateful extension with equational theories that characterise the underlying space of definable behaviours---a convex algebraic universe of additive relations---via isomorphisms of categories. 
Finally, we demonstrate that our calculus is sufficiently expressive to capture behaviour definable by classical Petri nets.</p>
</details><em>with Filippo Bonchi, Josh Holland, Paweł Sobociński and Fabio Zanasi,&nbsp; </em><em><a href="https://popl19.sigplan.org/">POPL'19</a>. <br /></em><em><a href="publications/BHPSZ-popl19.pdf">PDF</a> &middot; <a href="https://doi.org/10.1145/3290338">DOI</a>  &middot; <a href="slides/popl19.pdf">Slides</a> </em>
</ul>


## 2018
<ul>
<details><summary><strong>Picturing Resources in Concurrency</strong></summary><p>Inspired by the pioneering work of Petri and the rise of diagrammatic formalisms
to reason about networks of open systems, we introduce the resource calculus—a
graphical language for distributed systems. Like process algebras, the resource calculus
is modular, with primitive connectors from which all diagrams can be built.
We characterise its equational theory by proving a full completeness result for an interpretation
in the symmetric monoidal category of additive relations—a result that
constitutes the main contribution of this thesis.</p>
<p>Additive relations are frequently exploited by model-checking algorithms for Petri
nets. In this thesis, we recognise them as a fundamental algebraic structure of concurrency
and use them as an axiomatic framework. Surprisingly, the resource calculus
has the same syntax as that of interacting Hopf algebras, a diagrammatic formalism
for linear (time-invariant dynamical) systems. Indeed, the approach stems from the
simple but fruitful realisation that, by replacing values in a field with values in the
semiring of non-negative integers, concurrent behaviour patterns emerge. This change
of model reflects the interpretation of diagrams as systems manipulating limited and
discrete resources instead of continuous signals.</p>
<p>
We also extend the resource calculus in two orthogonal directions. First, by adding
an affine primitive to express access to a constant quantity of resources. The extended
calculus is remarkably expressive and allows the formulation of non-additive patterns
of behaviour, like mutual exclusion. Once more, we characterise it—this time as the
equational theory of the symmetric monoidal category of polyhedral relations, discrete
analogues of polyhedra in convex geometry. Secondly, we add a synchronous register
to model stateful systems. The stateful resource calculus is expressive enough to
faithfully capture the behaviour of Petri nets while being strictly more expressive. It
is also shown to axiomatise a category of open Petri nets, in the style of the connector
algebras of nets with boundaries first studied by Bruni, Melgratti, Montanari and
Sobocinski.</p>
</details><em>PhD thesis. <br /></em><em><a href="publications/thesis.pdf">PDF</a></em>
</ul>


