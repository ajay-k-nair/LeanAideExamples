import LeanAideCore
import Mathlib
set_option linter.style.commandStart false
set_option linter.style.longLine false

/-
### Theorem:
Let $T : V \to V$ be a linear transformation on a finite-dimensional vector space
satisfying $T^2 = T$.
Let $\lambda$ be a scalar with $\lambda \neq 0,1$.
Define
\[
S = T - \lambda I.
\]
Prove that $S$ is invertible.

### Proof:

Assume that $V$ is a finite-dimensional vector space over a field $K$, and let $T : V \to V$ be a linear transformation such that $T^2 = T$. Let $\lambda \in K$ satisfy $\lambda \neq 0$ and $\lambda \neq 1$. Define $S : V \to V$ by $S = T - \lambda I$, where $I$ is the identity map on $V$.

To prove that $S$ is invertible, it is enough to prove that $S$ is injective, since $V$ is finite-dimensional and for linear maps on a finite-dimensional space, injectivity and surjectivity are equivalent, and each is equivalent to invertibility.

To show that $S$ is injective, it suffices to show that $\ker(S) = \{0\}$. Let $v \in V$ be an arbitrary vector such that $S(v) = 0$. By the definition of $S$, the equation $S(v) = 0$ means
\[
(T - \lambda I)(v) = 0.
\]
By linearity, this is equivalent to
\[
T(v) - \lambda v = 0.
\]
Thus
\[
T(v) = \lambda v.
\]

Next, apply $T$ once more to both sides of this equality. Using linearity of $T$, we obtain
\[
T(T(v)) = T(\lambda v).
\]
Since $T$ is linear, $T(\lambda v) = \lambda T(v)$, and therefore
\[
T(T(v)) = \lambda T(v).
\]
On the other hand, the assumption $T^2 = T$ means that for every $w \in V$ we have $T(T(w)) = T(w)$. Applying this to $w = v$, we get
\[
T(T(v)) = T(v).
\]
Combining the two equalities for $T(T(v))$, we obtain
\[
T(v) = \lambda T(v).
\]

Now rewrite this as
\[
T(v) - \lambda T(v) = 0.
\]
Factor out $T(v)$ to get
\[
(1 - \lambda) T(v) = 0.
\]
Since $\lambda \neq 1$, the scalar $1 - \lambda$ is nonzero. In a vector space over a field, if a nonzero scalar multiplies a vector to give $0$, then the vector must be $0$. Hence
\[
T(v) = 0.
\]

Recall also that we had $T(v) = \lambda v$. Combining this with $T(v) = 0$, we obtain
\[
\lambda v = 0.
\]
Since $\lambda \neq 0$, again using that $V$ is a vector space over a field, it follows that $v = 0$.

Thus any vector $v \in V$ with $S(v) = 0$ must be the zero vector. Therefore $\ker(S) = \{0\}$, so $S$ is injective. Because $V$ is finite-dimensional, an injective linear map $V \to V$ is automatically surjective and hence invertible. Therefore $S$ is invertible.
-/

-- ### JSON Structured Proof

def example22 := json% {
  "document": {
    "type": "document",
    "body": [
      {
        "type": "Theorem",
        "label": "thm:T-minus-lambdaI-invertible",
        "header": "Theorem",
        "hypothesis": [
          {
            "type": "let_statement",
            "variable_name": "T",
            "variable_type": "linear transformation from V to V",
            "properties": "T^2 = T",
            "statement": "Let T : V \\to V be a linear transformation on a finite-dimensional vector space satisfying T^2 = T."
          },
          {
            "type": "let_statement",
            "variable_name": "V",
            "variable_type": "finite-dimensional vector space",
            "statement": "Let V be a finite-dimensional vector space."
          },
          {
            "type": "let_statement",
            "variable_name": "\\lambda",
            "variable_type": "scalar",
            "properties": "\\lambda \\neq 0,1",
            "statement": "Let \\lambda be a scalar with \\lambda \\neq 0,1."
          },
          {
            "type": "let_statement",
            "variable_name": "S",
            "value": "T - \\lambda I",
            "variable_type": "linear transformation from V to V",
            "statement": "Define S = T - \\lambda I."
          }
        ],
        "claim": "S is invertible.",
        "proof": [
          {
            "type": "assert_statement",
            "claim": "It is enough to prove that S is injective.",
            "results_used": [
              {
                "statement": "For a linear endomorphism of a finite-dimensional vector space, injectivity implies surjectivity, and hence invertibility."
              }
            ]
          },
          {
            "type": "let_statement",
            "variable_name": "v",
            "variable_type": "element of V",
            "statement": "Let v \\in V."
          },
          {
            "type": "assume_statement",
            "assumption": "S(v)=0."
          },
          {
            "type": "assert_statement",
            "claim": "(T-\\lambda I)(v)=0.",
            "results_used": [
              {
                "statement": "S = T - \\lambda I."
              }
            ]
          },
          {
            "type": "assert_statement",
            "claim": "T(v)-\\lambda v=0.",
            "proof_method": "by expanding the definition of (T-\\lambda I)(v)"
          },
          {
            "type": "assert_statement",
            "claim": "T(v)=\\lambda v.",
            "proof_method": "by rearranging the equality"
          },
          {
            "type": "assert_statement",
            "claim": "T(T(v))=\\lambda T(v).",
            "results_used": [
              {
                "statement": "T is linear."
              }
            ]
          },
          {
            "type": "assert_statement",
            "claim": "T(T(v))=T(v).",
            "results_used": [
              {
                "statement": "T^2 = T."
              }
            ]
          },
          {
            "type": "assert_statement",
            "claim": "T(v)=\\lambda T(v).",
            "proof_method": "by combining the two previous equalities"
          },
          {
            "type": "assert_statement",
            "claim": "(1-\\lambda)T(v)=0.",
            "proof_method": "by subtracting \\lambda T(v) from both sides"
          },
          {
            "type": "assert_statement",
            "claim": "T(v)=0.",
            "results_used": [
              {
                "statement": "\\lambda \\neq 1, so 1-\\lambda is nonzero."
              }
            ]
          },
          {
            "type": "assert_statement",
            "claim": "\\lambda v=0.",
            "proof_method": "by combining T(v)=\\lambda v with T(v)=0"
          },
          {
            "type": "assert_statement",
            "claim": "v=0.",
            "results_used": [
              {
                "statement": "\\lambda \\neq 0."
              }
            ]
          },
          {
            "type": "assert_statement",
            "claim": "\\ker(S)=\\{0\\}.",
            "proof_method": "since every vector v with S(v)=0 is equal to 0"
          },
          {
            "type": "assert_statement",
            "claim": "S is injective.",
            "proof_method": "by the definition of injectivity"
          },
          {
            "type": "conclude_statement",
            "claim": "S is invertible.",
            "results_used": [
              {
                "statement": "For a linear endomorphism of a finite-dimensional vector space, injectivity implies surjectivity, and hence invertibility."
              }
            ]
          }
        ]
      }
    ]
  }
}


-- ## LeanCode generated by LeanAide

#leanaide_connect "http://drongo:8001"

#codegen example22

-- fails completely.
