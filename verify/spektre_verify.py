#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""spektre_verify — one-line neutral reasoning verification for any RLVR pipeline. Zero dependencies.

The problem this ends: your reasoning model grades its own proofs. That is a conflict of interest, and the
reward signal it produces is not trustworthy or replayable. spektre_verify sends the claim to an INDEPENDENT
heterogeneous quorum (z3 ∧ cvc5 — different codebases) that no model controls; you get back a verdict + a
content-addressed certificate anyone can replay offline. Drop it in as your RLVR reward:

    from spektre_verify import verify
    reward = 1.0 if verify(model_proof_smt2, expect="unsat")["admitted"] else 0.0

`admitted` is True only if EVERY kernel confirms; a single kernel flagging a forgery rejects it. When the
kernels DISAGREE (`divergence=True`) the claim is at the edge of decidability — no lone verifier's verdict is
trustworthy there, and the quorum refuses. That signal is impossible for a self-grader to produce.

Public, live, gate-proof. No account, no key, no install beyond the stdlib.
"""
from __future__ import annotations

import json
import urllib.request

ENDPOINT = "https://verified-reasoning.ambitiousdesert-2c4075a0.northeurope.azurecontainerapps.io"


def verify(smt2: str, expect: str = "unsat", endpoint: str = ENDPOINT, timeout: float = 30.0) -> dict:
    """Verify an SMT-LIB2 reasoning claim against the neutral quorum. To prove a theorem, assert its
    NEGATION and expect 'unsat'. Returns {admitted, kernels, divergence, certificate, ...}."""
    req = urllib.request.Request(
        endpoint.rstrip("/") + "/verify",
        data=json.dumps({"smt2": smt2, "expect": expect}).encode(),
        headers={"Content-Type": "application/json"},
    )
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return json.loads(r.read())


def reward(smt2: str, expect: str = "unsat") -> float:
    """RLVR reward: 1.0 iff the quorum ADMITS (all independent kernels confirm), else 0.0."""
    try:
        return 1.0 if verify(smt2, expect).get("admitted") else 0.0
    except Exception:
        return 0.0


if __name__ == "__main__":
    import sys
    if "--selftest" in sys.argv:
        # live check: a valid theorem is admitted, a forgery is not
        good = verify("(declare-const p Bool)(declare-const q Bool)(assert (and (=> p q) p (not q)))", "unsat")
        bad = verify("(declare-const p Bool)(assert p)", "unsat")
        assert good["admitted"] and not bad["admitted"], f"live endpoint unsound: {good} {bad}"
        print(f"spektre_verify live OK — quorum {good['quorum']}, forgery rejected, cert {good['certificate'][:16]}…")
    else:
        import sys as _s
        print(json.dumps(verify(_s.argv[1] if len(_s.argv) > 1 else
              "(declare-const x Int)(assert (= (* x x) 2))", _s.argv[2] if len(_s.argv) > 2 else "unsat"),
              indent=2))
