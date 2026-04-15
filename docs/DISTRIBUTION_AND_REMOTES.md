# Distribution and GitHub remotes (Spektre Labs)

## Three repositories — all active, different jobs

| Repository | Role |
|------------|------|
| **[spektre-labs/creation-os](https://github.com/spektre-labs/creation-os)** | **Kernel & portable Creation OS engineering** — `creation_os_v2.c`, tests, benchmarks, CI, evidence-class docs. **Default git target** when shipping Creation OS **code**. |
| **[spektre-labs/spektre-protocol](https://github.com/spektre-labs/spektre-protocol)** | **Spektre v1.1 conceptual archive** — layered markdown system (`protocol_core/`, `formal_structure/`, human layer, essays, `docs/` maps). **Not** the place to land a mistaken “whole kernel tree” push meant for creation-os. |
| **[spektre-labs/corpus](https://github.com/spektre-labs/corpus)** | **Open theory corpus** — CC BY 4.0 papers, Zenodo DOIs, README index. **Bibliographic** home; not the CI surface for the C reference kernel. |

None of the three is “deprecated”. Confusion comes from **pushing the wrong artifact to the wrong remote** — not from the existence of the repos.

## Git hygiene (Creation OS engineers)

- **Creation OS code / kernel docs / `make check` CI** → **`creation-os`**.
- **Protocol canon + formal archive edits** → **`spektre-protocol`**.
- **Paper metadata + corpus README** → **`corpus`**.

If your local checkout is a **monorepo** that contains multiple trees, set **remotes explicitly** (`origin` vs `creation-os`) before `git push`.

## Canonical map for agents

See the portable copy shipped with the kernel:  
**[creation-os/docs/REPOS_AND_ROLES.md](https://github.com/spektre-labs/creation-os/blob/main/docs/REPOS_AND_ROLES.md)**  
(in this monorepo: `creation-os/docs/REPOS_AND_ROLES.md` when that directory is present).

---

*Spektre Labs · 2026*
