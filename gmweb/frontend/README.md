# GMWeb Front-end

Angular-based single-page application that reproduces the Delphi workflows for cadastro, consulta e manutenção de agraciados.

## Tech Stack
- Angular 17
- Angular Material
- RxJS
- NgRx Store (planned)

## Development
1. Install Node.js 20 and Angular CLI (`npm install -g @angular/cli`).
2. Run `npm install` inside this folder.
3. Start the dev server with `npm start` (proxy configured for `/api`).

## Highlights
- Formulários reativos com validações equivalentes às telas Delphi.
- Listagem com filtros por tipo de medalha, ano e nome.
- Acesso aos cadastros auxiliares (cargos/profissões, comarcas, sexos) via Material components.

## Security
- OAuth2/OIDC login via Keycloak JavaScript adapter.
- HTTP interceptors for attaching bearer tokens.
- Angular route guards to enforce authorization.
