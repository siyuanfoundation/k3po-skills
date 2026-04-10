# Kubebuilder Scaffolding Guide

## Project Initialization
- `kubebuilder init --domain my.domain --repo github.com/user/repo`: Initializes the project.
- `kubebuilder create api --group webapp --version v1 --kind Guestbook`: Creates a new CRD and Controller.

## Directory Structure
- `api/v1/`: Contains the Go types for your CRDs (`<kind>_types.go`).
- `internal/controller/`: Contains the reconciliation logic (`<kind>_controller.go`).
- `config/`: Kustomize manifests for deployment (CRDs, RBAC, Webhooks, Manager).
- `cmd/main.go`: The entry point for the manager.

## Key Files to Edit
- `*_types.go`: Define your spec and status fields. Remember to run `make manifests` after changes.
- `*_controller.go`: Implement the `Reconcile` function.
- `main.go`: Register new controllers or modify manager settings (e.g., health probes, metrics).
