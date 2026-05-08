# Security And Secrets Workflow

## When To Use

Use this workflow for secret management, IAM/RBAC hardening, Vault, KMS, Secret Manager, SOPS, Sealed Secrets, external secrets, CI/CD secrets, workload identity, supply chain scanning, signing, SBOM, policy as code, access review, and rotation.

## Required Inputs

- Current secret location and target secret store.
- Secret consumers: humans, workloads, CI, jobs, controllers, or third parties.
- Cloud, Kubernetes, CI/CD, and runtime context.
- Compliance, audit, and retention requirements.
- Rotation requirements and break-glass process.

## Documentation Checks

Verify current docs for:

- Secret manager syntax and integrations.
- IAM/RBAC policy models.
- SOPS, Sealed Secrets, Vault, cloud KMS, external secrets, and CSI drivers.
- Scanners, SBOM, signing, provenance, and admission/policy engines.
- CI identity and OIDC/federation behavior.

## Design Checklist

- Map producer -> store -> delivery -> consumer -> rotation.
- Keep secret delivery out of build artifacts and logs.
- Separate human access from workload access.
- Prefer short-lived credentials.
- Use audit logs and access review.
- Define rotation owner and failure behavior.
- Define emergency access without making it the default path.

## Supply Chain Checklist

- Dependency scanning.
- Container scanning.
- IaC scanning.
- SBOM for production artifacts when required.
- Signing and provenance for release artifacts when required.
- Admission or policy gate for critical environments.

## Verification Checklist

- No secret material committed or logged.
- Access is minimally scoped.
- Rotation path documented or automated.
- Audit trail available.
- Scan/policy gates run.
- Rollback and revocation paths defined.
