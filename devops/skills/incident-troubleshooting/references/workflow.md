# Troubleshooting And Incident Response Workflow

## Required Inputs

- Symptom and start time.
- User impact and affected systems.
- Recent changes before the incident.
- Available observability data.
- Access restrictions and change freeze.
- Current mitigation status.

## Documentation Checks

Verify current docs for:

- Commands and syntax for the affected tools.
- Known limitations in the platform version.
- Recovery, rollback, and failover best practices.
- Provider or orchestrator-specific incident behavior.

## Incident Flow

1. Stabilize.
2. Define blast radius.
3. Build timeline.
4. Check recent changes.
5. Gather logs, metrics, traces, events, and deployment history.
6. Form hypotheses.
7. Validate smallest-risk action first.
8. Recover service.
9. Capture root cause and prevention.

## Evidence Checklist

- Alert name, severity, and first seen time.
- Deployment, config, infrastructure, or traffic changes.
- Logs before and after the first symptom.
- Metrics for saturation, errors, latency, and traffic.
- Trace samples for failed journeys.
- Platform events and resource pressure.
- Network, DNS, TLS, auth, or dependency errors.

## Recovery Principles

- Reduce user impact first.
- Prefer rollback over forward-fix when the cause is likely a recent change.
- Avoid broad permission or network openings as a quick fix unless explicitly approved and time-boxed.
- Record any temporary workaround and its removal plan.

## Verification Checklist

- Impact reduced or resolved.
- Health checks and user journeys verified.
- Error rate, latency, and saturation normalized.
- Rollback or workaround documented.
- Follow-up actions captured.
