# Troubleshooting Operators

## Common Issues
### Controller not reconciling
- **Check Logs**: `kubectl logs -n <namespace> deployment/<operator-name>`.
- **RBAC Errors**: Look for "forbidden" errors in logs. Ensure the ServiceAccount has correct roles.
- **Predicates**: Check if you are using predicates that might be filtering out events.

### Frequent Requeuing (Hot Loop)
- Ensure you are not updating the resource in a way that triggers a new reconciliation unnecessarily.
- Use `Status` subresource to avoid incrementing `ResourceVersion` of the main spec if possible.

### Finalizer Stuck
- **Check Resources**: Ensure child resources are being deleted.
- **Manual Fix**: If stuck, you may need to manually patch the CR to remove the finalizer (last resort):
  `kubectl patch cr <name> -p '{"metadata":{"finalizers":null}}' --type=merge`.

## Debugging Tools
- **Delve**: Use for local debugging of the controller binary.
- **Visual Studio Code / GoLand**: Remote debugging with Delve inside the cluster.
- **Metrics**: Check `controller_runtime_reconcile_errors_total` and `controller_runtime_reconcile_time_seconds`.

## Event Analysis
- Check events on the CR: `kubectl describe <kind> <name>`.
- Operators should emit events using `r.Recorder.Event()`.
