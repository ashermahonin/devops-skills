# Containers Workflow

## Required Inputs

- Runtime and build tool: Docker, BuildKit, Podman, Compose, or another OCI-compatible tool.
- Base image and application language.
- Target environment: local, CI, Kubernetes, VM, or managed runtime.
- Size, startup speed, security, and debugging requirements.
- Multi-architecture requirements.

## Documentation Checks

Verify current docs for:

- Dockerfile and Compose syntax.
- BuildKit and buildx features.
- OCI labels and registry behavior.
- Healthcheck behavior.
- Runtime flags and rootless/non-root patterns.
- Registry auth, manifests, SBOM, signing, and provenance if needed.

## Design Checklist

- Decide whether this is a dev image, production image, or both.
- Use multi-stage builds when build tools do not belong in runtime.
- Order dependency installation for effective caching.
- Choose a minimal but supportable runtime image.
- Define user, group, file ownership, and writable paths.
- Define healthcheck, entrypoint, command, and signal handling.
- Avoid secrets in build context and image layers.

## Implementation Defaults

- `.dockerignore` present for non-trivial contexts.
- Pinned base images where possible.
- Deterministic dependency install commands.
- Non-root execution where possible.
- Exec-form `CMD` or `ENTRYPOINT`.
- Healthcheck when the runtime can use it.
- Clear OCI labels for production images.

## Verification Checklist

- Image builds successfully.
- Container starts locally or in test runtime.
- Healthcheck works.
- Non-root behavior considered.
- Secrets absent from image and build context.
- Image size and layer order reviewed.
- Vulnerability scan path documented.
