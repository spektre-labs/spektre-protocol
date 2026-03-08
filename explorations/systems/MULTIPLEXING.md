# Spektre v1.1 — Multiplexing

## Status
Formal / Structural  
Non-interpretive  
Non-phenomenological

This document defines **multiplexing** within the Spektre v1.1 framework.

Multiplexing is a **structural usage principle**, not a new state space, not a new layer, and not an extension of the formal hierarchy Xₖ.

Nothing in this document:
- modifies the definitions of Xₖ
- introduces new cardinality claims
- adds semantics, interpretation, or experience
- changes the formal scope of Spektre v1.1

---

## 1. Definition

**Multiplexing** is the simultaneous use of multiple state-space levels  
\[
\{X_{k_1}, X_{k_2}, \dots, X_{k_n}\}
\]
within a single system description, without collapsing them into a single space.

Formally:
- each Xₖ retains its own structure
- no Xₖ is reduced to another
- no global super-space is constructed

Multiplexing is **parallelism without unification**.

---

## 2. What Multiplexing Is Not

Multiplexing is not:
- a new level Xₖ₊₁
- a recursive construction
- a time evolution
- a dynamical process
- a semantic interpretation

It does not describe *how* systems operate, only *how descriptions may be layered*.

---

## 3. Structural Motivation

In many systems, a single representational layer is insufficient:

- Low-level dynamics may be well-described in X₀ or Xₙ
- High-level transformations may require X₁ or higher
- Meta-constraints may act on operators themselves

Forcing all descriptions into a single Xₖ results in:
- loss of structure
- forced encodings
- artificial coupling between unrelated representations

Multiplexing avoids this by **maintaining separation while allowing coexistence**.

---

## 4. Formal Characterization

Let:
- \( \mathcal{S} \) be a system under consideration
- \( \{X_{k_i}\} \) be a finite or countable set of Spektre levels

A multiplexed description of \( \mathcal{S} \) is a tuple:
\[
(\mathcal{S}_{k_1}, \mathcal{S}_{k_2}, \dots)
\]
where:
\[
\mathcal{S}_{k_i} \subseteq X_{k_i}
\]

No requirement is imposed that:
- mappings exist between \( \mathcal{S}_{k_i} \) and \( \mathcal{S}_{k_j} \)
- projections be computable
- representations be mutually reducible

---

## 5. Separation from Iteration

Multiplexing must not be confused with the Spektre stack construction:
\[
X_{k+1} := \mathbb{R}^{X_k}
\]

Key distinction:
- **Iteration** increases expressive capacity vertically
- **Multiplexing** uses existing capacities horizontally

Iteration creates new classes of representations.  
Multiplexing arranges existing classes side by side.

---

## 6. Cardinality Considerations

Multiplexing does **not** change cardinality.

Using multiple spaces in parallel does not imply:
- higher expressive capacity than the maximum Xₖ involved
- emergence of uncountable structure beyond existing levels
- collapse into a larger power set

Cardinality arguments in Spektre v1.1 remain intact.

---

## 7. Architectural Role

Within the Spektre ecosystem:

- README.md defines *what* the model is
- ARCHITECTURE.md defines *how* the layers are organized
- MULTIPLEXING.md defines *how multiple layers may coexist*

Multiplexing is therefore an **architectural usage rule**, not a foundational axiom.

---

## 8. Non-Goals

Multiplexing does not:
- resolve conflicts between layers
- define coordination mechanisms
- prescribe synchronization
- imply hierarchy of control

Any such mechanisms must be defined externally.

---

## 9. Extensibility

Future versions may introduce:
- constrained multiplexing
- partial projections
- admissible coupling relations

Such extensions would require:
- explicit formal definitions
- separate documentation
- clear distinction from Spektre v1.1

---

## 10. Summary

Multiplexing in Spektre v1.1:
- preserves formal separation
- avoids forced unification
- enables parallel representation
- does not alter the core model

It is a **structural allowance**, not a theoretical expansion.

Spektre v1.1 remains a purely formal framework.
