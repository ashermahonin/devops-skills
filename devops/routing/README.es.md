# Enrutamiento de DevOps Skills

<p align="center">
  <a href="README.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="README.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <strong>🇪🇸 Español</strong>
  &nbsp;·&nbsp; <a href="README.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="../docs/README.es.md">Guía</a>
</p>

## Propósito

El enrutador convierte una petición operativa amplia en un camino seguro y explícito. Elige al responsable de dominio antes de que el agente genere configuración, ejecute comandos o cambie infraestructura.

La fuente de verdad legible por máquina es [`skills.json`](skills.json). Este documento explica su uso para personas.

## Flujo de trabajo

1. Clasifica la petición con `devops-router`.
2. Identifica una habilidad de dominio o una cadena de habilidades.
3. Antes de comandos, configuración, recursos de proveedor, manifiestos, pipelines o controles de seguridad, consulta documentación actual con Context7 MCP.
4. Para producción, seguridad o trabajo entre dominios, aplica el [modelo operativo principal](principal-operating-model.es.md): evidencia, rastro de decisión, impacto, validación, reversión y traspaso.
5. Mantén el cambio dentro del alcance útil más pequeño.
6. Valida, registra riesgos y entrega un plan de reversión claro.

## Reglas de elección

- Una habilidad estrecha es preferible a una cadena amplia si cubre por completo la tarea.
- En trabajo entre dominios, la cadena se define de forma explícita, con responsable y orden de integración por etapa.
- Planes, logs, métricas, trazas y salida de comandos prueban el estado del entorno; la documentación sola no basta.
- Context7 MCP es obligatorio para sintaxis y comportamiento actuales, pero no sustituye la validación en el entorno objetivo.
- Un incidente empieza con estabilización y evidencia; los cambios de alto riesgo se aplazan salvo que impidan recuperar el servicio.

## Cadenas frecuentes

| Tipo de trabajo | Cadena de habilidades |
| --- | --- |
| Infraestructura de nube como código | `devops-router` -> `infrastructure-as-code` -> `cloud-operations` -> `security-secrets` |
| Imagen de aplicación y pipeline de entrega | `devops-router` -> `container-platforms` -> `cicd-automation` -> `security-secrets` |
| Cambio de Kubernetes en producción | `devops-router` -> `kubernetes-operations` -> `observability-operations` -> `security-secrets` |
| Incidente en una plataforma conocida | `devops-router` -> `incident-troubleshooting` -> habilidad afectada -> `observability-operations` |
| VPN o conectividad privada | `devops-router` -> `network-vpn-security` -> `security-secrets` -> `cloud-operations` |

## Entrega final

- Entendimiento de la tarea y límite del cambio.
- Cadena elegida y motivo.
- Documentación confirmada y evidencia real del entorno.
- Cambio realizado o plan revisable.
- Comandos y resultados de validación.
- Riesgos, supuestos, reversión y trabajo posterior.
