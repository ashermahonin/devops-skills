# DevOps 项目记忆

<p align="center">
  <a href="project-memory.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="project-memory.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <a href="project-memory.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <strong>🇨🇳 中文</strong>
  &nbsp;·&nbsp; <a href="README.zh.md">指南</a>
</p>

技能可以与一个小型项目文档骨架一起安装。它让 DevOps 代理无需阅读整个仓库也能快速定位。

| 文件 | 用途 |
| --- | --- |
| `00-index.md` | 项目摘要、责任人、环境和关键链接。 |
| `01-inventory.md` | 服务、集群、账户、提供商、制品库和 CI 系统。 |
| `02-access-and-secrets.md` | 访问模型、密钥存储、轮换和审计说明。 |
| `03-deployments.md` | 部署路径、发布规则和回滚命令。 |
| `04-observability.md` | 指标、日志、追踪、看板、告警和 SLO。 |
| `05-incidents.md` | 事件时间线、恢复决策和预防措施。 |

这些文件应保持简短。它们是导航记忆，不是仓库副本。完整上下文属于源代码和连接的 RAG 或图谱层。不要记录有效凭据、私钥、访问令牌或未经清理的运维日志。
