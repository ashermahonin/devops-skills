# Claude Code Instructions

This repository defines DevOps skills and routing rules.

When working here:

1. Start broad DevOps work with `devops-router`.
2. Select the matching domain skill from `devops/skills/`.
3. Use Context7 MCP before generating platform-specific configuration, provider resources, manifests, pipelines, CLI commands, scripts, or security controls.
4. Apply `devops/routing/principal-operating-model.md` before write-heavy work.
5. Keep implementation scoped, reversible, and validated.
6. Run `python3 devops/scripts/validate.py` and `sh -n install.sh` after structural or installer changes.

Claude Code local installs use:

```bash
./install.sh --local /path/to/project --target claude --force
```

Global Claude Code installs use:

```bash
./install.sh --global --target claude --force
```
