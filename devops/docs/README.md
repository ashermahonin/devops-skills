# DevOps Skills guide

<p align="center">
  <a href="README.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <strong>🇬🇧 English</strong>
  &nbsp;·&nbsp; <a href="README.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <a href="README.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="../../README.md">Repository overview</a>
  &nbsp;·&nbsp; <a href="skills-reference.md">Skill reference</a>
</p>

![DevOps Skills routing flow](assets/routing-flow.svg)

## Purpose

DevOps Skills is a set of operating contracts for agents working with infrastructure. It helps an agent turn a request into a safe sequence: identify the affected domain, check current documentation, set the change boundary, make or review the change, validate it, and record what is needed to operate or reverse it.

It supports Codex, Claude Code, and other MCP-compatible agent environments. Skill names remain English because they are stable identifiers. The guides, diagrams, and explanations are localized.

## How the pack is organised

| Part | Location | What it does |
| --- | --- | --- |
| Skill contract | `devops/skills/<skill>/SKILL.md` | Defines the role, starting inputs, procedure, output, quality bar, and handoff. |
| Domain reference | `devops/skills/<skill>/references/` | Provides the reusable workflow and checks for that particular operational domain. |
| Routing contract | `devops/routing/skills.json` | Maps request signals to skill ownership, permissions, combinations, prerequisites, and required handoff fields. |
| Project rules | `devops/templates/` | Supplies concise local rules for Codex-compatible agents and Claude Code. |
| Project memory | `devops/obsidian/project-skeleton/` | Stores brief, linked operational notes for inventories, access, deployments, observability, and incidents. |

`skills.json` is the source of truth for automated routing. The [routing guide](../routing/README.md) explains the human workflow, and the [skill reference](skills-reference.md) describes all 11 skills and their reference files.

## Prerequisites

- An MCP-compatible agent environment, such as Codex or Claude Code.
- Context7 MCP registered as `context7` or `mcpcontext7`. It is required before generating or reviewing provider, platform, API, CLI, manifest, pipeline, infrastructure-as-code, container, network, or security-control details.
- Appropriate access to the target project and environment for plans, dry runs, validation, and approval steps.

Context7 gives current documentation. It does not prove the current state of your infrastructure. Use repository evidence, provider state, plans, logs, metrics, traces, and command output for that.

## Install

Preview the global installation before changing any agent directory:

```bash
git clone <repo-url>
cd devops-skills
./install.sh --global --target all --dry-run
```

Install for every supported target:

```bash
./install.sh --global --target all
```

Install only into one project:

```bash
./install.sh --local /path/to/project --target all
```

| Option | Use it for |
| --- | --- |
| `--global` | Install skills in user-level Codex or Claude Code directories. |
| `--local PATH` | Add project-local skills and rules without modifying global configuration. |
| `--target codex`, `claude`, `agents`, `all` | Select the agent surfaces. `all` is the default. |
| `--copy` | Copy folders for a portable installation. |
| `--link` | Link to this repository while developing it. |
| `--force` | Replace existing installed content after reviewing the diff. |
| `--dry-run` | Show planned actions without writing files. |
| `--list` | List the packaged skills. |

`CODEX_HOME` and `CLAUDE_HOME` can override default global homes. The installer never creates or configures MCP servers.

## Start an operational task

For broad work, state the task in normal language and let `devops-router` classify it. The agent must make the following items explicit before risky writes:

1. Target environment, platform version, provider, region, and current state.
2. Selected skill or skill chain and why it matches the task.
3. Current documentation evidence from Context7 MCP or a primary source.
4. Blast radius, affected identities, data, network boundaries, availability, and cost exposure.
5. The least invasive validation order and the fastest safe rollback or containment action.

For a narrow task, name the domain directly, for example: "review this Terraform plan", "prepare a Kubernetes canary rollout", or "diagnose a DNS failure". The agent still needs to apply the matching skill contract and the same safety rules.

## Safety and decision standard

Use the [principal operating model](../routing/principal-operating-model.md) before implementation, production-affecting work, security-sensitive changes, or final handoff. It requires:

- observed facts to be separated from assumptions and recommendations;
- explicit impact and reversibility;
- least-privilege identities, network access, and secret handling;
- a validation ladder from syntax and dry-run through plan, policy checks, smoke tests, and rollout;
- a rollback path or a reason it cannot exist;
- a handoff that preserves the evidence and remaining risk.

The agent pauses for approval before destructive operations, production changes, broad network exposure, credential changes, data migrations, or irreversible state operations.

## Project memory

The installed project-memory skeleton is deliberately small. It has a project index plus notes for inventory, access and secrets, deployments, observability, and incidents. Keep each note focused and link it from the index. Do not copy live credentials, long command transcripts, or generated logs into project memory.

Use the [project-memory guide](project-memory.md) for the file-by-file purpose.

## Documentation map

- [Repository overview](../../README.md)
- [Skill reference](skills-reference.md)
- [Routing guide](../routing/README.md)
- [Principal operating model](../routing/principal-operating-model.md)
- [Machine-readable routing](../routing/skills.json)
- [Project-memory guide](project-memory.md)
- [Project-memory skeleton](../obsidian/project-skeleton/)
- [Documentation design contract](../../DESIGN.md)

## Verify

```bash
python3 devops/scripts/validate.py
sh -n install.sh
./install.sh --global --target all --dry-run
```

The validator checks the skill contracts, routing, Context7 metadata, localised documentation, diagrams, links, installer, and accidental machine-specific paths.
