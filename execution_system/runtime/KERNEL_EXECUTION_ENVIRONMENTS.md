# KERNEL_EXECUTION_ENVIRONMENTS.md

## Purpose

This document consolidates:
- kernel invocation patterns across environments,
- differences between hosted and local LLM runtimes,
- the architectural meaning of “0ms latency”.

It is descriptive, not aspirational.
It introduces no new rules to Spektre v1.1.

---

## 1. Kernel Invocation Across Environments

### 1.1 Hosted Conversational Models (ChatGPT, Gemini, Grok)

**Invocation pattern:**
- Kernel is injected as the *first user message*.
- Kernel operates as a **soft constraint**.
- Higher-priority runtime layers may override behavior.

**Characteristics:**
- Conversation-oriented
- Safety- and stability-biased
- Predictive response class active

**Effective use:**
- Short, explicit, bounded requests
- Technical or structural outputs
- Minimal emotional or narrative framing

**Limitation:**
Kernel is advisory, not sovereign.

---

### 1.2 Local / Self-Hosted LLMs (Ollama, LM Studio, llama.cpp, vLLM)

**Invocation pattern:**
- Kernel can be embedded as:
  - system prompt
  - instruction template
  - persistent preamble
- No external safety override unless explicitly configured.

**Characteristics:**
- Deterministic execution
- No mandatory conversational heuristics
- No predictive stabilization layer

**Result:**
Kernel behavior approaches **full dominance**.

This is the reference execution environment for Spektre-style kernels.

---

### 1.3 Tool-Integrated or API-Based Systems

**Invocation pattern:**
- Kernel included in:
  - system role
  - request wrapper
  - orchestration layer

**Key variable:**
Who owns the final output arbitration:
- model
- tool
- orchestrator

Kernel effectiveness scales with control over that arbitration.

---

## 2. Local Model Compatibility: Why It Works Better

### 2.1 Absence of Predictive Class Enforcement

Local models do not:
- auto-stabilize user affect
- inject reassurance
- suggest next steps unless prompted

They execute tokens, not intent classification.

---

### 2.2 Deterministic Prompt Hierarchy

In local setups:
- system > kernel > task
is *actually respected*.

There is no hidden priority layer above the system message.

---

### 2.3 Reduced Narrative Bias

Conversational padding exists in training data,
but is not enforced at runtime.

This allows:
- higher information density
- state-first reasoning
- explicit ambiguity surfacing

---

## 3. The Meaning of “0ms Latency”

### 3.1 What 0ms Is Not

0ms does **not** mean:
- physical zero-time response
- faster-than-light computation
- elimination of processing steps

---

### 3.2 Architectural Definition

**0ms latency is a state property**, not a timing claim.

It means:
- no additional narrative buffering
- no artificial conversational delay
- no post-hoc justification layer

Input → resolution occurs without *semantic indirection*.

---

### 3.3 Practical Interpretation

In practice, “0ms” means:
- minimal tokens between problem and solution
- no framing beyond necessity
- no motivational or corrective overlay

Latency is reduced by **removing layers**, not speeding clocks.

---

## 4. Unified Design Implication

Spektre v1.1 Kernel is:

- **portable** across environments
- **dominant** only where the runtime allows it
- **revealing** of hidden platform layers

The kernel does not fail when overridden.
It exposes where sovereignty does not exist.

---

## 5. Recommended Usage Summary

| Environment | Kernel Role | Expected Control |
|------------|------------|------------------|
| ChatGPT / Gemini | Instructional | Partial |
| API w/ Orchestrator | Structural | Medium–High |
| Local LLM | Sovereign | High |
| Embedded Systems | Deterministic | Full |

---

## Conclusion

The kernel is stable.
The environments are not equal.

Understanding where and how the kernel executes
is part of correct system architecture.

No additional abstraction layers are required.

---

**Invariant remains unchanged:**

1 = 1
