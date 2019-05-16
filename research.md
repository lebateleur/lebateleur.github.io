---
layout: page
title: Papers
sidebar_link: true
---


<p class="message">
Click on the titles to see the abstract.
</p>


## 2019
<ul>
<details><summary><strong>Graphical Affine Algebra</strong></summary><p>Graphical linear algebra is a diagrammatic language allowing to reason compositionally about different types of linear computing devices. In this paper, we extend this formalism with a connector for <em>affine</em> behaviour. The extension, which we call graphical affine algebra, is simple but remarkably powerful: it can model systems with richer patterns of behaviour such as mutual exclusion---with modules over the natural numbers as semantic domain---or non-passive electrical components---when considering modules over a certain field. Our main technical contribution is a complete axiomatisation for graphical affine algebra over these two interpretations. We also show, as case studies, how graphical affine algebra captures electrical circuits and the calculus of stateless connectors---a coordination language for distributed systems.</p>
</details><em>with Filippo Bonchi, Paweł Sobociński and Fabio Zanasi,&nbsp; </em><em><a href="http://lics.siglog.org/lics19/">LICS'19</a>. <br /></em><em><a href="publications/BPSZ-lics19.pdf">PDF</a> </em>
</ul>

<ul>
<details><summary><strong>Diagrammatic Algebra: from Linear to Concurrent Systems</strong></summary><p>We introduce the resource calculus, a string diagrammatic language for concurrent systems. Significantly, it uses the same syntax and operational semantics as the signal flow calculus --- an algebraic formalism for signal flow graphs, which is a combinatorial model of computation of interest in control theory. Indeed, our approach stems from the simple but fruitful observation that, by replacing real numbers (modelling signals) with natural numbers (modelling resources) in the operational semantics, concurrent behaviour patterns emerge. 

The resource calculus is canonical: we equip it and its stateful extension with equational theories that characterise the underlying space of definable behaviours---a convex algebraic universe of additive relations---via isomorphisms of categories. 
Finally, we demonstrate that our calculus is sufficiently expressive to capture behaviour definable by classical Petri nets.</p>
</details><em>with Filippo Bonchi, Josh Holland, Paweł Sobociński and Fabio Zanasi,&nbsp; </em><em><a href="https://popl19.sigplan.org/">POPL'19</a>. <br /></em><em><a href="publications/BHPSZ-popl19.pdf">PDF</a> &middot; <a href="slides/popl19.pdf">Slides</a> </em>
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


