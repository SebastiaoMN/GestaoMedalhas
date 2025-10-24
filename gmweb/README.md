# GM Web

This directory contains the new web-based implementation of the "Gestão de Medalhas" platform. The solution is split into an Angular front-end, a Spring Boot back-end, infrastructure assets for Oracle database integration, Keycloak single sign-on, Docker images, Kubernetes manifests, and security-hardening notes aligned with OWASP recommendations.

```
gmweb/
├── README.md
├── backend/
├── frontend/
├── deployment/
├── docs/
└── tools/
```

Each subdirectory has its own README and build instructions. Start with the top-level Makefile for common workflows, such as launching the local development stack with Docker Compose.
