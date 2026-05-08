# DevOps Routing

The router turns broad operational requests into a safe, explicit workflow.

## Flow

1. Classify the request with `devops-router`.
2. Identify the domain skill or skill chain.
3. Confirm current documentation before generating platform-specific code or configuration.
4. Implement with the smallest useful blast radius.
5. Validate, record risks, and provide rollback instructions.

## Common Chains

| Request type | Skill chain |
| --- | --- |
| New infrastructure in a cloud | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| Application container delivery | `devops-router` -> `container-platforms` -> `cicd-automation` |
| Kubernetes production change | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| Incident on a known platform | `devops-router` -> `incident-troubleshooting` -> affected domain skill |
| VPN or private connectivity | `devops-router` -> `network-vpn-security` -> `security-secrets` |

The machine-readable table lives in [skills.json](skills.json).
