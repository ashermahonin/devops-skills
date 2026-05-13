# DevOps Routing

The router turns broad operational requests into a safe, explicit workflow.

## Flow

1. Classify the request with `devops-router`.
2. Identify the domain skill or skill chain.
3. Use Context7 MCP before platform-specific code, configuration, provider resources, manifests, pipelines, CLI commands, or security controls.
4. Apply the [principal-level operating model](principal-operating-model.md) for evidence, decision trace, risk budget, validation ladder, rollback, and handoff.
5. Implement with the smallest useful blast radius.
6. Validate, record risks, and provide rollback instructions.

## Principal-Level Bar

Operational work must preserve service health, security, and rollback ability. For production, security-sensitive, or cross-boundary changes, the selected skill must show current documentation evidence, explicit blast radius, least-privilege posture, validation commands, and a rollback path before write-heavy work starts.

## Common Chains

| Request type | Skill chain |
| --- | --- |
| New infrastructure in a cloud | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| Application container delivery | `devops-router` -> `container-platforms` -> `cicd-automation` |
| Kubernetes production change | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| Incident on a known platform | `devops-router` -> `incident-troubleshooting` -> affected domain skill |
| VPN or private connectivity | `devops-router` -> `network-vpn-security` -> `security-secrets` |

The machine-readable table lives in [skills.json](skills.json).
