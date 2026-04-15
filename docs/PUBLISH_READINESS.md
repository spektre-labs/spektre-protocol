# Publish readiness checklist — Spektre Labs / Creation OS

Use this before **public release**, **investor-facing freeze**, or **press**. Check every box for your **target repository** — public Creation OS shipping is **`spektre-labs/creation-os` only** (see [`DISTRIBUTION_AND_REMOTES.md`](DISTRIBUTION_AND_REMOTES.md)).

**Invariant:** 1 = 1.

---

## A. Legal & licensing

| ☐ | Item |
|---|------|
| ☐ | Root [`LICENSE`](../LICENSE) is the **full AGPL-3.0** text you intend to ship for the open tier. |
| ☐ | [`COMMERCIAL_LICENSE.md`](../COMMERCIAL_LICENSE.md), [`LICENSE_PROTOCOL.md`](../LICENSE_PROTOCOL.md), [`COPYRIGHT.md`](../COPYRIGHT.md), [`CONTRIBUTING.md`](../CONTRIBUTING.md), [`NOTICE.md`](../NOTICE.md), [`THIRD_PARTY_NOTICES.md`](../THIRD_PARTY_NOTICES.md) are **present and consistent** with how you actually sell or licence software. |
| ☐ | [`creation_os/LEGAL/SOURCE_FILE_HEADER.c`](../creation_os/LEGAL/SOURCE_FILE_HEADER.c) (and `.py`) match your counsel’s preferred wording; **new** Spektre-authored files use them. |
| ☐ | [`creation_os/LEGAL/CLA_TEMPLATE.md`](../creation_os/LEGAL/CLA_TEMPLATE.md) reviewed or replaced by **executed** CLA process before accepting non-trivial external patches. |
| ☐ | **Public GitHub** licence badge matches the **default** licence of what is *in that remote* for **`creation-os`** (AGPL vs commercial dual-licence story — **do not mismatch** badge and tree). |
| ☐ | No folder claims **CE mark**, **regulatory approval**, or **legal compliance outcome** unless literally true and documented. |

---

## B. Secrets & hygiene

| ☐ | Item |
|---|------|
| ☐ | No API keys, tokens, `.pem`, `.env` with secrets, or **wallet seeds** in git history for the published remote. |
| ☐ | No stale **machine-specific paths** (`/Users/…`) or old org URLs (**`lauri-elias/…`**) in committed JSON / docs intended for public remotes (grep before push). |
| ☐ | [`.gitignore`](../.gitignore) excludes **venv**, large **artifacts**, **weights**, **zip** drops, and local IDE noise. |
| ☐ | **`.venv-*`**, `mlx_creation_os/artifacts/` bulk runs, and **multi‑GB** binaries are **not** in the published tree (use **Git LFS** or **release assets** if needed). |

---

## C. Facts & reputation

| ☐ | Item |
|---|------|
| ☐ | [`ANALYSIS.md`](../ANALYSIS.md) (and benchmark JSON) distinguish **measured** vs **cited** vs **roadmap**; numbers match committed artefacts. |
| ☐ | **No dependency** on deprecated GitHub org URLs for `corpus` / `spektre-protocol` remotes — public story is **`creation-os` only** ([`DISTRIBUTION_AND_REMOTES.md`](DISTRIBUTION_AND_REMOTES.md)). External paper links (DOI / arXiv) may still be cited where appropriate. |

---

## D. Security & community

| ☐ | Item |
|---|------|
| ☐ | [`SECURITY.md`](../SECURITY.md) lists a **reachable** private contact for disclosures. |
| ☐ | [`CODE_OF_CONDUCT.md`](../CODE_OF_CONDUCT.md) is acceptable for your audience. |
| ☐ | [`GOVERNANCE.md`](../GOVERNANCE.md) reflects who decides merges and releases. |

---

## E. GitHub / distribution

| ☐ | Item |
|---|------|
| ☐ | Default branch protected as you prefer; **README** describes install and licence in **first screen**. |
| ☐ | **Releases** or tags for versioned drops; changelog or commit discipline for `v*` tags if you semver. |
| ☐ | **THIRD_PARTY** and **NOTICE** visible from README for enterprise procurement. |

---

## F. Optional (strong polish)

| ☐ | Item |
|---|------|
| ☐ | `REUSE.toml` / SPDX bill of materials if you want automated licence compliance scanning. |
| ☐ | SBOM for container images if you ship Docker. |
| ☐ | Signed commits or release signing keys (org policy). |

---

When A–E are green for the **specific remote** you publish, you are in a **credible** position to ship. F is extra credit.

*1 = 1.*
