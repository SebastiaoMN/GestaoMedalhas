# Deployment Guide

## Docker Compose (Local)
1. Install Docker Desktop.
2. Run `make docker-up` from the project root.
3. Access the SPA at http://localhost:4200 and the API at http://localhost:8080/gmweb.
4. Tear down with `make docker-down`.

## Kubernetes (Production)
1. Ensure the `gmweb` namespace exists: `kubectl apply -f deployment/k8s/namespace.yaml`.
2. Apply secrets and config maps with `make k8s-apply` or individual `kubectl apply -f` commands.
3. Build and push container images referenced in the manifests (`ghcr.io/example/*`).
4. Configure DNS and TLS for `gmweb.example.com`.
5. Monitor pods with `kubectl get pods -n gmweb`.

## CI/CD Recommendations
- Use GitHub Actions to build and push Docker images on merge.
- Run unit tests (`mvn test`, `ng test`) and linting in CI.
- Scan images with Trivy and run OWASP ZAP baseline scans against the deployed ingress.
