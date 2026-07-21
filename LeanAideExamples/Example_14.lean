import LeanAideCore
import Mathlib
set_option linter.style.commandStart false
set_option linter.style.longLine false

/-
### Theorem:
Let $A$ be the $2 \times 2$ matrix:$$A = \begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}$$.
Prove that for all integers $n \ge 1$, the $n$-th power of $A$ is given by:$$A^n = \begin{pmatrix} 1 & n \\ 0 & 1 \end{pmatrix}$$.

### Proof:
Assume that $A$ is the $2 \times 2$ real matrix
\[
A = \begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}.
\]
The claim is that for every integer $n \ge 1$ one has
\[
A^n = \begin{pmatrix} 1 & n \\ 0 & 1 \end{pmatrix}.
\]

The proof proceeds by induction on the integer $n \ge 1$.

First, consider the base case $n = 1$. By definition of the first power of a matrix, $A^1 = A$. Thus
\[
A^1 = A = \begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}.
\]
On the other hand, substituting $n = 1$ into the claimed formula gives
\[
\begin{pmatrix} 1 & n \\ 0 & 1 \end{pmatrix}
=
\begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}.
\]
Therefore the formula holds for $n = 1$.

Next, assume as induction hypothesis that for some integer $k \ge 1$ one has
\[
A^k = \begin{pmatrix} 1 & k \\ 0 & 1 \end{pmatrix}.
\]
The goal is to prove that the same formula holds for $k+1$, namely that
\[
A^{k+1} = \begin{pmatrix} 1 & k+1 \\ 0 & 1 \end{pmatrix}.
\]

By the definition of matrix powers for positive integers, one has
\[
A^{k+1} = A^k \cdot A.
\]
Using the induction hypothesis, this becomes
\[
A^{k+1} = \begin{pmatrix} 1 & k \\ 0 & 1 \end{pmatrix}
          \cdot
          \begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}.
\]
Compute this product using the usual rule for multiplication of $2 \times 2$ matrices. The entry in the first row and first column of the product is
\[
1 \cdot 1 + k \cdot 0 = 1.
\]
The entry in the first row and second column is
\[
1 \cdot 1 + k \cdot 1 = 1 + k.
\]
The entry in the second row and first column is
\[
0 \cdot 1 + 1 \cdot 0 = 0.
\]
The entry in the second row and second column is
\[
0 \cdot 1 + 1 \cdot 1 = 1.
\]
Therefore
\[
A^{k+1}
=
\begin{pmatrix}
1 & 1 + k \\
0 & 1
\end{pmatrix}
=
\begin{pmatrix}
1 & k+1 \\
0 & 1
\end{pmatrix}.
\]
This is exactly the desired formula for $n = k+1$.

Thus, the formula
\[
A^n = \begin{pmatrix} 1 & n \\ 0 & 1 \end{pmatrix}
\]
holds for $n = 1$ and, assuming it holds for some $k \ge 1$, it also holds for $k+1$. By the principle of mathematical induction on the integer $n \ge 1$, the formula holds for all integers $n \ge 1$.
-/

def example14 := json% {
  "document": {
    "type": "document",
    "body": [
      {
        "type": "Theorem",
        "header": "Theorem",
        "label": "thm:An-formula",
        "hypothesis": [
          {
            "type": "let_statement",
            "variable_name": "A",
            "variable_type": "2 × 2 real matrix",
            "statement": "Let A be the 2 × 2 real matrix A = ((1, 1), (0, 1))."
          },
          {
            "type": "assume_statement",
            "assumption": "n is an integer with n ≥ 1."
          }
        ],
        "claim": "For every integer n ≥ 1, A^n = ((1, n), (0, 1)).",
        "proof": {
          "type": "induction_proof",
          "on": "n",
          "base_case_proof": [
            {
              "type": "assume_statement",
              "assumption": "Assume n = 1."
            },
            {
              "type": "assert_statement",
              "claim": "By the definition of the first power of a matrix, A^1 = A.",
              "proof_method": "unfolding the definition of the first power of a matrix"
            },
            {
              "type": "assert_statement",
              "claim": "A^1 = A = ((1, 1), (0, 1)).",
              "proof_method": "substituting the given matrix A"
            },
            {
              "type": "assert_statement",
              "claim": "Substituting n = 1 into the claimed formula yields ((1, n), (0, 1)) = ((1, 1), (0, 1)).",
              "proof_method": "direct substitution"
            },
            {
              "type": "conclude_statement",
              "claim": "The formula A^n = ((1, n), (0, 1)) holds for n = 1."
            }
          ],
          "induction_step_proof": [
            {
              "type": "assume_statement",
              "assumption": "Assume as induction hypothesis that for some integer k ≥ 1 one has A^k = ((1, k), (0, 1)).",
              "label": "IH"
            },
            {
              "type": "assert_statement",
              "claim": "A^{k+1} = A^k · A.",
              "proof_method": "definition of matrix powers for positive integers"
            },
            {
              "type": "assert_statement",
              "claim": "Using the induction hypothesis, A^{k+1} = ((1, k), (0, 1)) · ((1, 1), (0, 1)).",
              "proof_method": "substitution of the induction hypothesis",
              "internal_references": [
                {
                  "target_identifier": "IH"
                }
              ]
            },
            {
              "type": "assert_statement",
              "claim": "The (1,1)-entry of the product is 1 · 1 + k · 0 = 1.",
              "proof_method": "matrix multiplication rule for 2 × 2 matrices",
              "calculation": {
                "type": "calculation",
                "inline_calculation": "1 · 1 + k · 0 = 1"
              }
            },
            {
              "type": "assert_statement",
              "claim": "The (1,2)-entry of the product is 1 · 1 + k · 1 = 1 + k.",
              "proof_method": "matrix multiplication rule for 2 × 2 matrices",
              "calculation": {
                "type": "calculation",
                "inline_calculation": "1 · 1 + k · 1 = 1 + k"
              }
            },
            {
              "type": "assert_statement",
              "claim": "The (2,1)-entry of the product is 0 · 1 + 1 · 0 = 0.",
              "proof_method": "matrix multiplication rule for 2 × 2 matrices",
              "calculation": {
                "type": "calculation",
                "inline_calculation": "0 · 1 + 1 · 0 = 0"
              }
            },
            {
              "type": "assert_statement",
              "claim": "The (2,2)-entry of the product is 0 · 1 + 1 · 1 = 1.",
              "proof_method": "matrix multiplication rule for 2 × 2 matrices",
              "calculation": {
                "type": "calculation",
                "inline_calculation": "0 · 1 + 1 · 1 = 1"
              }
            },
            {
              "type": "assert_statement",
              "claim": "Therefore A^{k+1} = ((1, 1 + k), (0, 1)) = ((1, k+1), (0, 1)).",
              "proof_method": "collecting the computed entries and simplifying 1 + k = k + 1"
            },
            {
              "type": "conclude_statement",
              "claim": "The formula A^{k+1} = ((1, k+1), (0, 1)) holds, completing the induction step."
            }
          ]
        }
      },
      {
        "type": "conclude_statement",
        "claim": "By the principle of mathematical induction on the integer n ≥ 1, the formula A^n = ((1, n), (0, 1)) holds for all integers n ≥ 1."
      }
    ]
  }
}

#leanaide_connect "http://drongo:8001"
