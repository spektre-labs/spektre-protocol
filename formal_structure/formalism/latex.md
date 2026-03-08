# latex.md
# Spektre / Spektre — Formalism Notes (LaTeX)

This file provides a LaTeX-ready mathematical formalization for the function-space ladder:

\[
\mathbb{R}^n \;\to\; \mathbb{R}^{\mathbb{N}} \;\to\; \mathbb{R}^{\mathbb{R}}
\]

and the iterative hierarchy:

\[
X_{k+1} := \mathbb{R}^{X_k}.
\]

---

## 1. Notation

Let:
- \(\mathbb{R}\) be the set of real numbers,
- \(\mathbb{N}\) be the set of natural numbers,
- \(|X|\) denote the cardinality of a set \(X\),
- \(\mathfrak{c} := |\mathbb{R}| = 2^{\aleph_0}\) denote the cardinality of the continuum,
- For sets \(A,B\), define the function set:
  \[
  A^B := \{ f \mid f: B \to A \}.
  \]

---

## 2. Finite-dimensional coordinate spaces

For any \(n \in \mathbb{N}\), define:
\[
\mathbb{R}^n := \{ (x_1,\dots,x_n) \mid x_i \in \mathbb{R} \}.
\]

Cardinality:
\[
|\mathbb{R}^n| = \mathfrak{c}, \quad \forall n \in \mathbb{N},\; n \ge 1.
\]

---

## 3. Countable function space (sequences)

Define the set of real sequences:
\[
\mathbb{R}^{\mathbb{N}} := \{ f \mid f:\mathbb{N}\to\mathbb{R} \}.
\]

Cardinality:
\[
|\mathbb{R}^{\mathbb{N}}|
= \mathfrak{c}^{\aleph_0}
= (2^{\aleph_0})^{\aleph_0}
= 2^{\aleph_0}
= \mathfrak{c}.
\]

Thus, \(\mathbb{R}^{\mathbb{N}}\) is infinite-dimensional, yet still has continuum cardinality.

---

## 4. Uncountable function space (all real functions)

Define:
\[
\mathbb{R}^{\mathbb{R}} := \{ f \mid f:\mathbb{R}\to\mathbb{R} \}.
\]

Cardinality:
\[
|\mathbb{R}^{\mathbb{R}}|
= |\mathbb{R}|^{|\mathbb{R}|}
= \mathfrak{c}^{\mathfrak{c}}
= (2^{\aleph_0})^{2^{\aleph_0}}
= 2^{\aleph_0 \cdot 2^{\aleph_0}}
= 2^{2^{\aleph_0}}
= 2^{\mathfrak{c}}.
\]

By Cantor’s theorem, \(2^{\mathfrak{c}} > \mathfrak{c}\), hence:
\[
|\mathbb{R}^{\mathbb{R}}| > |\mathbb{R}|.
\]

---

## 5. Iterative hierarchy (function-space ladder)

Define a hierarchy:
\[
X_0 := \mathbb{R}, \qquad X_{k+1} := \mathbb{R}^{X_k}.
\]

Let \(\kappa_k := |X_k|\). Then:
\[
\kappa_0 = \mathfrak{c}, \qquad \kappa_{k+1} = \mathfrak{c}^{\kappa_k}.
\]

In particular:
\[
\kappa_1 = \mathfrak{c}^{\mathfrak{c}} = 2^{\mathfrak{c}} > \mathfrak{c}.
\]

This yields a strictly increasing tower of cardinalities:
\[
\kappa_0 < \kappa_1 < \kappa_2 < \cdots.
\]

---

## 6. Optional: “finite-to-countable-to-uncountable” chain

A clean conceptual chain is:

\[
\mathbb{R}^n \quad (n\in\mathbb{N})
\;\subseteq\;
\mathbb{R}^{<\omega}
:=
\bigcup_{n\in\mathbb{N}}\mathbb{R}^n
\;\subseteq\;
\mathbb{R}^{\mathbb{N}}
\;\subseteq\;
\mathbb{R}^{\mathbb{R}}.
\]

Cardinalities:
\[
|\mathbb{R}^n| = \mathfrak{c},\quad
|\mathbb{R}^{\mathbb{N}}| = \mathfrak{c},\quad
|\mathbb{R}^{\mathbb{R}}| = 2^{\mathfrak{c}}.
\]

---

## 7. Minimal LaTeX snippet (copy/paste)

```latex
$begin:math:display$
X_0 := \\mathbb{R}, \\qquad X_{k+1} := \\mathbb{R}^{X_k}.
$end:math:display$
Let $begin:math:text$\\kappa_k := |X_k|$end:math:text$. Then
$begin:math:display$
\\kappa_0 = \\mathfrak{c}, \\qquad \\kappa_{k+1} = \\mathfrak{c}^{\\kappa_k}.
$end:math:display$
In particular,
$begin:math:display$
|\\mathbb{R}^{\\mathbb{R}}| = \\mathfrak{c}^{\\mathfrak{c}} = 2^{\\mathfrak{c}} > \\mathfrak{c}.
$end:math:display$
