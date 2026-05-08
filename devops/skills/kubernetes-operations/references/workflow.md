# Kubernetes Workflow

## When To Use

Use this workflow for Deployment, StatefulSet, DaemonSet, Job, CronJob, Service, Ingress, Gateway API, cert-manager, Helm, Kustomize, GitOps, RBAC, NetworkPolicy, Pod Security, storage, scaling, upgrades, and cluster troubleshooting.

## Required Inputs

- Kubernetes distribution and version.
- Managed or self-hosted platform: EKS, GKE, AKS, kubeadm, k3s, OpenShift, or another target.
- Delivery method: raw manifests, Helm, Kustomize, GitOps, or platform pipeline.
- CNI, CSI, ingress controller, service mesh, and certificate manager.
- Namespace, environment, availability goals, SLO/SLA, and compliance constraints.
- Current symptoms or desired state.

## Documentation Checks

Verify current docs for:

- API versions and resource fields.
- Ingress, Gateway API, cert-manager, RBAC, NetworkPolicy, PDB, HPA/VPA, probes, affinity, topology spread, and securityContext.
- Helm and Kustomize syntax.
- Managed-provider behavior and controller-specific annotations.

## Design Checklist

- Choose the right workload type. Do not use Deployment for stateful workloads without a reason.
- Define Service, ingress, DNS, TLS, and network policies.
- Set requests, limits, readiness, liveness, startup probes, and graceful shutdown.
- Separate ConfigMap and Secret usage.
- Define rollout strategy, PDB, autoscaling, and rollback.
- Use service accounts and RBAC only where needed.
- Consider node placement, anti-affinity, taints, tolerations, and topology spread.

## Implementation Defaults

- Stable labels and annotations.
- Non-root security context where possible.
- Immutable image tags or digests for production.
- `terminationGracePeriodSeconds` and preStop where shutdown needs coordination.
- Revision-safe rollout strategy.
- Clear resource ownership and namespace boundaries.

## Troubleshooting Path

1. `kubectl get` and `kubectl describe` for resources and events.
2. Current and previous logs.
3. Probe failures.
4. Service, Endpoints, EndpointSlices, DNS, and ingress/controller logs.
5. NetworkPolicy, TLS, service mesh, and CNI.
6. Node pressure, taints, scheduling, resources, and storage attach/mount errors.
7. Rollout history and revision diff.

## Verification Checklist

- `kubectl apply --dry-run=server -f ...`
- `kubectl diff -f ...`
- `helm lint`, `helm template`, or `kustomize build`
- `kubectl rollout status ...`
- `kubectl get pods,svc,ingress -n ...`
- `kubectl describe ...`
- Health endpoint or functional smoke test.
- Rollback command prepared.
