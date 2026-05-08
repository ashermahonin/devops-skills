# Network, VPN, And Secure Connectivity Workflow

## When To Use

Use this workflow for site-to-site VPN, remote access VPN, mesh/overlay networking, VPC/VNet/VLAN/subnet design, peering, transit, private endpoints, NAT, bastion, routing, DNS, firewalls, ACLs, security groups, NACLs, zero trust connectivity, Kubernetes NetworkPolicy, segmentation, hybrid/multi-cloud networking, and connectivity troubleshooting.

## Required Inputs

- Source and destination systems or networks.
- Required protocols and ports.
- Current and desired trust boundaries.
- Availability, latency, bandwidth, and failover requirements.
- Compliance and security constraints.
- Existing CIDRs, routes, DNS zones, firewalls, and VPN endpoints.

## Documentation Checks

Verify current docs for:

- Cloud networking services, route table behavior, quotas, and limits.
- VPN product syntax, supported topology, authentication, and crypto.
- Firewall, ACL, security group, and NACL semantics.
- DNS services, private zones, split-horizon, forwarding, and TTL behavior.
- Ingress controllers, service mesh, CNI, and load balancer behavior.
- PKI/TLS and CLI/API behavior.

## Design Checklist

- Define flows: who talks to whom, on which protocol/port, and why.
- Define denied flows.
- Draw trust boundaries: internet, corporate network, offices, data centers, cloud networks, Kubernetes clusters, privileged admin segment, and third-party networks.
- Plan address space with reserved growth and no overlapping CIDRs where possible.
- Segment management, application, data, monitoring, and user-access planes.
- Keep routing simple and explainable.
- Define DNS resolver path and private DNS behavior.
- Define ingress, egress, NAT, inspection, logging, and HA.

## VPN Checklist

- VPN type: site-to-site, client VPN, point-to-site, mesh, or vendor-specific.
- Protocol: IPsec/IKEv2, WireGuard, OpenVPN, SSL VPN, or product-specific.
- Authentication: certificates, SSO/MFA, PSK, or federation.
- Encryption suites, lifetime, rekey, and legacy-mode risk.
- NAT traversal, split tunnel/full tunnel, routes, DNS, and endpoint hardening.
- Failover behavior and tunnel monitoring.

## Troubleshooting Path

1. DNS.
2. IP reachability.
3. Routing.
4. Firewall, ACL, security group, or NACL.
5. NAT.
6. VPN tunnel status.
7. TLS/PKI.
8. Application protocol.
9. MTU, fragmentation, retransmits, packet loss, latency, and asymmetric routing.

## Verification Checklist

- Route inspection.
- DNS resolution.
- TCP/UDP reachability.
- Tunnel establishment.
- Auth validation.
- Packet path verification.
- Failover test.
- Flow logs, auth logs, tunnel logs, and audit logs checked.
