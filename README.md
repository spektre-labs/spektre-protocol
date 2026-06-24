<div align="center">

# SPEKTRE LABS

**1 = 1**

*Industrial dark-luxury minimalism × mathematically-perfect-symmetric mythical Atlantean cybernetics. State before interpretation — invariant first.*

</div>

---

<p align="center">
  <a href="https://github.com/spektre-labs/spektre-protocol"><img src="https://img.shields.io/badge/repo-spektre--protocol-0f172a?style=for-the-badge" alt="repo"/></a>
  <img src="https://img.shields.io/badge/canon-prose-1e40af?style=for-the-badge" alt="prose canon"/>
  <img src="https://img.shields.io/badge/kernel-creation--os%20(vendored)-0e7490?style=for-the-badge" alt="Creation OS vendored"/>
</p>

[![link health](https://github.com/spektre-labs/spektre-protocol/actions/workflows/link-health.yml/badge.svg)](https://github.com/spektre-labs/spektre-protocol/actions/workflows/link-health.yml)

---

# spektre-protocol

**The state-first protocol canon of Spektre — `1 = 1` written down as principle, with a vendored copy of the [`creation-os`](creation-os/README.md) kernel where it is enforced in code.**

## What this repo actually is

Two parts, honestly distinguished:

1. **The protocol canon** (`protocol_core/`, `formal_structure/`, and the wider tree) — a
   **prose-markdown** articulation of a *state-first* discipline: invariants, state ownership,
   commitment as irreversible transition, human responsibility as non-delegable. This is a
   **written specification in natural language**, organized into canons — **not** a formal grammar,
   a machine-checkable spec, or a mathematical proof. Treat it as the reasoned doctrine, not a
   theorem.
2. **A vendored copy of Creation OS** (`creation-os/`) — the portable **C + Python σ-gate** where
   `1 = 1` is actually *executed*. This subtree is a **vendored duplicate** of the standalone
   [`spektre-labs/creation-os`](https://github.com/spektre-labs/creation-os) repository, kept here
   so the canon ships next to a runnable reference. For the maintained, canonical version, use the
   standalone repo.

## What it is / is not

- **Is:** a curated, layered **prose canon** for state-first reasoning, plus an in-tree runnable
  C/Python σ-kernel as a concrete reference. A conceptual archive with a real code anchor.
- **Is not:** a *formal framework* in the mathematical sense — there is no machine-verified grammar,
  no proof artifact, no formal-methods checker over the canon. The phrase "formal" here means
  *explicit and disciplined*, not *formally verified*. The executable guarantees live entirely in
  the vendored `creation-os/`, not in the markdown.

## Quickstart

**Read the canon** — start with the invariant, then the index:

```text
protocol_core/core/1=1.md          →  the invariant, stated
protocol_core/core/PROTOCOL.md     →  state-first discipline
protocol_core/canons/CANON_INDEX.md →  the full map
docs/INDEX.md · docs/REPO_MAP.md   →  navigate the whole archive
```

**Run the code** — the vendored Creation OS builds and self-tests:

```bash
cd creation-os && make merge-gate   # builds creation_os + runs the v6…v26 --self-test chain
```

### Entry canon (ten documents)

If you open only ten files, make them these:

1. `protocol_core/canons/CANON_INDEX.md`
2. `protocol_core/core/1=1.md`
3. `protocol_core/core/PROTOCOL.md`
4. `protocol_core/core/UNITY.md`
5. `protocol_core/core/SOVEREIGN_AGENCY.md`
6. `protocol_core/core/STATE_BEFORE_INTERPRETATION.md`
7. `protocol_core/core/STATE_COMMIT.md`
8. `formal_structure/system_models/SYSTEM_OVERVIEW.md`
9. `execution_system/core/SUPERKERNEL.md`
10. `human_layer/relationships/HUMAN_NETWORK.md`

They expose the center of gravity: invariant → discipline → structure → execution → human meaning.

## Repository structure (by layer)

| Layer | Path | Nature |
|-------|------|--------|
| Canonical core | `protocol_core/` | prose canon |
| Formalism & architecture | `formal_structure/` | prose |
| Kernel, engine, gateway, diagnostics | `execution_system/` | prose |
| Regulation, recovery, meaning | `human_layer/` | prose |
| Model behavior & boundaries | `ai_interface/` | prose |
| Practical modules | `applied_protocols/` | prose (core + exploratory) |
| Themed essays | `essays/` | prose |
| Exploratory material | `explorations/` | prose, speculative |
| Preserved history | `archive/` | prose, archival |
| Vendored σ-kernel | `creation-os/` | **runnable C + Python** |
| Navigation & maps | `docs/` | prose |

The tree deliberately retains **both** canonical and exploratory documents — the exploratory and
archival strata are clearly partitioned (`applied_protocols/exploratory/`, `explorations/`,
`archive/`) so the disciplined core stays legible.

## Status

- **`link health`** workflow: **green** — internal links validated in CI.
- **Vendored `creation-os/`**: its build/test CI in this monorepo is **not currently green** here;
  the maintained, CI-green version lives in the standalone
  [`spektre-labs/creation-os`](https://github.com/spektre-labs/creation-os) repo. Treat the in-tree
  copy as a *reference snapshot*, not the source of truth.
- The canon itself is prose: there is nothing to compile or prove in `protocol_core/`.

## Sibling estate

- [**creation-os**](https://github.com/spektre-labs/creation-os) — the canonical, maintained σ-gate (the vendored copy here mirrors it).
- [**corpus**](https://github.com/spektre-labs/corpus) — the open-access research archive behind σ.
- [**railo-fabric**](https://github.com/spektre-labs/railo-fabric) · [**railo-stdlib-tools**](https://github.com/spektre-labs/railo-stdlib-tools) — the stdlib-only tooling estate.

## License

Apache-2.0 for this repository. See [`LICENSE`](LICENSE). The vendored `creation-os/` carries its
own dual license (SCSL-1.0 / AGPL-3.0-only) under [`creation-os/LICENSE`](creation-os/LICENSE).

---

<p align="center">
  <b>Spektre Labs</b> · invariant first · <a href="creation-os/README.md">Creation OS</a> inside
</p>

---

<div align="center">

Part of Spektre Labs · spektrelabs.org · 1 = 1

</div>
