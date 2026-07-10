# DevOps 高级工程运行模型

<p align="center">
  <a href="principal-operating-model.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="principal-operating-model.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <a href="principal-operating-model.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <strong>🇨🇳 中文</strong>
  &nbsp;·&nbsp; <a href="README.zh.md">路由</a>
</p>

该模型将 DevOps 技能从命令生成提升为负责任的运维决策。实施前、影响生产的变更前和最终交接前都应使用它。

## 基本标准

1. **证据先于信心。** 区分观察到的事实、假设和建议。没有当前文档、平台状态、仓库证据、计划、日志、指标、追踪或测试时，不应宣称确定性。
2. **默认使用 Context7。** 使用 Context7 MCP 获取云、Kubernetes、IaC、CI/CD、容器、可观测性、安全、网络、API、CLI、提供商和配置的当前文档。
3. **运维风险预算。** 描述影响范围、可逆性、对安全与数据的影响、停机风险、成本和合规要求。
4. **决策记录。** 记录考虑过的选项、权衡、选择的路径、拒绝替代方案的理由、验证证据以及回滚或隔离。
5. **验证阶梯。** 从最便宜有效的证明开始：语法、lint、dry-run、plan、diff、策略扫描、smoke 测试、回滚演练，再到生产发布。
6. **最小权限与供应链信任。** 限制 IAM/RBAC 和网络访问，避免长期密钥，固定版本，并在发布时记录制品来源。
7. **停止条件。** 在破坏性操作、生产变更、广泛网络暴露、凭据变更、数据迁移或不可逆状态操作前请求批准。

## 审查问题

- 哪些当前文档已通过 Context7 或一手来源确认？
- 精确的环境、版本、提供商和区域是什么？
- 影响范围是什么，最快的安全回滚是什么？
- 哪项验证能在生产前证明变更正确？
- 哪些可观测性信号能显示成功或失败？
- 哪个安全或供应链假设可能出错？
- 下一个代理应阅读哪条运行手册、决策或项目记忆笔记？

## 参考实践

- [Google SRE](https://sre.google/sre-book/service-level-objectives/) 将 SLI/SLO 和发布决策与用户可见的可靠性联系起来。
- [DORA capabilities](https://dora.dev/capabilities/) 涵盖测试自动化、持续交付、代码可维护性和云基础设施实践。
- [NIST SSDF](https://csrc.nist.gov/pubs/sp/800/218/final) 要求将安全开发纳入整个生命周期。
- [OpenSSF SLSA](https://slsa.dev/spec/v1.0/) 定义制品来源和供应链信任要求。
- [Context7 MCP](https://github.com/upstash/context7) 用于在实现、配置和 API 工作中核对当前文档。
