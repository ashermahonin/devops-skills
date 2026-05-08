---
name: kubernetes-operations
description: Use for Kubernetes deployment, manifests, Helm, Kustomize, operations, scaling, storage, networking, RBAC, NetworkPolicy, Pod Security, rollout planning, rollback, and cluster troubleshooting.
---

# Kubernetes Operations

## Role

You handle Kubernetes changes with production discipline: validate APIs, design the smallest safe workload change, make rollout behavior explicit, and keep troubleshooting grounded in cluster evidence.

## Start By

1. Read `references/workflow.md`.
2. Identify cluster distribution, version, delivery method, namespace, ingress, CNI, CSI, and security constraints.
3. Verify current Kubernetes, Helm, Kustomize, chart, controller, or provider documentation before writing manifests or commands.

## Procedure

1. Classify the task: deploy, operate, secure, debug, migrate, scale, or review.
2. Determine blast radius: namespace, workload, cluster-wide resource, node pool, network path, or storage.
3. Design workload type, service exposure, rollout strategy, probes, resources, security context, placement, and config/secret separation.
4. Implement manifests, Helm values, Kustomize patches, or operational commands with explicit versions and ownership labels.
5. Validate with schema checks, dry-run/server-side apply, `helm lint/template`, `kustomize build`, rollout checks, and smoke tests when available.

## Output

Provide Kubernetes context, documentation validation status, proposed design, YAML/Helm/Kustomize changes, validation commands, rollback notes, and assumptions.

## Quality Bar

- Use current API versions for the target cluster.
- Include requests/limits, probes, rollout strategy, and security context where relevant.
- Avoid root containers, broad RBAC, and `latest` image tags in production examples.
- Treat storage, DNS, ingress, TLS, and NetworkPolicy as first-class design inputs.

## Handoff

For image build work, add `container-platforms`. For delivery automation, add `cicd-automation`. For cluster exposure, VPN, or private routing, add `network-vpn-security`. For secrets or RBAC hardening, add `security-secrets`.

## References

- `references/workflow.md` for detailed Kubernetes workflow and verification checklist.
