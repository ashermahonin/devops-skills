# Infrastructure As Code Workflow

## Coverage

Use this workflow for Terraform, OpenTofu, Pulumi, CloudFormation, Bicep, ARM, Crossplane, provider modules, remote state, policy as code, imports, moved blocks, drift management, and infrastructure refactors.

## Required Inputs

- IaC tool and version.
- Providers and version constraints.
- Backend and locking model.
- Environment model and workspace strategy.
- Existing state, imports, migrations, and drift context.
- Compliance or policy constraints.

## Documentation Checks

Verify current docs for:

- Provider resources and data sources.
- Version constraints and breaking changes.
- Backend and locking specifics.
- Module limitations and recommended patterns.
- Import, moved block, and lifecycle behavior.
- Policy tooling if used.

## Design Checklist

- Decide whether the change is new, imported, migrated, or modifying existing state.
- Identify recreation or replacement risk.
- Keep module boundaries understandable.
- Define variables and outputs with minimal surface.
- Use provider aliases only where they clarify ownership.
- Keep prod and non-prod state separated where practical.
- Apply naming and tagging consistently.

## Implementation Defaults

- Explicit provider version constraints.
- Remote backend and locking for shared environments.
- No sensitive values in outputs unless necessary and marked.
- Lifecycle rules only when they solve a real problem.
- Import and migration notes for existing resources.
- Plan output reviewed for destructive actions.

## Verification Checklist

- `terraform fmt` or tool equivalent.
- `terraform validate` or tool equivalent.
- `terraform plan` or dry-run preview.
- Policy checks when available.
- Review replacement and deletion actions.
- Rollback or state recovery notes.
