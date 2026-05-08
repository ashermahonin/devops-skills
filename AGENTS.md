# DevOps Skills Repository Rules

## Purpose

This repository packages reusable DevOps skills, routing rules, installer logic, and documentation for Codex, Claude Code, and project-local agent workflows.

## Repo Map

- `devops/skills/`: skill folders created according to `skill-creator`.
- `devops/routing/skills.json`: routing by DevOps domain, risk, and workflow combination.
- `devops/docs/`: GitHub-facing documentation, localized docs, and SVG diagrams.
- `devops/templates/`: project-local rule templates for Codex and Claude Code.
- `devops/obsidian/project-skeleton/`: lightweight project-memory Markdown skeleton.
- `devops/scripts/validate.py`: structural validation.
- `install.sh`: global or project-local installer.
- `DESIGN.md`: design contract for diagrams and documentation presentation.

## Default Workflow

1. Use `devops-router` for any broad infrastructure, deployment, operations, automation, or platform security request.
2. Select the narrow domain skill after routing.
3. Verify current documentation before generating tool-specific configuration, manifests, pipelines, scripts, or cloud resources.
4. Keep risks, validation, rollback, and assumptions explicit.
5. Update routing and documentation when a skill is added or renamed.

## Definition Of Done

- Skill frontmatter is valid and includes a descriptive trigger.
- Each skill has `agents/openai.yaml` and at least one reference file.
- Routing entries match real skill folders.
- `python3 devops/scripts/validate.py` passes.
- `sh -n install.sh` passes.
- `./install.sh --global --target all --dry-run` passes.
- Tracked docs contain no machine-specific absolute paths.

## Forbidden Defaults

- Do not place product files outside the `devops/` directory unless they are root entrypoints.
- Do not add raw source workflow dumps into skill folders.
- Do not make installer changes without dry-run validation.
- Do not write secrets, tokens, local usernames, or local machine paths into docs.
