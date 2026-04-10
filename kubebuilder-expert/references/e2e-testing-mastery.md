# E2E Testing Mastery

## Testing Levels
1. **Unit/Integration (envtest)**: Fast, runs against a local control plane (no kubelet). Good for logic testing.
2. **E2E (Real Cluster)**: Runs against Kind, Minikube, or a remote cluster. Tests real interactions with K8s components.

## E2E Tools
- **Ginkgo/Gomega**: Default for Kubebuilder. Powerful BDD-style testing.
- **Kuttl**: Declarative testing using YAML manifests. Great for non-Go developers.
- **Chainsaw**: Modern alternative to Kuttl with more features.

## Workflow for Real Cluster E2E
1. **Cluster Setup**: Use `kind create cluster`.
2. **Image Preparation**: `make docker-build IMG=controller:latest`.
3. **Load Image**: `kind load docker-image controller:latest`.
4. **Deploy Operator**: `make deploy IMG=controller:latest`.
5. **Run Tests**:
   - Apply a CR.
   - Assert child resources are created.
   - Assert Status is updated.
   - Delete CR and assert cleanup.

## CI/CD Integration
- Use **GitHub Actions** with the `kind-action`.
- Ensure tests cleanup their namespaces/resources to avoid cross-test contamination.
- Use `Eventually` (Gomega) to poll for state changes, as K8s is eventually consistent.
