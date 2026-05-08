# Scripting Workflow

## When To Use

Use this workflow for Bash, Python, PowerShell, operational tooling, migration scripts, diagnostics, glue logic, CLI helpers, and repeatable local or CI automation.

## Required Inputs

- Target OS: Linux, macOS, Windows, or mixed.
- Interpreter and version.
- External commands and package dependencies.
- Input and output formats.
- Portability and idempotency requirements.
- Risk level and whether dry-run is required.

## Documentation Checks

Verify current docs for:

- Language version and standard library behavior.
- CLI or API libraries.
- Error handling patterns.
- Packaging, virtual environment, execution policy, and module behavior.
- Platform-specific shell differences.

## Language Selection

- Bash: short, linear Unix orchestration with simple data.
- Python: structured logic, JSON/YAML/API work, testing, portability.
- PowerShell: Windows-native administration, Azure, Microsoft 365, Active Directory, and cross-platform cmdlets.

## Implementation Defaults

- Usage/help output.
- Strict mode where it fits the language and target shell.
- Input validation.
- Clear error messages.
- Safe quoting and path handling.
- Logs that do not expose secrets.
- Retries and timeouts for network calls.
- Explicit exit codes.
- Dry-run or confirmation for destructive operations.

## Validation Checklist

- `shellcheck` for Bash when available.
- `sh -n` or target-shell syntax check.
- `black`, `ruff`, `mypy`, or focused tests for Python when appropriate.
- `PSScriptAnalyzer` for PowerShell when available.
- Positive and negative examples.
- Dry-run behavior verified.
- Temp files cleaned.
- Secret-safe logging reviewed.
