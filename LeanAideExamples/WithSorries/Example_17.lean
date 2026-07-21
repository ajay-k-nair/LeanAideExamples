import LeanAideCore
import Mathlib
set_option linter.style.commandStart false
set_option linter.style.longLine false

/-
### Theorem:
In any simple graph with $n$ vertices (where $n \ge 2$), there are at least two vertices that have the same degree.


### Proof:
Let $G$ be a simple graph with $n$ vertices, where $n \ge 2$. By “simple graph” we mean that there are no loops and no multiple edges, so each vertex is adjacent only to distinct other vertices and never to itself.

The degree of a vertex $v$ in $G$, denoted $\deg(v)$, is defined as the number of vertices that are adjacent to $v$. Because $G$ is simple and has $n$ vertices, the degree of any vertex is bounded as follows:

1. The degree cannot be negative, so for every vertex $v$ we have $\deg(v) \ge 0$.
2. A vertex cannot be adjacent to itself, and there are $n-1$ other vertices available. Therefore, for every vertex $v$ we have $\deg(v) \le n-1$.

Hence, for each vertex $v$ in $G$, the degree $\deg(v)$ is an integer lying in the set
\[
\{0,1,2,\dots,n-1\}.
\]

Assume for contradiction that all $n$ vertices of $G$ have pairwise distinct degrees. Since there are $n$ vertices and the degree of each is an element of the set $\{0,1,\dots,n-1\}$, the only way for all degrees to be distinct is that the set of degrees is exactly
\[
\{0,1,2,\dots,n-1\}.
\]
In particular, there is a vertex $u$ with degree $\deg(u)=0$, and there is a vertex $v$ with degree $\deg(v)=n-1$.

The condition $\deg(u)=0$ means that $u$ is not adjacent to any other vertex. The condition $\deg(v)=n-1$ means that $v$ is adjacent to all other vertices of $G$, including $u$. This contradicts the fact that $u$ is not adjacent to any vertex.

Thus, the assumption that all degrees are distinct leads to a contradiction. Therefore, it is not possible for all $n$ vertices to have pairwise distinct degrees. Consequently, there must exist at least two distinct vertices in $G$ that have the same degree.

-/


--### JSON Structured Proof

def example17 := json% {
  "document": {
    "type": "document",
    "body": [
      {
        "type": "Theorem",
        "label": "thm:same-degree",
        "header": "Theorem",
        "claim": "In any simple graph with n vertices (where n ≥ 2), there are at least two vertices that have the same degree.",
        "hypothesis": [
          {
            "type": "let_statement",
            "variable_name": "G",
            "variable_type": "simple graph",
            "properties": "G has n vertices with n ≥ 2.",
            "statement": "Let G be a simple graph with n vertices, where n ≥ 2."
          }
        ],
        "proof": [
          {
            "type": "assert_statement",
            "claim": "Because G is simple and has n vertices, for every vertex v in G we have 0 ≤ deg(v) ≤ n − 1.",
            "proof_method": "From the definition of a simple graph: degrees are nonnegative and a vertex can be adjacent to at most the n − 1 other vertices."
          },
          {
            "type": "assert_statement",
            "claim": "For each vertex v in G, the degree deg(v) is an integer in the set {0, 1, 2, …, n − 1}."
          },
          {
            "type": "contradiction_statement",
            "assumption": "All n vertices of G have pairwise distinct degrees.",
            "proof": [
              {
                "type": "assert_statement",
                "claim": "Since there are n vertices and each degree is in {0, 1, …, n − 1} and all degrees are distinct, the set of degrees of the vertices is exactly {0, 1, 2, …, n − 1}.",
                "proof_method": "Pigeonhole principle on n distinct integers chosen from a set of n integers."
              },
              {
                "type": "some_statement",
                "variable_name": "u",
                "variable_kind": "vertex of G",
                "properties": "deg(u) = 0.",
                "statement": "There exists a vertex u in G with degree deg(u) = 0."
              },
              {
                "type": "some_statement",
                "variable_name": "v",
                "variable_kind": "vertex of G",
                "properties": "deg(v) = n − 1.",
                "statement": "There exists a vertex v in G with degree deg(v) = n − 1."
              },
              {
                "type": "assert_statement",
                "claim": "The condition deg(u) = 0 means that u is not adjacent to any other vertex.",
                "proof_method": "By the definition of degree."
              },
              {
                "type": "assert_statement",
                "claim": "The condition deg(v) = n − 1 means that v is adjacent to all other vertices of G, including u.",
                "proof_method": "If a vertex has degree n − 1 in a simple graph on n vertices, it is adjacent to every other vertex."
              },
              {
                "type": "assert_statement",
                "claim": "It is impossible for u to be both non-adjacent to every vertex and adjacent to v.",
                "proof_method": "Logical inconsistency of the adjacency relation with deg(u) = 0 and v adjacent to all vertices."
              }
            ]
          },
          {
            "type": "conclude_statement",
            "claim": "It is not possible for all n vertices to have pairwise distinct degrees; therefore, there must exist at least two distinct vertices in G that have the same degree."
          }
        ]
      }
    ]
  }
}

