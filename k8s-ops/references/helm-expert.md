# Helm Expert Guide

## Chart Development Best Practices
- **Library Charts**: Use for shared logic/templates across multiple charts.
- **Subcharts**: Keep them independent. Avoid tight coupling unless necessary.
- **Named Templates**: Use `_helpers.tpl` for reusable logic. Always prefix template names with the chart name to avoid collisions.
- **Value Validation**: Use `values.schema.json` to enforce types and required fields.

## Advanced Templating
- Use `lookup` function carefully (it doesn't work with `helm template` or `--dry-run`).
- Use `tpl` to evaluate strings as templates.
- Use `range` for looping over lists and maps.

## Management & Operations
- `helm upgrade --install`: Atomic updates/installs.
- `helm rollback`: Quick recovery from failed deployments.
- `helm history`: Inspect previous releases.
- `helm get values`: See what was actually deployed.
- **Post-Renderer**: Use for Kustomize integrations or last-mile manifest patches.

## Security
- Use `helm-secrets` plugin for managing encrypted secrets (e.g., via SOPS).
- Avoid putting raw secrets in `values.yaml`.
- Use RBAC to limit Helm's permissions in the cluster.
