# spektre-verify — neutral reasoning verification for RLVR

Your reasoning model grades its own proofs. That is a conflict of interest, and the reward signal it produces
is neither trustworthy nor replayable. **spektre-verify** is a live, public, **independent** verifier: it
sends a claim to a **heterogeneous quorum** of proof kernels (z3 ∧ cvc5 — different codebases, different bug
surfaces) that no model controls, and returns a verdict + a content-addressed certificate anyone replays
offline.

## One line into your RLVR loop

```python
from spektre_verify import reward
r = reward(model_proof_smt2, expect="unsat")   # 1.0 iff every independent kernel confirms, else 0.0
```

Zero dependencies (Python stdlib). No account, no API key. Live now:
`https://verified-reasoning.ambitiousdesert-2c4075a0.northeurope.azurecontainerapps.io`

## Why it is different from every lab's own verifier

- **Generator ≠ verifier, by construction.** The arbiters are foreign to any generator — the one property a
  self-grader structurally cannot have (the moment it issues its own grade, it forfeits it).
- **Quorum, not vote.** `admitted` is `True` only if **every** kernel confirms; a single kernel flagging a
  forgery **rejects** it. A fake must fool z3 *and* cvc5 at once. Adding kernels only ratchets soundness up.
- **Divergence signal.** When kernels disagree (`divergence=True`), the claim sits at the edge of
  decidability — no lone verifier's verdict is trustworthy there, and the quorum refuses. *(Real: on
  `x³+y³=42`, z3→`unknown` while cvc5→`unsat`.)*
- **Replayable, gate-proof.** The certificate carries every kernel's verdict + versions; re-derive it offline
  against all kernels, trusting nobody. The quorum spans independent engines/sources — no single provider or
  account gate can weaken it.

## Verify a claim directly

```python
from spektre_verify import verify
# to prove a theorem, assert its NEGATION and expect "unsat"
verify("(declare-const x Int)(assert (= (* x x) 2))", "unsat")   # √2 irrational over ℤ → admitted
```

Domains: propositional/first-order logic + integer/real arithmetic and number theory (SMT-LIB2 over
Bool/Int/Real). Formal-proof (Lean) and sandboxed-code re-checkers extend the same quorum.

— SPEKTRE LABS
