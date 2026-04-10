# Kubernetes Internals Map

Use this guide with `repo-researcher` to navigate `kubernetes/kubernetes`.

## Core Components
- **API Server**: `pkg/controlplane/apiserver`
- **Controller Manager**: `pkg/controller`
  - *Note: Individual controllers are in subdirectories like `pkg/controller/deployment`, `pkg/controller/job`, etc.*
- **Scheduler**: `pkg/scheduler`
- **Kubelet**: `pkg/kubelet`
- **Kube-proxy**: `pkg/proxy`

## API Definitions
- **Internal Types**: `pkg/apis/<group>` (e.g., `pkg/apis/apps`)
- **Versioned APIs**: `staging/src/k8s.io/api/<group>/<version>` (e.g., `staging/src/k8s.io/api/apps/v1`)
- **Client-go**: `staging/src/k8s.io/client-go`

## Key Packages
- **Resource Logic**: `pkg/registry` (where storage logic for API types lives)
- **Admission Controllers**: `plugin/pkg/admission`
- **Volume Plugins**: `pkg/volume`
- **Cloud Providers**: `staging/src/k8s.io/cloud-provider`

## Research Tips
- When researching a specific feature, start with the corresponding controller in `pkg/controller`.
- Use `repo-researcher` to search for specific error messages found in logs to find the source of the issue.
- Look at `cmd/` for the entry points of each binary.