-- ### LeanCode generated by  LeanAide

#leanaide_connect "http://drongo:8001"

theorem exists_two_vertices_with_same_degree_of_two_le_card_verts :
      ∀ {V : Type u_1} (G : SimpleGraph V) [inst : Fintype V] [inst_1 : DecidableRel G.Adj],
        (2 : ℕ) ≤ Fintype.card V → ∃ (u : V) (v : V), u ≠ v ∧ G.degree u = G.degree v :=
    by
    intro V G inst inst_1 a_6304092544813172440
    have assert_10979365376340096007 :
      ∀ (G : SimpleGraph V) [inst : Fintype V] [inst_1 : DecidableRel G.Adj],
        (2 : ℕ) ≤ Fintype.card V →
          ∀ (v : V), (0 : ℕ) ≤ G.degree v ∧ G.degree v ≤ Fintype.card V - (1 : ℕ) :=
      by repeat (sorry)
    have assert_10577409813634396714 : ∀ (v : V), G.degree v < Fintype.card V := by
      grind only [#2c5b]
    have :
      (∀ (G : SimpleGraph V) [inst : Fintype V] [inst_1 : DecidableRel G.Adj],
          (2 : ℕ) ≤ Fintype.card V → ∀ {v w : V}, v ≠ w → G.degree v ≠ G.degree w) →
        False :=
      by
      intro contraHyp
      have assert_16454856964667708915 :
        ∀ (G : SimpleGraph V) [inst : Fintype V] [inst_1 : DecidableRel G.Adj],
          (2 : ℕ) ≤ Fintype.card V →
            (Function.Injective fun (v : V) ↦ G.degree v) →
              (Set.range fun (v : V) ↦ G.degree v) = Set.Iio (Fintype.card V) :=
        by repeat (sorry)
      have assert_10064087155476414249 :
        (∃ (u : V), G.degree u = (0 : ℕ)) ∧ ∃ (u : V), G.degree u = (0 : ℕ) := by repeat (sorry)
      have assert_5104923636728474335 :
        (∃ (u : V), G.degree u = (0 : ℕ)) →
          (∃ (v : V), G.degree v = Fintype.card V - (1 : ℕ)) →
            ∃ (v : V), G.degree v = Fintype.card V - (1 : ℕ) :=
        by simp only [imp_self, implies_true]
      have assert_16507612592525938476 :
        (∃ (u : V), G.degree u = (0 : ℕ)) →
          (∃ (v : V), G.degree v = Fintype.card V - (1 : ℕ)) → False :=
        by repeat (sorry)
      have assert_16507612592525938476 :
        (∃ (u : V), G.degree u = (0 : ℕ)) →
          (∃ (v : V), G.degree v = Fintype.card V - (1 : ℕ)) → False :=
        by grind only [#e457]
      have assert_16507612592525938476 :
        (∃ (u : V), G.degree u = (0 : ℕ)) →
          (∃ (v : V), G.degree v = Fintype.card V - (1 : ℕ)) → False :=
        by grind only [#e457]
      repeat (sorry)
    have : ∃ (v : V) (w : V), v ≠ w ∧ G.degree v = G.degree w := by repeat (sorry)
    assumption

    -- There is a problem with the JSON, the proof has a definition.
