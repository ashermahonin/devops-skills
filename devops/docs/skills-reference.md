# DevOps Skills reference

<p align="center">
  <a href="skills-reference.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <strong>🇬🇧 English</strong>
  &nbsp;·&nbsp; <a href="skills-reference.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <a href="skills-reference.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="README.md">Guide</a>
</p>

## Reading order

Each skill has three files that work together:

- `SKILL.md` is the operational contract. It says what to inspect, how to work, which result to produce, and how to hand it over.
- `references/` contains the reusable workflow for that operational domain. Read the linked file below when the skill is selected.
- `agents/openai.yaml` is integration metadata. It does not override the contract.

`devops/routing/skills.json` decides which skill owns a request. For work that crosses domains, use its defined combinations or the [routing guide](../routing/README.md). Current vendor and platform documentation must be checked through Context7 MCP before implementation details are generated.

## Routing and platform skills

| Skill | Use it when | Required result | Reference |
| --- | --- | --- | --- |
| [`devops-router`](../skills/devops-router/SKILL.md) | The request spans infrastructure, deployment, automation, security, incident, cloud, Kubernetes, CI/CD, containers, scripting, observability, or network work. | Selected chain, safety gates, boundary, required evidence, and handoff format. | [`master-rules.md`](../skills/devops-router/references/master-rules.md) |
| [`kubernetes-operations`](../skills/kubernetes-operations/SKILL.md) | The task involves manifests, Helm, Kustomize, rollout, scaling, storage, networking, RBAC, policies, or a cluster problem. | Validated cluster change or review plan, impact, observability, rollback, and ownership. | [`workflow.md`](../skills/kubernetes-operations/references/workflow.md) |
| [`cloud-operations`](../skills/cloud-operations/SKILL.md) | The task affects a provider, IAM, VPC/VNet, region, managed service, resilience, migration, or cost. | Current-provider evidence, scoped design or change, risk, validation, and rollback. | [`workflow.md`](../skills/cloud-operations/references/workflow.md) |
| [`infrastructure-as-code`](../skills/infrastructure-as-code/SKILL.md) | Terraform, OpenTofu, Pulumi, CloudFormation, Bicep, ARM, Crossplane, state, imports, plans, policies, or drift is involved. | Reviewed plan, state-safety assessment, policy result, change record, and rollback or containment. | [`workflow.md`](../skills/infrastructure-as-code/references/workflow.md) |
| [`container-platforms`](../skills/container-platforms/SKILL.md) | The task affects Docker, BuildKit, Podman, Compose, OCI images, registries, image security, or runtime behavior. | Reproducible build or runtime configuration, image-security evidence, and validation result. | [`workflow.md`](../skills/container-platforms/references/workflow.md) |

## Automation, observability, and connectivity

| Skill | Use it when | Required result | Reference |
| --- | --- | --- | --- |
| [`cicd-automation`](../skills/cicd-automation/SKILL.md) | Build, test, scan, package, deploy, approvals, protected environments, release, or rollback automation changes. | Pipeline contract, protected steps, validation proof, delivery path, and rollback plan. | [`workflow.md`](../skills/cicd-automation/references/workflow.md) |
| [`scripting-automation`](../skills/scripting-automation/SKILL.md) | Bash, Python, PowerShell, migration, diagnostic, CLI helper, or repeatable operational task is needed. | Safe, documented script with arguments, dry-run where appropriate, error behavior, idempotency, and validation. | [`workflow.md`](../skills/scripting-automation/references/workflow.md) |
| [`observability-operations`](../skills/observability-operations/SKILL.md) | Metrics, logs, traces, dashboards, alerts, SLI/SLO, production diagnosis, or alert-noise reduction needs work. | Signals, dashboards, alert conditions, owners, validation, and interpretation for operators. | [`workflow.md`](../skills/observability-operations/references/workflow.md) |
| [`network-vpn-security`](../skills/network-vpn-security/SKILL.md) | Network topology, VPN, routing, DNS, firewall, ACL, security groups, private connectivity, MTU, or latency is involved. | Trust boundaries, least-privilege rules, validation path, and rollback or containment. | [`workflow.md`](../skills/network-vpn-security/references/workflow.md) |

## Security and incidents

| Skill | Use it when | Required result | Reference |
| --- | --- | --- | --- |
| [`security-secrets`](../skills/security-secrets/SKILL.md) | Secrets, IAM/RBAC, KMS/Vault/SOPS, workload identity, SBOM, signing, policy, audit, or rotation is involved. | Secure secret flow, access review, rotation path, supply-chain evidence, and policy findings. | [`workflow.md`](../skills/security-secrets/references/workflow.md) |
| [`incident-troubleshooting`](../skills/incident-troubleshooting/SKILL.md) | An outage, degradation, failed deploy, emergency diagnosis, stabilization, or performance regression is active. | Evidence timeline, hypotheses, least-risk mitigation, recovery, rollback, follow-up, and prevention record. | [`workflow.md`](../skills/incident-troubleshooting/references/workflow.md) |

## Common chains

| Situation | Skill chain |
| --- | --- |
| Cloud infrastructure managed as code | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| Application image and delivery pipeline | `devops-router` -> `container-platforms` -> `cicd-automation` -> `security-secrets` |
| Production Kubernetes change | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| Active incident | `devops-router` -> `incident-troubleshooting` -> `observability-operations` -> affected domain skill |
| Private connectivity or VPN | `devops-router` -> `network-vpn-security` -> `security-secrets` -> `cloud-operations` |

The selected skill never replaces the principal operating model. Before production or high-risk work, record current documentation, actual state, impact, validation, rollback, and handoff.
