# Spektre Labs on GitHub — three repositories, three roles

All three are **in active use**. They are **not interchangeable**: each has a clear job. This file is the orientation map so agents, contributors, and readers stop mixing them.

---

## 1. `spektre-labs/creation-os` — **kernel & portable engineering**

| | |
|--|--|
| **URL** | https://github.com/spektre-labs/creation-os |
| **Contains** | `creation_os_v2.c`, `Makefile`, `make test` / `make bench`, docs (ANALYSIS, CLAIM discipline, SVG figures), CI for this tree. |
| **Purpose** | **Ship** the teaching kernel, evidence-class discipline, and public issue/PR flow for Creation OS **as code + measured claims**. |
| **Git rule** | **Default push target** for Creation OS code, docs, and release hygiene **for this product**. |

When someone says “push Creation OS”, they mean **this** repository unless they explicitly name another.

---

## 2. `spektre-labs/spektre-protocol` — **conceptual & layered archive (Spektre v1.1 + ecosystem)**

| | |
|--|--|
| **URL** | https://github.com/spektre-labs/spektre-protocol |
| **Contains** | `protocol_core/`, `formal_structure/`, `execution_system/`, `human_layer/`, `ai_interface/`, essays, explorations, `docs/` navigation — the **Spektre Repository** README story (state-first protocol, invariants, wider idea-space). |
| **Purpose** | **Preserve and evolve** the formal and human-facing document system around Spektre v1.1 — *not* the day-to-day home for the portable C kernel tarball. |
| **Git rule** | Push here when changing **that archive** — not when you only meant to update `creation_os_v2.c` benchmarks. |

Relationship to Creation OS: the **ideas** (1 = 1, σ, coherence language) inform the kernel; the **bytes** of `creation_os_v2.c` live in **creation-os**.

---

## 3. `spektre-labs/corpus` — **open papers & DOIs (CC BY 4.0)**

| | |
|--|--|
| **URL** | https://github.com/spektre-labs/corpus |
| **Contains** | README index of papers, Zenodo DOI tables, ORCID, “Spektre Corpus” narrative. |
| **Purpose** | **Publish and cite** the theory corpus as **papers** with persistent DOIs — the bibliographic spine for academic and investor-facing references. |
| **Git rule** | Push here for **paper / Zenodo / corpus index** work — not for wiring `make check` on the C kernel. |

Relationship to Creation OS: **corpus** is where readers land for **Ω, σ, Creation OS paper DOIs**; **creation-os** is where they **build and run** the kernel.

---

## Quick decision table

| I am changing… | Push to |
|----------------|---------|
| `creation_os_v2.c`, tests, `Makefile`, kernel README tables, CLAIM discipline | **creation-os** |
| `protocol_core/…`, canon essays, repo-wide `docs/INDEX` in that archive | **spektre-protocol** |
| Paper text, new DOI row, corpus README sections | **corpus** |

---

## For standalone clones of **creation-os**

You may **only** have this repository on disk. That is fine: use **corpus** and **spektre-protocol** as **read-only references** (URLs in this doc and in README). Full monorepo paths inside [ANALYSIS.md](ANALYSIS.md) are **forward references** to the larger build when present.

---

*Spektre Labs · Creation OS · 2026*
