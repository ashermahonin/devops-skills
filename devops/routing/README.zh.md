# DevOps Skills 路由

<p align="center">
  <a href="README.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="README.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <a href="README.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <strong>🇨🇳 中文</strong>
  &nbsp;·&nbsp; <a href="../docs/README.zh.md">指南</a>
</p>

## 用途

路由器将范围广泛的运维请求转为安全且明确的工作路径。代理生成配置、执行命令或修改基础设施前，它会先选择负责的领域技能。

机器可读的事实来源是 [`skills.json`](skills.json)，本文件说明如何由人使用它。

## 工作顺序

1. 使用 `devops-router` 对请求分类。
2. 确定一个领域技能或技能链。
3. 在生成命令、配置、提供商资源、清单、流水线或安全控制前，通过 Context7 MCP 查询当前文档。
4. 对生产、安全敏感或跨领域工作，应用[高级工程运行模型](principal-operating-model.zh.md)：证据、决策记录、影响范围、验证、回滚和交接。
5. 将修改限制在最小有效范围内。
6. 验证结果、记录风险，并交付清晰的回滚方案。

## 选择规则

- 若一项窄技能已完整覆盖任务，优先使用它而不是宽泛技能链。
- 跨领域工作必须明确技能链、每个阶段的责任人和集成顺序。
- 环境状态应由计划、日志、指标、追踪和命令输出证明，文档本身不足以证明状态。
- Context7 MCP 对当前语法和行为是必需的，但不能替代目标环境验证。
- 事件处理从稳定服务和收集证据开始；除非妨碍恢复，否则推迟高风险变更。

## 常用技能链

| 工作类型 | 技能链 |
| --- | --- |
| 用代码管理的云基础设施 | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| 应用镜像和交付流水线 | `devops-router` -> `container-platforms` -> `cicd-automation` -> `security-secrets` |
| 生产 Kubernetes 变更 | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| 已知平台的事件 | `devops-router` -> `incident-troubleshooting` -> 受影响技能 -> `observability-operations` |
| VPN 或私有连接 | `devops-router` -> `network-vpn-security` -> `security-secrets` -> `cloud-operations` |

## 最终交接

- 任务理解和修改边界。
- 所选技能链及其理由。
- 已确认的文档和真实环境证据。
- 已完成修改或可审查计划。
- 验证命令和结果。
- 风险、假设、回滚和后续工作。
