# Memoria del proyecto DevOps

<p align="center">
  <a href="project-memory.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="project-memory.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <strong>🇪🇸 Español</strong>
  &nbsp;·&nbsp; <a href="project-memory.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="README.es.md">Guía</a>
</p>

Las habilidades se pueden instalar junto con un esqueleto pequeño de documentación de proyecto. Sirve para que un agente DevOps se oriente rápido sin leer todo el repositorio.

| Archivo | Propósito |
| --- | --- |
| `00-index.md` | Resumen del proyecto, responsables, entornos y enlaces críticos. |
| `01-inventory.md` | Servicios, clústeres, cuentas, proveedores, registros y sistemas CI. |
| `02-access-and-secrets.md` | Modelo de acceso, almacenes de secretos, rotación y notas de auditoría. |
| `03-deployments.md` | Rutas de despliegue, reglas de entrega y comandos de reversión. |
| `04-observability.md` | Métricas, logs, trazas, paneles, alertas y SLO. |
| `05-incidents.md` | Cronologías de incidentes, decisiones de recuperación y acciones preventivas. |

Mantén estos archivos breves. Son memoria de navegación, no una copia del repositorio. El contexto completo pertenece al código y a una capa RAG o de grafo conectada. No guardes credenciales activas, claves privadas, tokens de acceso ni logs operativos sin depurar.
