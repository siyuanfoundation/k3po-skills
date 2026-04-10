# Reconciliation Patterns

## The Golden Rule: Idempotency
The `Reconcile` function must be able to run multiple times without unintended side effects. Always check the current state against the desired state.

## Core Logic Flow
1. **Fetch the Resource**: Use `r.Get(ctx, req.NamespacedName, &resource)`.
2. **Handle Deletion**: Check `resource.DeletionTimestamp`. If set, handle finalizers and return.
3. **Set Finalizers**: Ensure the finalizer is present if you have cleanup tasks.
4. **Sync State**: Create/Update/Delete child resources (Deployments, Services, etc.).
5. **Update Status**: Use `r.Status().Update(ctx, &resource)` to reflect the current state.

## Error Handling
- `return ctrl.Result{}, nil`: Success, don't requeue.
- `return ctrl.Result{Requeue: true}, nil`: Success, but requeue immediately (use sparingly).
- `return ctrl.Result{RequeueAfter: time.Minute}, nil`: Success, requeue after a delay.
- `return ctrl.Result{}, err`: Error, requeue with exponential backoff.

## Owner References
Set owner references on child resources so they are automatically garbage collected when the parent CR is deleted:
```go
if err := ctrl.SetControllerReference(parent, child, r.Scheme); err != nil {
    return err
}
```
