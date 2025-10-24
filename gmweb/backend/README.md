# GMWeb Backend

Spring Boot service that expõe as APIs REST para cadastro/consulta de agraciados, integra com Oracle, Keycloak e sistemas legados.

## Features
- Modelagem JPA fiel às tabelas `AGRACIADOS`, `CARGO_PROFISSAO` e `COMARCA`.
- Regras de negócio migradas do Delphi (CPF, homônimos, exclusão lógica, limite por comarca/ano).
- OAuth2 Resource Server preconfigurado para validação de JWTs do Keycloak.
- Conectividade Oracle via Spring Data JPA + consultas JDBC pontuais.
- Documentação OpenAPI via SpringDoc e health check em `/api/health`.
Spring Boot service that exposes RESTful APIs and orchestrates integrations with Oracle Database, Keycloak, and legacy systems.

## Features
- Modular architecture ready for CQRS/hexagonal extensions.
- OAuth2 Resource Server preconfigured for Keycloak JWT validation.
- Oracle database connectivity via Spring Data JPA.
- OpenAPI/Swagger documentation via SpringDoc.
- Health endpoint exposed at `/api/health`.

## Getting Started
1. Install Java 17 and Maven 3.9+.
2. Copy `.env.example` to `.env` and override secrets (see below).
3. Run `mvn spring-boot:run` from this directory.

## Environment Variables
The backend reads secrets from environment variables when running in containers:

- `ORACLE_HOST`, `ORACLE_PORT`, `ORACLE_SERVICE`, `ORACLE_USER`, `ORACLE_PASSWORD`
- `KEYCLOAK_URL`, `KEYCLOAK_REALM`, `KEYCLOAK_CLIENT_ID`, `KEYCLOAK_CLIENT_SECRET`

## OWASP Considerations
Baseline checks include security headers, centralized exception handling, and audit logging. See `docs/security.md` for detailed recommendations.
