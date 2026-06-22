#!/usr/bin/env python3
"""
check_links — internal-link integrity ratchet for the spektre-protocol corpus (stdlib).

This is a large, hand-maintained knowledge base (300+ markdown files). A strict
"zero broken links" gate would be red on day one and force a risky mass-edit. So
instead this is a RATCHET: the currently-known broken links are recorded as a
baseline; CI passes as long as no NEW rot is introduced, and fails (listing them)
the moment a change adds broken internal links. Fixing baseline entries only ever
shrinks the debt.

  check_links.py              # check against tools/link_baseline.json — exit 1 on NEW breakage
  check_links.py --update     # rewrite the baseline to the current state (maintainer action)

σ-honest: the baseline is published debt, not hidden. `link_debt` count is visible.
"""
from __future__ import annotations
import re, sys, json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BASELINE = Path(__file__).resolve().parent / "link_baseline.json"
LINK_RE = re.compile(r"\[[^\]]*\]\(([^)]+)\)")


def current_broken() -> set[str]:
    broken = set()
    for md in ROOT.rglob("*.md"):
        if ".git" in md.parts:
            continue
        try:
            text = md.read_text(encoding="utf-8", errors="ignore")
        except Exception:
            continue
        for m in LINK_RE.finditer(text):
            target = m.group(1).strip()
            if target.startswith(("http://", "https://", "#", "mailto:", "tel:")):
                continue
            path_part = target.split("#")[0].split("?")[0].strip()
            if not path_part:
                continue
            if not (md.parent / path_part).resolve().exists():
                broken.add(f"{md.relative_to(ROOT).as_posix()} -> {target}")
    return broken


def main(argv: list[str]) -> int:
    cur = current_broken()
    if argv[:1] == ["--update"]:
        BASELINE.write_text(json.dumps({"known_broken": sorted(cur)}, indent=2) + "\n")
        print(f"baseline updated: {len(cur)} known-broken internal link(s)")
        return 0
    baseline = set()
    if BASELINE.exists():
        baseline = set(json.loads(BASELINE.read_text()).get("known_broken", []))
    new = sorted(cur - baseline)
    fixed = sorted(baseline - cur)
    print(f"◆ LINK HEALTH — {len(cur)} broken internal link(s) (baseline debt: {len(baseline)})")
    for f in fixed:
        print(f"  ✓ FIXED (run --update to bank it): {f}")
    for n in new:
        print(f"  ✗ NEW broken link: {n}")
    if new:
        print(f"  σ: HALT — {len(new)} new broken link(s) introduced (do not add rot)")
        return 1
    print("  σ: PASS — no new rot" + (f"; {len(fixed)} fixed — maintainer can --update" if fixed else ""))
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
