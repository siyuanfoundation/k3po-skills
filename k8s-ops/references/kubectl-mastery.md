# Kubectl Mastery

## Efficient Resource Discovery
- Use `-A` for all namespaces.
- Use `-o custom-columns` for precise data extraction:
  ```bash
  kubectl get pods -A -o custom-columns="NAME:.metadata.name,IMAGE:.spec.containers[*].image"
  ```
- Use `kubectl get <resource> --show-labels` to see labels.
- Use `-l` for label selectors (e.g., `-l app=nginx`).

## Debugging and Introspection
- `kubectl events --types=Warning` (K8s 1.23+) for localized event viewing.
- `kubectl debug -it <pod-name> --image=busybox` for ephemeral containers.
- `kubectl top pods` and `kubectl top nodes` (requires Metrics Server).
- `kubectl auth can-i <verb> <resource>` to verify permissions.

## Resource Management
- `kubectl patch` for quick updates without full manifest editing.
- `kubectl rollout restart deployment <name>` for zero-downtime restarts.
- `kubectl wait --for=condition=Ready pod/my-pod` for synchronization in scripts.

## Useful Plugins (via Krew)
- `ctx`: Quick context switching.
- `ns`: Quick namespace switching.
- `view-secret`: Decode secrets in one go.
- `df-pv`: Disk usage of persistent volumes.
