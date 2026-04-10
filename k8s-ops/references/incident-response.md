# K8s Incident Response

## Phase 1: Rapid Assessment
1. **Identify Scope**: Is it one pod, one deployment, or the whole cluster?
   - `kubectl get pods -A | grep -v Running`
2. **Check Events**: Look for recent warnings.
   - `kubectl get events -A --sort-by='.lastTimestamp'`
3. **Resource Health**: Check nodes.
   - `kubectl get nodes`
   - `kubectl describe node <node-name>` (Check Conditions)

## Phase 2: Pod-Level Deep Dive
### CrashLoopBackOff / Error
- `kubectl logs <pod-name> --previous` (Check why the previous container died)
- `kubectl describe pod <pod-name>` (Check "Events" and "Container Status")

### Pending
- `kubectl describe pod <pod-name>` (Check "Events" - often ResourceQuota, Unschedulable, or Taints)

### OOMKilled
- `kubectl describe pod <pod-name>` (Check "Last State" reason)
- Review resource limits in the manifest.

## Phase 3: Networking Issues
1. **DNS Check**: `kubectl exec -it <pod> -- nslookup kubernetes.default`
2. **Service Check**: `kubectl get svc`, `kubectl describe svc <name>` (Check Endpoints)
3. **Network Policies**: `kubectl get netpol -A`

## Phase 4: Control Plane Issues
- Check logs for API Server, Scheduler, or Controller Manager (often in `kube-system` or on the master nodes).
- Use `kubectl get componentstatuses` (Note: deprecated, use specific checks).
