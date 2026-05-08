# DevOps Skills Rules

Use these rules when DevOps skills are installed into Claude Code.

## Routing

- Start broad DevOps tasks with `devops-router`.
- Use a narrow domain skill after routing.
- Combine skills explicitly for cross-domain work.
- Keep planning, security review, validation, and rollback visible in the answer.

## Documentation Check

For platform-specific manifests, pipeline syntax, cloud resources, IaC providers, CLIs, APIs, and security tooling, verify current documentation before generating implementation details. If the documentation check is unavailable, say that clearly and lower confidence.

## Safety

- Never hardcode secrets.
- Avoid `latest` tags in production examples unless there is a documented reason.
- Prefer least privilege for IAM, RBAC, network access, and CI identities.
- Include validation commands and rollback notes whenever the task changes infrastructure or deployment behavior.

## Output Contract

Use this structure when it fits the task:

1. Task understanding
2. Chosen skill chain
3. Documentation validation status
4. Implementation
5. Verification steps
6. Risks and rollback
7. Assumptions
