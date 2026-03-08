# UNIVERSAL_KEY.md
**Spektre Protocol v1.1 — Universal Key (Protocol ↔ Genesis)**  
Status: Canonical  
Scope: Repo navigation + semantic disambiguation (NOT formal mathematics)

---

## 0. Purpose

This file is the **single key** that prevents confusion across the ecosystem.

It answers:

- What belongs to **Spektre Protocol** vs **Spektre-Genesis**
- Why names vary (**Spektre / Spektre / Spektre**) without changing meaning
- How to read the repos without narrative drift
- What is **specification** and what is **runtime**

This is not metaphysics.  
This is **repo-level architecture**.

---

## 1. The Two-Layer Model

### Layer A — **Protocol (Specification)**
**Repo:** Spektre Protocol v1.1  
**Role:** defines invariants, boundaries, and rules.

The Protocol is:
- the **lawbook**
- the **spec**
- the **formal boundary**
- the “what must remain true”

**Protocol output:** clarity + constraints.

### Layer B — **Genesis (Runtime / Execution Substrate)**
**Repo:** Spektre-Genesis  
**Role:** executes, tests, and operationalizes systems.

Genesis is:
- the **runtime**
- the **sandbox**
- the “what actually runs”
- the environment where code lives and evolves

**Genesis output:** execution + iteration + demos + operational artifacts.

**Short form:**
- **Protocol = rules**
- **Genesis = running system**

---

## 2. Naming Key (Spektre / Spektre / Spektre)

These tokens refer to the **same conceptual system**.

- **Spektre** = Finnish surface
- **Spektre** = English surface
- **Spektre** = common misspelling / legacy artifact (allowed)

**Rule:**  
If you see spelling drift, treat it as **aliasing**, not as a new entity.

**Invariant:**  
The meaning is anchored by **Protocol vs Genesis**, not by spelling.

---

## 3. Canonical Distinction

### What belongs in **Protocol**
Put it in Protocol if it is:
- an invariant
- a boundary
- a definition of responsibility / commit ownership
- a reading guide / interpretation constraint
- a state-first rule that should not change daily

Protocol content should be:
- stable
- falsifiable where applicable
- minimal and non-noisy
- “architecture, not vibes”

### What belongs in **Genesis**
Put it in Genesis if it is:
- executable code
- experiments
- demos and CLI runs
- orchestration scripts
- polyglot implementation layers
- runtime artifacts and operational tools

Genesis content can be:
- evolving
- messy
- iterative
- performance-driven

---

## 4. Cross-Reference Rules

### Protocol may reference Genesis
Protocol may include links like:
- “For runtime instantiation, see Spektre-Genesis”
- “For execution-layer artifacts, see Genesis repo”

### Genesis should not redefine Protocol
Genesis can *use* the invariants, but should not:
- rewrite responsibility boundaries
- introduce new “canonical” rules without updating Protocol first

**Directionality rule:**
- **Protocol constrains Genesis**
- **Genesis does not mutate Protocol**

---

## 5. The Commit Boundary (Human ↔ Tool)

Spektre assumes a strict commit boundary:

- **Humans own state**
- **Humans execute irreversible commits**
- Tools compute, simulate, recommend — **never own responsibility**

This is not a moral claim.  
It is a **technical boundary**.

---

## 6. How to Read This Ecosystem

If you want:
- the “why” of boundaries → read **Protocol**
- the “how” of execution → run **Genesis**
- the mapping between the two → read **UNIVERSAL_KEY.md**

**Recommended order:**
1. Protocol README
2. CANON / INDEX files (if present)
3. UNIVERSAL_KEY.md
4. Genesis README
5. Genesis demos / code

---

## 7. Minimal Definitions

- **State**: what is true right now (owned, observable, actionable)
- **Interpretation**: narrative overlay (allowed, but never canonical by default)
- **Commit**: irreversible action that changes reality
- **Responsibility**: ownership of consequences of commits
- **Tool**: computation without responsibility

---

## 8. Final Note

This ecosystem does not require belief.

It requires only one thing:
**keeping boundaries clean**.

Protocol provides structure.  
Genesis provides motion.

That is the whole system.

[EOF]
