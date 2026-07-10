# DevOps Skills

<p align="center">
  <strong>Operational rules and domain skills for infrastructure work with AI agents.</strong><br/>
  For Codex, Claude Code, and other MCP-compatible environments.
</p>

<p align="center">
  <a href="devops/docs/README.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <strong>🇬🇧 English</strong>
  &nbsp;·&nbsp; <a href="devops/docs/README.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <a href="devops/docs/README.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="devops/docs/README.md">Full guide</a>
  &nbsp;·&nbsp; <a href="devops/docs/skills-reference.md">Skill reference</a>
  &nbsp;·&nbsp; <a href="devops/routing/README.md">Routing</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/skills-11-1F4F46?style=for-the-badge" alt="11 skills">
  <img src="https://img.shields.io/badge/docs-RU%20%7C%20EN%20%7C%20ES%20%7C%20ZH-C77B9C?style=for-the-badge" alt="four documentation languages">
  <img src="https://img.shields.io/badge/license-MIT-1F4F46?style=for-the-badge" alt="MIT license">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Context7_MCP-required-7A9FD8?style=for-the-badge" alt="Context7 MCP">
  <img src="https://img.shields.io/badge/validation_before_apply-79A96B?style=for-the-badge" alt="validate before apply">
  <img src="https://img.shields.io/badge/rollback_planned-B94A48?style=for-the-badge" alt="rollback planned">
</p>

![DevOps Skills routing flow](devops/docs/assets/routing-flow.svg)

## What this is

DevOps Skills gives an AI agent a safe operational path from the first infrastructure request to a verified handoff. The agent classifies the request, checks current vendor documentation, selects the narrowest domain skill, bounds the blast radius, validates the result, and records rollback and remaining risk.

The pack covers Kubernetes, cloud platforms, infrastructure as code, containers, CI/CD, scripts, observability, networking and VPN, secrets, and incident response. It does not grant permission to apply changes blindly. The selected skill and the operating model define what evidence is needed first.

## The work path

| Step | Agent responsibility |
| --- | --- |
| 1. Classify | `devops-router` identifies the domain, environment, risk level, and the required skill chain. |
| 2. Confirm | Context7 MCP supplies current platform documentation; repository state, plans, logs, and metrics supply project evidence. |
| 3. Bound | The agent records scope, target environment, impact, permissions, validation order, and rollback before risky writes. |
| 4. Change | The selected domain skill makes the smallest useful change or prepares a reviewable plan. |
| 5. Verify | The agent runs the least invasive useful checks first, then records evidence, risks, rollback, and follow-up work. |

## Install

```bash
git clone <repo-url>
cd devops-skills
./install.sh --list
./install.sh --global --target all --dry-run
./install.sh --global --target all
python3 devops/scripts/validate.py
```

Install only into one project:

```bash
./install.sh --local /path/to/project --target all
```

| Option | Use it for |
| --- | --- |
| `--global` | Install into the user-level Codex or Claude Code directories. |
| `--local PATH` | Install into one project without changing global configuration. |
| `--target codex`, `claude`, `agents`, `all` | Select the supported agent surfaces. `all` is the default. |
| `--copy` | Copy skill folders. This is the portable default. |
| `--link` | Create links to this checkout. Use it while developing the skill pack. |
| `--force` | Replace an existing installation after reviewing the changes. |
| `--dry-run` | Print planned actions without changing files. |
| `--list` | List packaged skills. |

`CODEX_HOME` and `CLAUDE_HOME` override default global homes. Register Context7 MCP as `context7` or `mcpcontext7` before relying on the skills; the installer does not configure MCP servers.

## Documentation

- [Full English guide](devops/docs/README.md), [русское руководство](devops/docs/README.ru.md), [guía en español](devops/docs/README.es.md), [中文指南](devops/docs/README.zh.md).
- [Skill reference](devops/docs/skills-reference.md): purpose, expected output, and direct reference file for every skill.
- [Routing guide](devops/routing/README.md): exact skill chains and safety rules.
- [Principal operating model](devops/routing/principal-operating-model.md): evidence, risk, validation, rollback, and handoff requirements.
- [Project memory guide](devops/docs/project-memory.md): the small Obsidian-compatible memory set installed with project rules.

## Repository layout

```text
devops/
  skills/       # 11 skill contracts, metadata, and references
  routing/      # machine-readable routes and operating model
  docs/         # localized guides, references, and diagrams
  obsidian/     # compact project-memory skeleton
  templates/    # project rules for Codex and Claude Code
  scripts/      # structural validation
install.sh      # global or project-local installer
```

Each skill folder has a `SKILL.md` contract, an `agents/openai.yaml` integration descriptor, and a domain reference. The detailed guide explains how these files work together.

## Verify

```bash
python3 devops/scripts/validate.py
sh -n install.sh
./install.sh --global --target all --dry-run
```

The checks cover skill structure, Context7 prerequisites, localized documentation, links, diagrams, installer behavior, routing, and machine-specific paths.
