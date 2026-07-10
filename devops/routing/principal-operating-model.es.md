# Modelo operativo principal de DevOps

<p align="center">
  <a href="principal-operating-model.ru.md">🇷🇺 Русский</a>
  &nbsp;·&nbsp; <a href="principal-operating-model.md">🇬🇧 English</a>
  &nbsp;·&nbsp; <strong>🇪🇸 Español</strong>
  &nbsp;·&nbsp; <a href="principal-operating-model.zh.md">🇨🇳 中文</a>
  &nbsp;·&nbsp; <a href="README.es.md">Rutas</a>
</p>

Este modelo eleva una habilidad DevOps desde la generación de comandos hasta una decisión operativa responsable. Úsalo antes de implementar, antes de cambios que afecten producción y antes del traspaso final.

## Estándar básico

1. **Evidencia antes que confianza.** Separa hechos observados, supuestos y recomendaciones. No afirmes certeza sin documentación actual, estado de plataforma, evidencia del repositorio, planes, logs, métricas, trazas o pruebas.
2. **Context7 por defecto.** Usa Context7 MCP para documentación vigente de nube, Kubernetes, IaC, CI/CD, contenedores, observabilidad, seguridad, red, API, CLI, proveedores y configuración.
3. **Presupuesto de riesgo operativo.** Describe radio de impacto, reversibilidad, efecto en seguridad y datos, riesgo de caída, coste y requisitos de cumplimiento.
4. **Rastro de decisión.** Registra opciones, compromisos, camino elegido, rechazo de alternativas, evidencia de validación y reversión o contención.
5. **Escalera de validación.** Empieza por la prueba útil más barata: sintaxis, lint, dry-run, plan, diff, política, smoke test, ensayo de reversión y después despliegue en producción.
6. **Mínimo privilegio y confianza de suministro.** Limita IAM/RBAC y red, evita secretos duraderos, fija versiones y documenta procedencia de artefactos en entregas.
7. **Condiciones de parada.** Pide aprobación antes de operaciones destructivas, cambios en producción, exposición amplia de red, cambios de credenciales, migraciones de datos u operaciones de estado irreversibles.

## Preguntas de revisión

- ¿Qué documentación actual se confirmó mediante Context7 o una fuente primaria?
- ¿Cuál es el entorno, versión, proveedor y región exactos?
- ¿Cuál es el radio de impacto y la reversión segura más rápida?
- ¿Qué validación demuestra el cambio antes de producción?
- ¿Qué observabilidad mostrará éxito o fallo?
- ¿Qué supuesto de seguridad o cadena de suministro podría ser erróneo?
- ¿Qué runbook, decisión o nota de memoria deberá leer el siguiente agente?

## Prácticas con fuentes

- [Google SRE](https://sre.google/sre-book/service-level-objectives/) relaciona SLI/SLO y decisiones de entrega con la fiabilidad visible para usuarios.
- [DORA capabilities](https://dora.dev/capabilities/) cubre automatización de pruebas, entrega continua, mantenibilidad y prácticas de infraestructura en nube.
- [NIST SSDF](https://csrc.nist.gov/pubs/sp/800/218/final) integra desarrollo seguro en todo el ciclo de vida.
- [OpenSSF SLSA](https://slsa.dev/spec/v1.0/) define procedencia de artefactos y confianza en cadena de suministro.
- [Context7 MCP](https://github.com/upstash/context7) sirve para verificar documentación vigente durante implementación, configuración y trabajo con API.
