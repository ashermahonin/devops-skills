# DevOps Skills 技能参考

<p align="center">
  <a href="skills-reference.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="skills-reference.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <a href="skills-reference.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <strong>🇨🇳 中文</strong>
  &nbsp;·&nbsp; <a href="README.zh.md">指南</a>
</p>

## 阅读顺序

每项技能由三个文件组成：

- `SKILL.md` 是工作契约：检查什么、如何工作、要产出什么以及如何交接。
- `references/` 包含可复用的领域工作流。选择技能后，请阅读最后一列链接的文件。
- `agents/openai.yaml` 包含集成元数据，不会覆盖技能契约。

`devops/routing/skills.json` 决定请求由哪项技能负责。跨领域工作使用既定组合或[路由指南](../routing/README.zh.md)。生成实现细节前，必须通过 Context7 MCP 检查当前提供商或平台文档。

## 路由与平台

| 技能 | 适用场景 | 必需结果 | 参考资料 |
| --- | --- | --- | --- |
| [`devops-router`](../skills/devops-router/SKILL.md) | 请求涉及基础设施、部署、自动化、安全、事件、云、Kubernetes、CI/CD、容器、脚本、可观测性或网络。 | 选定技能链、安全关口、范围、所需证据和交接格式。 | [`master-rules.md`](../skills/devops-router/references/master-rules.md) |
| [`kubernetes-operations`](../skills/kubernetes-operations/SKILL.md) | 涉及清单、Helm、Kustomize、发布、扩缩容、存储、网络、RBAC、策略或集群问题。 | 已验证的集群修改或审查计划、影响、可观测性、回滚和责任人。 | [`workflow.md`](../skills/kubernetes-operations/references/workflow.md) |
| [`cloud-operations`](../skills/cloud-operations/SKILL.md) | 涉及提供商、IAM、VPC/VNet、区域、托管服务、韧性、迁移或成本。 | 当前提供商证据、有边界的设计或改动、风险、验证和回滚。 | [`workflow.md`](../skills/cloud-operations/references/workflow.md) |
| [`infrastructure-as-code`](../skills/infrastructure-as-code/SKILL.md) | 涉及 Terraform、OpenTofu、Pulumi、CloudFormation、Bicep、ARM、Crossplane、状态、导入、计划、策略或漂移。 | 已审查计划、状态安全评估、策略结果、变更记录以及回滚或隔离。 | [`workflow.md`](../skills/infrastructure-as-code/references/workflow.md) |
| [`container-platforms`](../skills/container-platforms/SKILL.md) | 涉及 Docker、BuildKit、Podman、Compose、OCI 镜像、仓库、镜像安全或运行时行为。 | 可复现的构建或运行配置、镜像安全证据和验证结果。 | [`workflow.md`](../skills/container-platforms/references/workflow.md) |

## 自动化、可观测性与连接

| 技能 | 适用场景 | 必需结果 | 参考资料 |
| --- | --- | --- | --- |
| [`cicd-automation`](../skills/cicd-automation/SKILL.md) | 构建、测试、扫描、打包、部署、审批、受保护环境、交付或回滚发生变化。 | 流水线契约、受保护步骤、验证证据、交付路径和回滚计划。 | [`workflow.md`](../skills/cicd-automation/references/workflow.md) |
| [`scripting-automation`](../skills/scripting-automation/SKILL.md) | 需要 Bash、Python、PowerShell、迁移、诊断、CLI 辅助工具或可重复运维任务。 | 安全且有文档的脚本，具备参数、适用时的 dry-run、错误处理、幂等性和验证。 | [`workflow.md`](../skills/scripting-automation/references/workflow.md) |
| [`observability-operations`](../skills/observability-operations/SKILL.md) | 需要指标、日志、追踪、看板、告警、SLI/SLO、生产诊断或降低告警噪声。 | 信号、看板、告警条件、责任人、验证和运维解释。 | [`workflow.md`](../skills/observability-operations/references/workflow.md) |
| [`network-vpn-security`](../skills/network-vpn-security/SKILL.md) | 涉及网络拓扑、VPN、路由、DNS、防火墙、ACL、安全组、私有连接、MTU 或延迟。 | 信任边界、最小权限规则、验证路径以及回滚或隔离。 | [`workflow.md`](../skills/network-vpn-security/references/workflow.md) |

## 安全与事件

| 技能 | 适用场景 | 必需结果 | 参考资料 |
| --- | --- | --- | --- |
| [`security-secrets`](../skills/security-secrets/SKILL.md) | 涉及密钥、IAM/RBAC、KMS/Vault/SOPS、工作负载身份、SBOM、签名、策略、审计或轮换。 | 安全密钥流、访问审查、轮换路径、供应链证据和策略发现。 | [`workflow.md`](../skills/security-secrets/references/workflow.md) |
| [`incident-troubleshooting`](../skills/incident-troubleshooting/SKILL.md) | 正在发生故障、服务降级、失败部署、紧急诊断、稳定措施或性能回归。 | 证据时间线、假设、最低风险缓解、恢复、回滚、后续工作和预防记录。 | [`workflow.md`](../skills/incident-troubleshooting/references/workflow.md) |

## 常用技能链

| 情况 | 技能链 |
| --- | --- |
| 用代码管理的云基础设施 | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| 应用镜像和交付流水线 | `devops-router` -> `container-platforms` -> `cicd-automation` -> `security-secrets` |
| 生产 Kubernetes 变更 | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| 活跃事件 | `devops-router` -> `incident-troubleshooting` -> `observability-operations` -> 受影响领域技能 |
| 私有连接或 VPN | `devops-router` -> `network-vpn-security` -> `security-secrets` -> `cloud-operations` |

所选技能不会替代高级工程运行模型。进行生产或高风险工作前，必须记录当前文档、实际状态、影响、验证、回滚和交接。
