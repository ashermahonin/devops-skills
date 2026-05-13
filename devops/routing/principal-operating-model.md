# Principal-Level DevOps Operating Model

This model raises every DevOps skill from command generation to senior operational judgment. Use it before implementation, before production-affecting changes, and before final handoff.

## Core Standard

1. **Evidence before confidence.** Separate observed facts, assumptions, and recommendations. Use current docs, platform state, repo evidence, plans, logs, metrics, traces, or test output before claiming certainty.
2. **Context7 by default.** Use Context7 MCP for current cloud, Kubernetes, IaC, CI/CD, container, observability, security, network, API, CLI, provider, and configuration documentation.
3. **Operational risk budget.** Identify blast radius, reversibility, security impact, data impact, outage risk, cost impact, and compliance constraints.
4. **Decision trace.** Record options considered, tradeoffs, chosen path, why alternatives were rejected, validation evidence, and rollback or containment.
5. **Validation ladder.** Prefer the cheapest useful proof first: syntax check, lint, dry-run, plan, diff, policy scan, smoke test, rollback rehearsal, then production rollout.
6. **Least privilege and supply-chain trust.** Keep IAM/RBAC/network access minimal, avoid long-lived secrets, pin versions, and document artifact provenance when releases are involved.
7. **Stop conditions.** Pause for approval before destructive actions, production changes, broad network exposure, credential changes, data migrations, or irreversible state operations.

## Principal Review Questions

- Which current docs were verified through Context7 or a primary source?
- What is the exact target environment, version, provider, and region?
- What is the blast radius and fastest safe rollback?
- What validation proves the change before production?
- What observability will show success or failure?
- What security or supply-chain assumption could be wrong?
- What runbook, decision note, or project-memory entry should future agents read?

## Source-Informed Practices

- [Google SRE](https://sre.google/sre-book/service-level-objectives/) emphasizes SLIs/SLOs and release decisions tied to user-visible reliability.
- [DORA capabilities](https://dora.dev/capabilities/) emphasize test automation, continuous delivery, code maintainability, and cloud infrastructure practices.
- [NIST SSDF](https://csrc.nist.gov/pubs/sp/800/218/final) emphasizes secure software development integrated across the lifecycle.
- [OpenSSF SLSA](https://slsa.dev/spec/v1.0/) emphasizes supply-chain provenance and artifact trust.
- [Context7 MCP](https://github.com/upstash/context7) guidance recommends automatic use for code generation, setup, configuration, and library/API documentation.
