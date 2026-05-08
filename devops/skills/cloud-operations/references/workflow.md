# Cloud Platforms Workflow

## Coverage

Use this workflow for AWS, GCP, Azure, Cloudflare, DigitalOcean, Yandex Cloud, VK Cloud, Selectel, SberCloud, MTS Web Services, and any other provider relevant to the task.

## Required Inputs

- Provider and target region.
- Account, project, folder, tenant, or subscription model.
- Workload type: app, data, Kubernetes, batch, AI, storage, network, or hybrid.
- HA, RTO/RPO, compliance, residency, and security requirements.
- Expected traffic, budget, egress constraints, and growth assumptions.
- Multi-region, hybrid, or on-prem connectivity requirements.

## Documentation Checks

Verify current docs for:

- Service names, regional availability, quotas, and SLAs.
- IAM/RBAC/policy syntax.
- VPC/VNet, subnets, NAT, load balancers, routes, DNS, private endpoints, and firewall behavior.
- Managed database/cache/Kubernetes limitations.
- Terraform provider, CLI, SDK, and API compatibility.
- Provider-specific behavior for Russian and regional clouds.

## Design Checklist

- Account/project boundaries for prod and non-prod.
- VPC/VNet and subnet segmentation.
- Ingress and egress path.
- IAM and workload identity boundaries.
- Managed versus self-hosted tradeoffs.
- Backup, restore, DR, and retention.
- Logging, metrics, alerting, audit, and security hooks.
- Cost model for traffic, snapshots, NAT, load balancers, managed services, and cross-zone traffic.

## Implementation Notes

- State provider, region, and service availability explicitly.
- Use labels/tags as a standard.
- Prefer short-lived credentials and federation where possible.
- Keep encryption at rest and in transit enabled.
- Document quotas and any required increase request.
- Use IaC when the resource must be repeatable.

## Provider Comparison Template

1. Requirements.
2. Assumptions.
3. Service matrix.
4. Limits and risks.
5. Recommendation.
6. Launch or migration plan.

## Verification Checklist

- Required services exist in the target region.
- IAM roles and policies validated.
- Network path validated.
- Encryption and secret flow defined.
- Backup and restore path defined.
- Logging and monitoring enabled.
- Cost and risk caveats stated.
