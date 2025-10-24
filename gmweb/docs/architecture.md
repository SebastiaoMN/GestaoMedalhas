# GMWeb Architecture Overview

## Context
GMWeb modernizes the legacy Delphi application by splitting the solution into a responsive Angular front-end and a Spring Boot back-end that integrates with Oracle Database, Keycloak, and external legacy APIs.

## Component Diagram
- **Angular Front-end (`frontend/`)**: Implements the SPA, consumes REST APIs, handles routing and responsive layout via Angular Material.
- **Spring Boot Back-end (`backend/`)**: Exposes REST endpoints, enforces security, and orchestrates integrations.
- **Oracle Database**: Stores core medal management data.
- **Keycloak**: Provides identity, authentication, and authorization.
- **Legacy Systems**: Integrated via REST APIs proxied through the backend.
- **NGINX**: Acts as reverse proxy, TLS terminator, and static asset server for the Angular build.
- **Docker & Kubernetes**: Containerize services and deploy them with infrastructure-as-code.

## Data Flow
1. Users authenticate against Keycloak and receive JWT access tokens.
2. Angular SPA sends requests to NGINX, which proxies `/api/*` routes to the Spring Boot service and serves static assets for `/`.
3. The backend validates JWT tokens, applies authorization policies, and interacts with Oracle using Spring Data JPA.
4. Legacy system data is retrieved via the `LegacyClient` WebClient integration.

## Deployment Topology
Kubernetes manifests define the following workloads:
- `gmweb-frontend` Deployment + Service
- `gmweb-backend` Deployment + Service
- `oracle` StatefulSet (for local development only)
- `keycloak` Deployment + Service
- `nginx` Ingress controller or reverse proxy

## Observability
- Metrics via Spring Boot Actuator, scraped by Prometheus.
- Logs shipped to Elastic Stack using Fluent Bit sidecars.
- Traces collected with OpenTelemetry SDK (future work).
