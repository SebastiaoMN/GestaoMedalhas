# GM Web

This directory contains the new web-based implementation of the "Gestão de Medalhas" platform. The legacy Delphi fluxos localizados em `Implementacao/App` foram convertidos para:

- **Angular front-end** com formulários reativos que replicam cadastros/consultas de agraciados.
- **Spring Boot back-end** com entidades JPA mapeando as tabelas originais, regras de negócio (CPF, homônimos, exclusão lógica) e integrações Oracle/Keycloak.
- Infraestrutura (Docker/Kubernetes), documentação e artefatos de segurança alinhados ao OWASP.

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
