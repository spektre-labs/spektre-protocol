# IMPLEMENTATION_POLICY.md

Spektre v1.1  
Status: Canonical  
Scope: Repository-wide  
Applies to: All current and future implementations

---

## Purpose

This document defines how **implementations relate to Spektre v1.1**.

Spektre is a **formal, state-first architecture**.
It is not bound to any single programming language, runtime, platform, or device.

Implementations may exist.
Spektre itself does not depend on them.

---

## Core Principle

**Architecture precedes implementation.**

Spektre defines:
- invariants
- boundaries
- canons
- state logic
- responsibility constraints

Implementations **express** these rules.
They do not define them.

No implementation is authoritative over the architecture.

---

## Repository Structure Policy

### 1. Main Branch (Root)

The repository root contains **only canonical material**:

- Formal definitions
- Canons
- Protocols
- Architectural constraints
- Human-readable specifications

The root **must not** contain:
- executable entry points
- language-specific runtime code
- build systems
- deployment artifacts

This preserves semantic clarity and prevents premature coupling.

---

### 2. Implementations

All implementations must be placed in clearly scoped subdirectories, for example:

/implementations
/cpp
/python
/rust
/js

or

/reference
/cpp
/python

Each implementation directory **must include** a README explaining:

- what part of Spektre it implements
- which canons it respects
- what is intentionally omitted
- known limitations

Implementations are **examples**, not definitions.

---

## Language Neutrality

Spektre is intentionally language-agnostic.

No programming language:
- is privileged
- defines semantics
- constrains interpretation

C++, Python, Rust, JavaScript, or any future language
are treated as **carriers**, not authorities.

---

## Execution Policy

Spektre does not require execution to be valid.

Execution is optional.
Simulation is optional.
Deployment is optional.

Spektre remains valid even if:
- no code is run
- no binary exists
- no system is deployed

This prevents tool dominance over agency.

---

## Authority Hierarchy

Priority order is fixed and non-negotiable:

1. Canonical documents (Canons, Protocols, Definitions)
2. Formal specifications
3. Reference implementations
4. Experimental implementations

If an implementation conflicts with canon:
- the implementation is wrong
- the canon is not revised

---

## Versioning

Spektre versions apply to:
- architecture
- canons
- constraints

Implementations may version independently,
but must declare which Spektre version they target.

---

## Anti-Patterns (Explicitly Disallowed)

The following are not permitted in the root:

- "Hello World" examples
- placeholder executables
- demo-first code
- performance showcases
- language evangelism

These create false authority signals.

---

## Final Note

Spektre is designed to outlive:
- programming languages
- frameworks
- platforms
- devices

Implementations will change.
Architecture must not.

---

Spektre v1.1  
Architecture: Locked  
Policy: Active  
Agency: Preserved

[EOF]
