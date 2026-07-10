# Referencia de DevOps Skills

<p align="center">
  <a href="skills-reference.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="skills-reference.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <strong>🇪🇸 Español</strong>
  &nbsp;·&nbsp; <a href="skills-reference.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="README.es.md">Guía</a>
</p>

## Orden de lectura

Cada habilidad reúne tres archivos:

- `SKILL.md` es el contrato operativo: qué revisar, cómo trabajar, qué resultado producir y cómo entregarlo.
- `references/` contiene el flujo reutilizable del dominio. Al elegir una habilidad, lee el archivo enlazado en la última columna.
- `agents/openai.yaml` contiene metadatos de integración; no cambia el contrato.

`devops/routing/skills.json` decide qué habilidad es responsable de una petición. Para tareas entre dominios, usa las combinaciones definidas o la [guía de rutas](../routing/README.es.md). Antes de generar detalles de implementación, verifica documentación actual de proveedor o plataforma con Context7 MCP.

## Rutas y plataformas

| Habilidad | Cuándo usarla | Resultado obligatorio | Referencia |
| --- | --- | --- | --- |
| [`devops-router`](../skills/devops-router/SKILL.md) | La petición abarca infraestructura, despliegue, automatización, seguridad, incidente, nube, Kubernetes, CI/CD, contenedores, scripts, observabilidad o red. | Cadena seleccionada, controles de seguridad, límites, evidencia requerida y formato de traspaso. | [`master-rules.md`](../skills/devops-router/references/master-rules.md) |
| [`kubernetes-operations`](../skills/kubernetes-operations/SKILL.md) | Hay manifiestos, Helm, Kustomize, rollout, escalado, almacenamiento, red, RBAC, políticas o un problema de clúster. | Cambio validado o plan de revisión de clúster, impacto, observabilidad, reversión y responsables. | [`workflow.md`](../skills/kubernetes-operations/references/workflow.md) |
| [`cloud-operations`](../skills/cloud-operations/SKILL.md) | Afecta proveedor, IAM, VPC/VNet, región, servicio gestionado, resiliencia, migración o coste. | Evidencia actual del proveedor, diseño o cambio acotado, riesgo, validación y reversión. | [`workflow.md`](../skills/cloud-operations/references/workflow.md) |
| [`infrastructure-as-code`](../skills/infrastructure-as-code/SKILL.md) | Intervienen Terraform, OpenTofu, Pulumi, CloudFormation, Bicep, ARM, Crossplane, estado, importaciones, planes, políticas o deriva. | Plan revisado, evaluación de seguridad del estado, resultado de políticas, registro de cambio y reversión o contención. | [`workflow.md`](../skills/infrastructure-as-code/references/workflow.md) |
| [`container-platforms`](../skills/container-platforms/SKILL.md) | Afecta Docker, BuildKit, Podman, Compose, imágenes OCI, registros, seguridad de imagen o comportamiento de ejecución. | Configuración reproducible de build o runtime, evidencia de seguridad de imagen y resultado de validación. | [`workflow.md`](../skills/container-platforms/references/workflow.md) |

## Automatización, observabilidad y conectividad

| Habilidad | Cuándo usarla | Resultado obligatorio | Referencia |
| --- | --- | --- | --- |
| [`cicd-automation`](../skills/cicd-automation/SKILL.md) | Cambian build, pruebas, análisis, empaquetado, despliegue, aprobaciones, entornos protegidos, entrega o reversión. | Contrato de pipeline, pasos protegidos, evidencia de validación, ruta de entrega y plan de reversión. | [`workflow.md`](../skills/cicd-automation/references/workflow.md) |
| [`scripting-automation`](../skills/scripting-automation/SKILL.md) | Se necesita Bash, Python, PowerShell, migración, diagnóstico, ayuda CLI o una tarea operativa repetible. | Script seguro y documentado con parámetros, dry-run cuando corresponda, errores, idempotencia y validación. | [`workflow.md`](../skills/scripting-automation/references/workflow.md) |
| [`observability-operations`](../skills/observability-operations/SKILL.md) | Hacen falta métricas, logs, trazas, paneles, alertas, SLI/SLO, diagnóstico de producción o reducción de ruido. | Señales, paneles, condiciones de alerta, responsables, validación e interpretación operativa. | [`workflow.md`](../skills/observability-operations/references/workflow.md) |
| [`network-vpn-security`](../skills/network-vpn-security/SKILL.md) | Afecta topología de red, VPN, rutas, DNS, firewall, ACL, grupos de seguridad, conectividad privada, MTU o latencia. | Límites de confianza, reglas de mínimo privilegio, ruta de validación y reversión o contención. | [`workflow.md`](../skills/network-vpn-security/references/workflow.md) |

## Seguridad e incidentes

| Habilidad | Cuándo usarla | Resultado obligatorio | Referencia |
| --- | --- | --- | --- |
| [`security-secrets`](../skills/security-secrets/SKILL.md) | Intervienen secretos, IAM/RBAC, KMS/Vault/SOPS, identidad de carga, SBOM, firma, políticas, auditoría o rotación. | Flujo seguro de secretos, revisión de acceso, ruta de rotación, evidencia de cadena de suministro y hallazgos de políticas. | [`workflow.md`](../skills/security-secrets/references/workflow.md) |
| [`incident-troubleshooting`](../skills/incident-troubleshooting/SKILL.md) | Hay caída, degradación, despliegue fallido, diagnóstico urgente, estabilización o regresión de rendimiento. | Línea de tiempo de evidencia, hipótesis, mitigación de menor riesgo, recuperación, reversión, seguimiento y prevención. | [`workflow.md`](../skills/incident-troubleshooting/references/workflow.md) |

## Cadenas frecuentes

| Situación | Cadena de habilidades |
| --- | --- |
| Infraestructura de nube gestionada como código | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| Imagen de aplicación y pipeline de entrega | `devops-router` -> `container-platforms` -> `cicd-automation` -> `security-secrets` |
| Cambio de Kubernetes en producción | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| Incidente activo | `devops-router` -> `incident-troubleshooting` -> `observability-operations` -> habilidad de dominio afectada |
| Conectividad privada o VPN | `devops-router` -> `network-vpn-security` -> `security-secrets` -> `cloud-operations` |

La habilidad elegida no sustituye el modelo operativo principal. Antes de trabajo de producción o alto riesgo, registra documentación actual, estado real, impacto, validación, reversión y traspaso.
