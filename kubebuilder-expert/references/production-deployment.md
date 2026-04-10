# Production Deployment Guide

## Build and Push
1. **Docker Build**: `make docker-build IMG=<registry>/<repo>:<tag>`.
2. **Docker Push**: `make docker-push IMG=<registry>/<repo>:<tag>`.

## Configuration Management
- **Kustomize**: Use `config/default`, `config/manager`, etc.
- **Overlays**: Create `config/overlays/production` for env-specific changes (e.g., resource limits, replicas).

## RBAC and Security
- **Least Privilege**: Only request the permissions your controller actually needs in `//+kubebuilder:rbac`.
- **Pod Security**: Ensure the manager runs as a non-root user (default in Kubebuilder).
- **Secrets**: Use `config/manager/manager_config.yaml` or env vars for configuration.

## Admission Webhooks
- **Cert-manager**: Highly recommended for managing the certificates required by webhooks.
- **Scaffolding**: `kubebuilder create webhook --group webapp --version v1 --kind Guestbook --defaulting --programmatic-validation`.

## Metrics and Monitoring
- Kubebuilder provides a metrics endpoint at `:8080/metrics` by default.
- Use `config/prometheus` to export metrics to Prometheus.
