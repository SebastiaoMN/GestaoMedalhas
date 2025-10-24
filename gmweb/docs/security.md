# OWASP Alignment Checklist

This document tracks the OWASP Top 10 coverage for the GMWeb platform.

## A01: Broken Access Control
- Fine-grained authorization powered by Keycloak scopes (`agraciados:read`, `agraciados:write`, `cadastros:read`, `cadastros:write`).
- Method-level security via `@PreAuthorize`.

## A02: Cryptographic Failures
- TLS termination handled by NGINX (see `deployment/nginx/nginx.conf`).
- Secrets stored in Kubernetes `Secret` objects and never committed to Git.

## A03: Injection
- Hibernate parameter binding via Spring Data JPA repositories.
- Input validation with `jakarta.validation` annotations.

## A04: Insecure Design
- Documentation of threat model in `docs/architecture.md`.
- Security requirements captured in user stories and ADRs.

## A05: Security Misconfiguration
- Security headers enforced by `SecurityHeadersConfig` filter.
- Hardened Dockerfiles with non-root users and read-only filesystems.

## A06: Vulnerable and Outdated Components
- Dependabot configuration in `.github/dependabot.yml` (to be added).
- Regular `mvn versions:display-dependency-updates` scans.

## A07: Identification and Authentication Failures
- Delegated authentication to Keycloak using OAuth2/OIDC.
- Session-less access via JWT resource server.

## A08: Software and Data Integrity Failures
- CI pipeline enforces unit tests, SAST, and container image scanning.
- Database migrations managed with Flyway (planned addition).

## A09: Security Logging and Monitoring Failures
- Spring Boot Actuator metrics exported to Prometheus.
- Structured logs shipped via Elastic stack.

## A10: Server-Side Request Forgery
- Outbound HTTP requests restricted through network policies.
- Legacy integrations go through allowlisted hosts defined via environment variables.
