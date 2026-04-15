# Publishing `creation-os/` from a monorepo checkout → **spektre-labs/creation-os**

Read **[REPOS_AND_ROLES.md](REPOS_AND_ROLES.md)** first: **protocol**, **corpus**, and **creation-os** are all in use — different roles. This page is only about **copying the kernel tree** into the **creation-os** remote without accidentally pushing it to **`spektre-protocol`** (`origin` there).

---

## Why `git push origin main` is wrong in the monorepo

In **`spektre-labs/spektre-protocol`**, `origin` usually points at **that** repository. A kernel drop belongs in **`spektre-labs/creation-os`**, not mixed into the conceptual archive’s default push.

---

## Manual sync (safe pattern)

From a machine that has **both** trees (monorepo with a `creation-os/` folder and network access):

```bash
STAGE=$(mktemp -d)
SRC="/absolute/path/to/spektre-protocol/creation-os"   # folder inside monorepo
git clone https://github.com/spektre-labs/creation-os.git "$STAGE/repo"
find "$STAGE/repo" -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
rsync -a "$SRC/" "$STAGE/repo/"
cd "$STAGE/repo"
git add -A
git status
git commit -m "Sync creation-os from monorepo"
git push origin main
```

Use a PAT or SSH for `git push` as you normally do for **creation-os**.

---

## Checklist

- [ ] Diff reviewed (`git diff` / PR on **creation-os**).
- [ ] No secrets or machine-only paths in committed files.
- [ ] **spektre-protocol** and **corpus** were **not** overwritten by this operation.

---

*Spektre Labs · 2026*
