# Project memory

<p align="center">
  <a href="project-memory.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <strong>🇬🇧 English</strong>
  &nbsp;·&nbsp; <a href="project-memory.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <a href="project-memory.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="README.md">Guide</a>
</p>

The skills can be installed into a project together with a small documentation skeleton. Use it when a DevOps agent needs quick orientation without reading the whole repository.

Recommended project memory:

| File | Purpose |
| --- | --- |
| `00-index.md` | Project summary, owners, environments, critical links. |
| `01-inventory.md` | Services, clusters, accounts, providers, registries, CI systems. |
| `02-access-and-secrets.md` | Access model, secret stores, rotation, audit notes. |
| `03-deployments.md` | Deployment paths, release rules, rollback commands. |
| `04-observability.md` | Metrics, logs, traces, dashboards, alerts, SLOs. |
| `05-incidents.md` | Incident timeline notes and prevention actions. |

Keep these files short. They are for fast orientation. Full code context belongs in the repository and any connected RAG or graph layer. Never record live credentials, private keys, access tokens, or unredacted operational logs here.
