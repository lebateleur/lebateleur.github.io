@def title = "String diagrams for the lambda-calculus?"
@def published = "Oct. 2021" 
@def rss = "A string-diagrammatic interpretation of the lambda-calculus"

# String diagrams for the $\lambda$-calculus?


Recently, on twitter, [Davidad re-discovered](https://twitter.com/davidad/status/1450417170375135234) a well-known graphical representation for terms of the $\lambda$-calculus, sometimes called sharing graphs or interaction nets. These graphical encodings have been the object of intense research for a long time. While it's not my area, I replied with a few tweets explaining some of the trade-offs of this approach as I saw it--from afar, admittedly. I concluded warning that these graphs are not usually understood as string diagrams, even if it is a natural question to ask: **can we find a symmetric monoidal category for which they are genuine string diagrams?** Crucially, can we do so in a way that respects the dynamic aspects of the $\lambda$-calculus, *i.e.* such that the graph-rewriting rules implementing $\beta$-reduction are valid equations in the underlying category?

This post gives one partial answer to this question. I will interpret diagrams as certain relations and show that $\beta$-reduction corresponds to inclusion of relations. The chosen semantics has the additional benefit of highlighting some of the issues that arise with copying/sharing of subterms during reduction. But before we get started, a word of warning: it is entirely possible that I am reinventing the wheel and I would love for someone to point me to the relevant papers if that is the case!

*Prerequisites.* In this note, I assume familiarity with string diagrams, monoidal categories, and basic facts about the $\lambda$-calculus. To brush up on the first topic, [Peter Selinger's survey](https://arxiv.org/abs/0908.3347) is a safe reference. 

\toc


## Relational profunctors

First, we need a symmetric monoidal category in which to interpret our diagrams. This will be the category of *relational profunctors*. While profunctors can be scary, relational profunctors are their friendlier, decategorified cousins. The category of relational profunctors has preordered sets as objects and monotone relations $R\subseteq X\times Y$ as morphisms $X\rightarrow Y$. A relation is monotone if whenever $(x,y)\in R$ and $x'\leq x$, $y \leq y'$ then $(x',y')\in R$. Composition in this category is the usual composition of binary relations, given by $R;S = \{(x,z) \,:\, \exists y.\, (x,y)\in R \land (y,z)\in S\}$, which we write in diagrammatic order. The identity on a preorder is none other than the order relation itself!


With the usual product of preorders -- the cartesian product of sets with the order on pairs given by $(x,y)\leq (x',y')$ iff $x\leq x'$ and $y\leq y'$ -- this category is symmetric monoidal, with unit for the monoidal product the singleton set $1$ with the only possible order. Great -- we have a canvas on which to draw string diagrams. In fact, it is a particularly nice setting because relational profunctors form a *compact closed* category: each object $X$ has a dual $X^{op}$ with the same underlying set but the opposite ordering, and arrows 
@@center
\figinline{/assets/img/cup.jpg}{4%}$: 1 \rightarrow X\times X^{op}$ given by $\{(\bullet, (x',x)) : x\leq x'\}$
@@
and
@@center
 \figinline{/assets/img/cap.jpg}{4.5%}$: X^{op}\times X\rightarrow 1$ given by $\{((x,x'),\bullet) : x\leq x'\}$
@@
satisfying the following intuitive equations[^1] :
@@center
\figenv{/assets/img/snake_eqs.jpg}{57%}
@@
An upward flowing wire denotes (the identity on) $X$, while a downward flowing wire denotes (the identity on) $X^{op}$.
The two equalities above relate an object to its dual and, diagrammatically, give us the ability to bend and straighten wires at will, as long as we preserve the overall directional flow[^2] and the connectivity of the different components.


@@warning 
*Warning for the categorically minded reader.* The product of preorders is the categorical product in the category of preorders and monotone *maps* but does not satisfy the corresponding universal property for relational profunctors (aka monotone *relations*). In fact, a compact closed category for which the monoidal product is the categorical product is necessarily a preorder, so the two properties are incompatible in this specific sense. 
@@

## Application and abstraction as adjoints

In order to interpret our diagrams as relational profunctors, we first fix a single object -- a preordered set $X$ -- equipped with a binary operation \figenv{/assets/img/app.jpg}{4%}$: X\times X \rightarrow X$. Note that we do not require that this relation be associative. You can think of $X$ as a preordered set containing $\Lambda$, the set of (closed) $\lambda$-terms ordered by the reflexive and transitive closure of $\rightarrow_\beta$. In this particular case, you can take \figenv{/assets/img/app.jpg}{4%} to be any monotone binary relation that restricts over $\Lambda$ to (the graph of) application of $\lambda$-terms, $\{((u,v),t) : uv \rightarrow^*_\beta t\}$. But we will prefer to work axiomatically, without committing to any specific model, simply requiring properties of $X$ as we need them. In fact, one reason we do not simply take $X=\Lambda$ is that we need our model to be better behaved than $\Lambda$, so we enlarge it to get the desired properties.  

We chose to work with relational profunctors because we can also ask for the existence of *adjoints* where we need them. 
@@remark
**Definition.** *(Adjunction for relational profunctors)* We say that $L: X\rightarrow Y$ is *left adjoint* to $R: Y\rightarrow X$ iff 
\[\label{adjoints}  R ; L \subseteq id_Y \quad  \text{and} \quad L ; R \subseteq id_X\]
where $\subseteq$ denotes the inclusion of relations (seen as subsets). 
@@


To interpret abstraction we need a right adjoint to 
\figenv{/assets/img/co-abs.jpg}{6%} that we draw as \figenv{/assets/img/abs.jpg}{4%}. 
Where does the adjunction come from? We can just postulate it as an axiom or, in the concrete example where $\Lambda \subseteq X$ above, we can also ask that $X$ be a complete (semi-)lattice; then, if \figenv{/assets/img/app.jpg}{4%} also preserves joins in both arguments, we can define \figenv{/assets/img/abs.jpg}{4%} as $\{((v,u),t) : v/u \leq t\}$ with $v/u$ given by $\bigvee\{t : tu \leq v\}$. Intuitively, for terms $u$ and $v$, this is the least upper bound of all terms that reduce to $v$, when applied to $u$. This may take us outside of $\Lambda$ and this is why we need an $X$ with a bit more leg room. The adjunction then follows from the equivalence $tu\leq v \Leftrightarrow t\leq v/u$.

We now have enough machinery to encode *linear* $\lambda$-terms diagrammatically. By linear, I mean any term that uses each variable exactly once in its body. The translation is straightforward: linear terms are just trees of abstraction and application nodes, with \figinline{/assets/img/cup.jpg}{4%} at the bottom joining the wire indicating where a variable is applied to the wire indicating where it is captured by an abstraction:
@@center 
\figenv{/assets/img/linear-encodings.jpg}{55%} 
@@
All closed linear terms become arrows of type $1\rightarrow X$ or, pictorially, diagrams with a single output wire at the top. We can translate open terms in the same way, leaving free variables as input wires at the bottom. 

What about $\beta$-reduction? This is taken care of by one direction of the adjunction between \figenv{/assets/img/co-abs.jpg}{6%} and \figenv{/assets/img/abs.jpg}{4%}. Following \eqref{adjoints}, the first inclusion becomes:
@@center
\figenv{/assets/img/adjunction-abs-coabs.jpg}{27%} or, equivalently, \figenv{/assets/img/beta-reduction.jpg}{50%}\label{equation beta-reduction}
@@
To see the connection with $\beta$-reduction more clearly, let's apply it to a redex of the form $(\lambda x.t)u$:
@@center
\figenv{/assets/img/beta-reduction-ex.jpg}{50%}\label{equation beta-reduction}
@@
The \figinline{/assets/img/cup.jpg}{4%} at the bottom connects the wire representing the free $x$ variable in $t$ to the abstraction node. After applying the first inclusion, the $x$-wire gets reconnected to the argument, $u$. The result is the diagrammatic counterpart of the substitution $t[x:=u]$.

So far we've only used one side of \eqref{adjoints}. If the first inclusion corresponds to (linear) $\beta$-reduction, the second is $\eta$-expansion! Recall that it is given by $t\rightarrow_\eta \lambda x. t x$ and it is not too hard to see that how this corresponds to the following inclusion:
@@center
\figenv{/assets/img/eta-expansion.jpg}{15%}
@@
I don't know if $\eta$-laws are a standard feature of the sharing graph/interaction net literature, but it certainly seems natural to include it here, as it constitutes one side of the adjunction between application and abstraction.


## Copying and discarding

For any preorder, we also have a form of copying $X \rightarrow X\times X$ given by 
@@center
\figinline{/assets/img/copy.jpg}{4%}$=\{(t, (t_1, t_2)) : t \leq t_1 \text{ and } t ≤ t_2\}$. 
@@
For any preorder, we get a right adjoint to \figinline{/assets/img/copy.jpg}{4%} for free:
@@center
\figinline{/assets/img/co-copy.jpg}{4%} $= \{((t1, t2), t) : t1 \leq t \land t2 \leq t\}$. 
@@
Instantiating the two inclusions in \eqref{adjoints}, this means that
@@center
\figenv{/assets/img/adjunction-cocpy-cpy.jpg}{20%} $\quad$ and $\quad$ \figenv{/assets/img/adjunction-cpy-cocpy.jpg}{18%}
@@

We need to discuss what happens when \figinline{/assets/img/abs.jpg}{4%} or \figinline{/assets/img/app.jpg}{4%} interact with \figinline{/assets/img/copy.jpg}{4%} or \figinline{/assets/img/co-copy.jpg}{4%}. 

The point of introducing these last two generators was to duplicate certain diagrams. Luckily, the following inclusions always hold in our semantics, so that we can soundly duplicate \figinline{/assets/img/abs.jpg}{4%} or \figinline{/assets/img/app.jpg}{4%}, as expected:
@@center
\figenv{/assets/img/copy-abs-app.jpg}{60%}
@@

Note that this is why we needed \figinline{/assets/img/co-copy.jpg}{4%}: when \figinline{/assets/img/copy.jpg}{4%} meets \figinline{/assets/img/abs.jpg}{4%}, we need some appropriate way of merging the two downward-flowing wires (corresponding to $X^{op}$) that result from this interaction, as in the inclusion on the left above.

Before drawing a few examples, there's one last component I have not mentioned yet: *discarding*. Sometimes we need to discard variables or entire subterms (to perform garbage collection in programming language slang). Technically, a discarding operation can be defined from what we already have as 
@@center
\figenv{/assets/img/del-def.jpg}{22%}
@@

but it is more convenient to introduce a special generator in our syntax, \figinline{/assets/img/del.jpg}{2%}.
Like our other generators, \figinline{/assets/img/del.jpg}{2%} also has a right adjoint \figinline{/assets/img/co-del.jpg}{2.5%} so that we have the following inclusions: 
@@center
\figenv{/assets/img/adjunction-del-codel.jpg}{50%}
@@
\label{adjunction unit}
We can also delete  \figinline{/assets/img/abs.jpg}{4%} or \figinline{/assets/img/app.jpg}{4%} as the following inclusions hold:
@@center
\figenv{/assets/img/del-abs-app.jpg}{55%}
@@
These new nodes also act as unit (*resp.* counit) for \figinline{/assets/img/copy.jpg}{4%} (*resp.* \figinline{/assets/img/co-copy.jpg}{4%}):
@@center
\figenv{/assets/img/unital.jpg}{30%}
@@
Finally, \figinline{/assets/img/del.jpg}{2%} and \figinline{/assets/img/co-del.jpg}{2%} get duplicated when they meet \figinline{/assets/img/co-copy.jpg}{4%} and \figinline{/assets/img/copy.jpg}{4%}, respectively:
@@center
\figenv{/assets/img/unit-copy.jpg}{45%}
@@



## Putting it all together

With copying and discarding, we can extend our encoding of linear $\lambda$-terms to all terms, simply copying a variable with \figenv{/assets/img/copy.jpg}{4%} when it is used multiple times or discarding it with \figenv{/assets/img/del.jpg}{2%} when it is not used.  
Let's see it at work on [a few standard examples](https://en.wikipedia.org/wiki/SKI_combinator_calculus):
@@center
\figenv{/assets/img/example-terms.jpg}{65%}
@@
The encoding of the static syntax is not the reason you read all this way, so let me show you how the diagrammatic counterpart of reduction behaves. All the inclusions we have covered so far can be interpreted as rewriting rules. The hope is that the resulting rewriting system is a diagrammatic implementation of $\beta$-reduction. As we will see, our wishes do come true sometimes, [but not always](#the_problem_with_copying).

It is a basic exercise to show $SKK\rightarrow_\beta I$. Here's how we can prove the same fact diagrammatically:
@@center
\figenv{/assets/img/skk-1.jpg}{45%} \figenv{/assets/img/skk-2.jpg}{30%}
\figenv{/assets/img/skk-3.jpg}{50%}\figenv{/assets/img/skk-4.jpg}{50%}\figenv{/assets/img/skk-5.jpg}{45%}
\figenv{/assets/img/skk-6.jpg}{15%}\figenv{/assets/img/skk-7.jpg}{25%}
@@
where the inclusion labeled **(Lemma)** comes from replacing $K$ by its definition and applying the following twice: 
@@center
\figenv{/assets/img/lemma-k-app.jpg}{50%}
@@

We have not yet used the adjunction between \figinline{/assets/img/copy.jpg}{4%} and \figinline{/assets/img/co-copy.jpg}{4%}, so let's compute another (useless) example: $(\lambda fx. f (f x)) (\lambda x.x)$. This amounts to applying the identity twice to an argument---this should give us back the identity! Let's check that this is the case. This time I'll go a bit faster, but watch out for the third inclusion, where  \figinline{/assets/img/copy.jpg}{4%} and \figinline{/assets/img/co-copy.jpg}{4%} cancel each other out:
@@center
\figenv{/assets/img/id-twice.jpg}{65%}
@@

Phew! If these examples seem long an tedious that's because they are. Not that it's fun to compute normal forms in the standard $\lambda$-calculus, but the diagrammatic version looks even more complicated. There is a good reason for this: one of the main points of graphical encodings of the $\lambda$-calculus is to make substitution explicit, operating at a finer level of granularity in order to keep track of resources more precisely. The thing is, on its own, the $\lambda$-calculus is too abstract to constitute a concrete model of computation; substitution, the engine of computation, is left as a meta operation. Even with a fixed reduction strategy (say, call-by-value) a single $\beta$-reduction step requires a global substitution of an argument for all occurrences of a bound variable inside the body of a term. This substitution cannot be implemented in constant time in general on a concrete model of computation, like a Turing machine or your actual physical computer. On the other hand, if you take a closer look at the diagrams above, you'll notice that, at each step, we only perform local rewrites, operating in constant time and space. Another advantage is that non-overlapping rewrites can be performed in parallel.


So what's the catch?

Well, unfortunately the naive procedure we've been using is not a refinement of $\beta$-reduction. The issue lies with the interaction of \figinline{/assets/img/copy.jpg}{4%} and \figinline{/assets/img/co-copy.jpg}{4%}.

## The problem with copying

While we stay within the safe haven of the linear $\lambda$-calculus, the diagrammatic reduction procedure behaves exactly as its symbolic counterpart. But when we introduce copying, things get a lot more complicated: the inclusions from the two adjunctions above do not behave as $\beta$-reduction in general. 

To understand the problem, notice that, in our strategy so far, if there are several occurrences of $x$ in $t$,  when we reduce the expression $(\lambda x.t) u$, we will copy $u$ by duplicating each of its components progressively. This might include duplicating \figenv{/assets/img/abs.jpg}{4%} nodes, creating \figenv{/assets/img/co-copy.jpg}{4%} nodes that will need to be eliminated later when they encounter their \figenv{/assets/img/copy.jpg}{4%} counterparts. However, if the copied term $u$ itself contains copying nodes, things can go wrong.

Let's see what the problem is on an example. Take $(\lambda x g. (g x) x)(\lambda f x. f (f x))$. Diagrammatically, the first few steps of the reduction process go as follows:
@@center
\figenv{/assets/img/copy-pb.jpg}{57%}\figenv{/assets/img/copy-pb-2-no-levels.jpg}{57%}
@@
The last diagram illustrates the core of the issue: when the \figenv{/assets/img/co-copy.jpg}{4%} produced by copying the first abstraction node in $(\lambda x g. (g x) x)$ meets the copying node in the same term, they should duplicate each other instead of canceling out.


In summary, there are diagrams encoding well-formed $\lambda$-terms that we cannot copy. As I said earlier, this arises whenever we copy a term that itself contains a \figenv{/assets/img/copy.jpg}{4%} -- in this case, those \figenv{/assets/img/co-copy.jpg}{4%} nodes generated by copying abstraction nodes should be duplicated when they meet \figenv{/assets/img/copy.jpg}{4%} nodes instead of the two canceling out. Diagrammatically, we would like:
@@center
\figenv{/assets/img/cocopy-copy.jpg}{25%}
@@ 
Not all is lost, however. Luckily for us, the corresponding inclusion holds in our chosen semantics. So where's the problem? We can just add it to our list of allowed rewrite rules and carry on our business as usual. Unfortunately, if we apply these inclusions haphazardly, two different choices may lead to different diagrams -- how do we know which one is the right one?[^3]

We now have to choose which rule to apply any time a \figenv{/assets/img/co-copy.jpg}{4%} meets a \figenv{/assets/img/copy.jpg}{4%}, following some specific strategy. This is a well-known problem in the literature on sharing graphs/interaction nets. There are different options to deal with it. 
- Some strategies involve keeping track of nesting of subterms. One way to do this is to introduce a notion of level and annotate nodes with the level at which they originate. Then, when \figenv{/assets/img/co-copy.jpg}{4%} and \figenv{/assets/img/copy.jpg}{4%} from the same level interact, they cancel each other out, and when they belong to different levels, they duplicate each other. This requires a significant amount of bookkeeping. An equivalent implementation introduces global features, called *boxes* which enclose subterms, delimiting the level at which they live. Stefano Guerrini's [gentle introduction to sharing graphs](https://www.sciencedirect.com/science/article/pii/S1571066105050164)  explains this. 
- Alternatively, it is possible to determinise the rewriting strategy by keeping track of a token that moves around the graph and applies rewrite rules only where the token is located. This is [the approach taken by François-Régis Sinot](https://link.springer.com/chapter/10.1007/11417170_28).
- Another approach sidesteps the problem by disallowing terms that do not follow a form of syntactic stratification (if you're looking for the relevant keywords, they are terms typeable in *elementary linear logic*, a form of substructural logic with restricted copying, whose cut elimination procedure is guaranteed to terminate in elementary time in the size of terms).
- Finally, the more radical approach is to accept that the correspondence between diagrams and terms is not perfect, and look for another syntactic encoding. What we have here is a Turing-complete graph rewriting system, so we are free to cook up any encoding of the $\lambda$-calculus we like, just like we could encode it on a Turing machine or a register machine. Luckily, there are clever encodings that manage to stay close to the one we've seen here. For example, [Ian Mackie and Jorge Sousa Pinto's translation](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.9699), which reproduce features of the encoding of $\lambda$-terms as linear logic proofs[^4], is not too difficult to understand. 

Coming back to our string diagrammatic interpretation, one nice feature is that the problem with copying acquires semantic content. Let me explain. We have two different inclusions to deal with the composite \figenv{/assets/img/co-copy.jpg}{4%};\figenv{/assets/img/copy.jpg}{4%}. It turns out that these two possible choices can themselves be ordered:
@@center
\figenv{/assets/img/cocopy-copy-dup-cancel.jpg}{40%}
@@
This can be seen as a consequence of the adjunction between \figinline{/assets/img/del.jpg}{2%}and \figinline{/assets/img/co-del.jpg}{2.25%}:
@@center
\figenv{/assets/img/copy-cocopy-cancel-proof.jpg}{58%}
@@
So, if we always choose to duplicate \figenv{/assets/img/co-copy.jpg}{4%} and \figenv{/assets/img/copy.jpg}{4%}, we do not lose any semantic information. Of course, to recover a valid $\lambda$-term we will need to disconnect some wires *eventually*, using the second inclusion. This means that we can always postpone the choice of which wires to disconnect until the end. I found this surprising. Note that there is a space-time trade-off in this choice, as constantly duplicating nodes will increase the size of the diagram exponentially. In a way, we would be keeping track of all possible reductions, only committing to a specific form when disconnecting enough wires to recover a well-formed $\lambda$-term, *i.e.* a diagram made only from \figenv{/assets/img/abs.jpg}{4%}, \figenv{/assets/img/app.jpg}{4%}, \figenv{/assets/img/copy.jpg}{4%} and \figenv{/assets/img/cup.jpg}{4%}.


## What is $X$?

As we saw, if we can encode any $\lambda$-term as a string diagram, we can also draw diagrams that do not correspond to any term. In fact, some of these may appear during the reduction process, because diagrammatic reduction is more fined-grained than $\beta$-reduction. This is a feature and a bug, depending on how you look at it. A feature, because the point of introducing diagrams is to keep track of resources, via explicit copying and discarding. A bug, because the increased granularity needs to be approached carefully if we really want to mimic $\beta$-reduction. 

To even draw these diagrams we needed our generators to satisfy certain properties. You may be wondering what these mean, semantically. Of course, you can approach the problem purely formally and say that these conditions are just what you need to implement $\beta$-reduction. But here's how I think about $X$ in order to make all the required inclusions true. We can construct $X$ as the set of downward-closed sets of $\Lambda$. This is the free join semi-lattice over $\Lambda$. Constructed in this way, the elements of $X$ that are not principal, *i.e.* not of the form $\{u\,: u\leq t\}$ for some term $t$, can be thought of as generated by some set of terms. In other words, we can think of the elements of $X$ as types! This might seem a bit strange because, from this point of view, terms are also types. But this is not so crazy if we view both types and terms as *behaviours* with varying degrees of nondeterminism. In other words, for two elements of $X$, $x\leq y$ can be read as $x$ implements/refines/realises the specification $y$. With this in mind, we can think of diagrams $1\rightarrow X$ (with a single outgoing wire) that do not encode a $\lambda$-term as types or specifications that are not fully deterministic. I'm not entirely sure what this means, but it sounds profound.

# References

- [Sharing Implementations of Graph Rewriting Systems](https://doi.org/10.1016/j.entcs.2005.04.020), by Stefano Guerrini.

- [Call-by-Name and Call-by-Value as Token-Passing Interaction Nets](https://link.springer.com/chapter/10.1007/11417170_28), by François-Régis Sinot.

- [Compiling the lambda-calculus into Interaction Combinators](https://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.22.9699), by Ian Mackie & Jorge Sousa Pinto .

[^1]: Diagrams should be read flowing from bottom to top for composition, and from left to right for the monoidal product. 

[^2]: If you're already familiar with sharing graphs or interaction nets, you will notice that, unlike those, the edges of our diagrams are directed. Diagrams for relational profunctors can be drawn undirected iff $X=X^{op}$ iff the underlying order is also symmetric, *i.e.* if it is the equality over $X$. However, it is not clear in this case that abstraction can be defined over such an $X$. Is this related to how there are no good set-theoretic models for the untyped $\lambda$-calculus and one needs to turn to more exotic constructions, like those of domain theory, for instance? Perhaps someone else can enlighten me here.

[^3]: I originally wanted to write that the resulting rewriting system was no longer confluent. While technically true, this is also the case of the previous system, if we include the use of inclusions coming from the adjunction between \figinline{/assets/img/del.jpg}{2%} and \figinline{/assets/img/co-del.jpg}{2.5%}.

[^4]: The correspondence with linear logic is a recurring theme in this area. The boxes/levels I've mentioned are also a way of encoding the *exponentials* -- the modality that controls access to copying and deleting in linear logic.







