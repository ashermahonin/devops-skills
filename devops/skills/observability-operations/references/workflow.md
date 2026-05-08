# Observability Workflow

## When To Use

Use this workflow for Prometheus, Grafana, Loki, ELK, OpenSearch, Tempo, Jaeger, OpenTelemetry, structured logging, alerting, dashboarding, SLI/SLO design, production diagnostics, and alert noise reduction.

## Required Inputs

- Target platform and observability stack.
- Signals required: metrics, logs, traces, profiles, events.
- Critical user journeys, SLO/SLA, and ownership.
- Current blind spots and incident pain points.
- Retention, privacy, residency, and cost constraints.

## Documentation Checks

Verify current docs for:

- OpenTelemetry API, SDK, collector, exporters, and semantic conventions.
- Prometheus scrape, recording, and alert rules.
- Grafana provisioning, data sources, dashboard JSON, and alerting.
- Loki, ELK, and OpenSearch pipeline syntax.
- Trace correlation, exemplars, and sampling behavior.
- Alertmanager and notification integrations.

## Design Checklist

- Define availability, latency, traffic, errors, and saturation signals.
- Decide who consumes the data: developers, on-call, operations, product, or business.
- Keep labels useful and bounded.
- Preserve `trace_id`, `span_id`, `request_id`, environment, service, and version labels.
- Define retention and cost boundaries.
- Route alerts by severity, ownership, and action path.

## Implementation Defaults

- Baseline dashboard for service health.
- Alert rules for symptoms before internal-only causes.
- Structured logs with severity and correlation IDs.
- Trace propagation across service boundaries.
- Runbook links for critical alerts.
- Privacy review for logs and trace attributes.

## Verification Checklist

- Metrics are collected and visible.
- Logs are structured and searchable.
- Traces correlate with logs and metrics.
- Alerts can be tested and routed.
- Dashboards reflect user impact.
- Cardinality is reviewed.
- No secrets or sensitive personal data are leaked.
