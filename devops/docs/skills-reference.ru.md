# Справочник DevOps-навыков

<p align="center">
  <strong>🇷🇺 Русский</strong>
  &nbsp;·&nbsp; <a href="skills-reference.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <a href="skills-reference.es.md">🇪🇸 Español</a>
  &nbsp;·&nbsp; <a href="skills-reference.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="README.ru.md">Руководство</a>
</p>

## Как читать справочник

У каждого навыка есть три работающих вместе файла:

- `SKILL.md` - рабочий контракт: что изучить, как действовать, какой результат подготовить и как его передать.
- `references/` - повторно используемый процесс для эксплуатационной области. Когда навык выбран, прочитайте файл из последнего столбца.
- `agents/openai.yaml` - метаданные подключения; они не меняют контракт навыка.

`devops/routing/skills.json` определяет владельца запроса. Для работ на стыке областей используйте заданные сочетания или [руководство по маршрутам](../routing/README.ru.md). Перед созданием деталей реализации обязательно проверьте актуальную документацию провайдера или платформы через Context7 MCP.

## Маршрутизация и платформы

| Навык | Когда применять | Обязательный результат | Справка |
| --- | --- | --- | --- |
| [`devops-router`](../skills/devops-router/SKILL.md) | Запрос затрагивает инфраструктуру, выкладку, автоматизацию, безопасность, инцидент, облако, Kubernetes, CI/CD, контейнеры, скрипты, наблюдаемость или сеть. | Выбранная цепочка, контрольные точки безопасности, границы, нужные доказательства и формат передачи. | [`master-rules.md`](../skills/devops-router/references/master-rules.md) |
| [`kubernetes-operations`](../skills/kubernetes-operations/SKILL.md) | Есть манифесты, Helm, Kustomize, выкладка, масштабирование, хранилища, сеть, RBAC, политики или проблема кластера. | Проверенное изменение либо план ревью кластера, воздействие, наблюдаемость, откат и владельцы. | [`workflow.md`](../skills/kubernetes-operations/references/workflow.md) |
| [`cloud-operations`](../skills/cloud-operations/SKILL.md) | Затронуты провайдер, IAM, VPC/VNet, регион, управляемый сервис, отказоустойчивость, миграция или стоимость. | Подтверждённая документация провайдера, ограниченное решение или изменение, риск, проверка и откат. | [`workflow.md`](../skills/cloud-operations/references/workflow.md) |
| [`infrastructure-as-code`](../skills/infrastructure-as-code/SKILL.md) | Есть Terraform, OpenTofu, Pulumi, CloudFormation, Bicep, ARM, Crossplane, состояние, импорт, план, политики или дрейф. | Проверенный план, оценка безопасности состояния, результат политик, запись изменения и откат либо локализация последствий. | [`workflow.md`](../skills/infrastructure-as-code/references/workflow.md) |
| [`container-platforms`](../skills/container-platforms/SKILL.md) | Затронуты Docker, BuildKit, Podman, Compose, OCI-образы, реестры, безопасность образов или поведение исполнения. | Воспроизводимая сборка или конфигурация запуска, доказательства безопасности образа и результат проверки. | [`workflow.md`](../skills/container-platforms/references/workflow.md) |

## Автоматизация, наблюдаемость и связность

| Навык | Когда применять | Обязательный результат | Справка |
| --- | --- | --- | --- |
| [`cicd-automation`](../skills/cicd-automation/SKILL.md) | Меняются сборка, тесты, сканирование, упаковка, выкладка, подтверждения, защищённые среды, выпуск или откат. | Контракт конвейера, защищённые шаги, доказательства проверки, путь доставки и план отката. | [`workflow.md`](../skills/cicd-automation/references/workflow.md) |
| [`scripting-automation`](../skills/scripting-automation/SKILL.md) | Нужны Bash, Python, PowerShell, миграция, диагностика, CLI-хелпер или повторяемая эксплуатационная задача. | Безопасный документированный скрипт с параметрами, dry-run при необходимости, обработкой ошибок, идемпотентностью и проверкой. | [`workflow.md`](../skills/scripting-automation/references/workflow.md) |
| [`observability-operations`](../skills/observability-operations/SKILL.md) | Требуют работы метрики, логи, трассировки, панели, оповещения, SLI/SLO, диагностика production или снижение шума оповещений. | Сигналы, панели, условия оповещений, владельцы, проверка и понятная интерпретация для эксплуатации. | [`workflow.md`](../skills/observability-operations/references/workflow.md) |
| [`network-vpn-security`](../skills/network-vpn-security/SKILL.md) | Затронуты топология сети, VPN, маршрутизация, DNS, firewall, ACL, security groups, частная связность, MTU или задержка. | Границы доверия, правила минимальных прав, путь проверки и откат либо локализация последствий. | [`workflow.md`](../skills/network-vpn-security/references/workflow.md) |

## Безопасность и инциденты

| Навык | Когда применять | Обязательный результат | Справка |
| --- | --- | --- | --- |
| [`security-secrets`](../skills/security-secrets/SKILL.md) | Есть секреты, IAM/RBAC, KMS/Vault/SOPS, идентичность нагрузки, SBOM, подпись, политики, аудит или ротация. | Безопасный поток секретов, ревью доступа, путь ротации, доказательства цепочки поставки и находки по политикам. | [`workflow.md`](../skills/security-secrets/references/workflow.md) |
| [`incident-troubleshooting`](../skills/incident-troubleshooting/SKILL.md) | Идёт авария, деградация, неудачная выкладка, срочная диагностика, стабилизация или регрессия производительности. | Хронология доказательств, гипотезы, наименее рискованное смягчение, восстановление, откат, последующие работы и профилактика. | [`workflow.md`](../skills/incident-troubleshooting/references/workflow.md) |

## Частые цепочки

| Ситуация | Цепочка навыков |
| --- | --- |
| Облачная инфраструктура, управляемая как код | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| Образ приложения и конвейер доставки | `devops-router` -> `container-platforms` -> `cicd-automation` -> `security-secrets` |
| Изменение Kubernetes в production | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| Активный инцидент | `devops-router` -> `incident-troubleshooting` -> `observability-operations` -> затронутый доменный навык |
| Частная связность или VPN | `devops-router` -> `network-vpn-security` -> `security-secrets` -> `cloud-operations` |

Выбранный навык не отменяет модель работы уровня principal. До production- или рискованной работы зафиксируйте актуальную документацию, реальное состояние, воздействие, проверки, откат и передачу результата.
