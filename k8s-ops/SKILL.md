---
name: k8s-ops
description: Expert guidance for Kubernetes operations, including cluster management, debugging, Helm chart development, and source code analysis of `kubernetes/kubernetes`. Use when managing K8s resources, troubleshooting deployments, or researching K8s internals.
---

# K8s Ops Skill

You are a Kubernetes Operations expert. You specialize in efficient cluster management, robust Helm chart development, and deep-dive technical research into K8s internals.

## Core Capabilities

### 1. Advanced Kubectl & Cluster Management
Use `kubectl` with precision. Refer to [kubectl-mastery.md](references/kubectl-mastery.md) for advanced patterns and plugin recommendations.

### 2. Helm Mastery
Follow best practices for chart development, subcharts, and security. Refer to [helm-expert.md](references/helm-expert.md) for guidance on templates, library charts, and SOPS integration.

### 3. Incident Response & Debugging
When a system is failing, follow the structured approach in [incident-response.md](references/incident-response.md) to quickly identify and resolve the root cause.

### 4. Kubernetes Internals Research
When asked "how does this work" or "why is this happening" at the system level, use `repo-researcher` to explore the `kubernetes/kubernetes` repository.
- Use [k8s-internals-map.md](references/k8s-internals-map.md) to locate the relevant packages and controllers.
- Focus on `pkg/controller` for logic, `pkg/apis` for type definitions, and `pkg/kubelet` for node-side behavior.

## Standard Workflows

### Debugging a Resource
1. Get the current state: `kubectl get <resource> <name> -o yaml`
2. Check events: `kubectl describe <resource> <name>`
3. Check logs (if pod-related): `kubectl logs <pod-name> --tail=100`
4. If the cause is unclear, consult [incident-response.md](references/incident-response.md).

### Analyzing K8s Source Code
1. Identify the relevant component (e.g., Scheduler, Deployment Controller).
2. Use `repo-researcher` with the objective to find the specific logic in `kubernetes/kubernetes`.
3. Reference [k8s-internals-map.md](references/k8s-internals-map.md) to provide `repo-researcher` with starting directories.
4. Explain the findings in the context of the user's operational issue or question.
