# CI/CD Automation Workflow

## Required Inputs

- Platform: GitHub Actions, GitLab CI, Jenkins, Argo, Azure DevOps, or another CI/CD system.
- Branch and release strategy.
- Environments: dev, staging, production, ephemeral previews.
- Required quality gates.
- Artifact or container registry.
- Secret and identity strategy.
- Deployment target and rollback process.

## Documentation Checks

Verify current docs for:

- Pipeline YAML syntax.
- Reusable workflows, templates, includes, and matrix behavior.
- Cache semantics and invalidation.
- OIDC/auth integrations.
- Environment protection, approvals, concurrency, and cancellation.
- Deploy strategy for the target platform.

## Pipeline Layers

1. Lint and format.
2. Unit and integration tests.
3. Security, dependency, IaC, and container scans.
4. Build and package.
5. Artifact publish.
6. Deploy.
7. Smoke test and post-deploy verification.
8. Rollback command or automated rollback.

## Implementation Defaults

- Pin versions and action references.
- Use explicit conditions and rules.
- Cache only safe layers.
- Keep secrets in platform-native storage.
- Use environment-scoped variables and secrets.
- Scope CI permissions to the job.
- Make deploy logs readable and failure states actionable.

## Release Patterns

- Rolling: simple and common, needs health checks and rollback.
- Blue/green: safer cutover, needs traffic control and capacity.
- Canary: best for gradual risk, needs metrics and automated checks.
- Feature flags: useful for decoupling deploy from release, needs flag ownership.

## Verification Checklist

- Pipeline syntax valid.
- Jobs ordered correctly.
- Secrets not hardcoded.
- Artifact versioning defined.
- Production deploy protected.
- Rollback possible.
- Smoke tests included.
