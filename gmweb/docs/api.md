# API Overview

## Authentication
All requests must include a Bearer token issued by Keycloak. The APIs rely on the following OAuth scopes:

- `agraciados:read` / `agraciados:write` – CRUD operations for honorees.
- `cadastros:read` / `cadastros:write` – Auxiliary registries (cargos/profissões, comarcas, reference data).

## Endpoints
### `GET /gmweb/api/health`
- **Description**: Liveness probe endpoint.
- **Response**:
  ```json
  {
    "status": "UP",
    "timestamp": "2024-04-01T12:34:56.123Z"
  }
  ```

### `GET /gmweb/api/agraciados`
- **Scopes**: `agraciados:read`
- **Query Params**:
  - `tipo` (**required**): `HELIO_COSTA` ou `COLAR_MERITO`.
  - `ano` (*opcional*): filtra pelo ano da comenda.
  - `nome` (*opcional*): filtro textual (contém) pelo nome do agraciado.
- **Descrição**: Lista agraciados ativos com filtros equivalentes às telas Delphi de consulta.
- **Resposta**: Array de objetos contendo metadados da medalha, comarca e cargo/profissão.

### `POST /gmweb/api/agraciados`
- **Scopes**: `agraciados:write`
- **Descrição**: Cria um agraciado, incluindo validações de CPF, homônimos e limite de uma comarca por ano (Medalha Des. Hélio Costa).
- **Corpo da requisição**:
  ```json
  {
    "nome": "Maria Oliveira",
    "ano": 2024,
    "cpf": "12345678909",
    "sexo": "F",
    "tipoMedalha": "HELIO_COSTA",
    "cargoProfissaoId": 12,
    "comarcaId": 45,
    "enviado": false,
    "disponivelInternet": true,
    "inMemorian": false,
    "homonimo": false
  }
  ```
- **Resposta**: Objeto do agraciado recém-criado com código interno.

### `PUT /gmweb/api/agraciados/{codigo}`
- **Scopes**: `agraciados:write`
- **Descrição**: Atualiza dados do agraciado mantendo o tipo de medalha.

### `DELETE /gmweb/api/agraciados/{codigo}`
- **Scopes**: `agraciados:write`
- **Descrição**: Realiza exclusão lógica (marca usuário e data de exclusão) preservando histórico, como no sistema Delphi.

### `POST /gmweb/api/agraciados/disponibilidade-internet`
- **Scopes**: `agraciados:write`
- **Descrição**: Marca ou desmarca todos os agraciados de um ano como disponíveis na internet, reproduzindo as rotinas *Disponibiliza na internet* das medalhas M1/M2.
- **Corpo da requisição**:
  ```json
  {
    "tipo": "HELIO_COSTA",
    "ano": 2024,
    "disponivel": true
  }
  ```
- **Resposta**: `204 No Content`.

### `GET /gmweb/api/cargos-profissao`
- **Scopes**: `cadastros:read`
- **Descrição**: Lista cargos/profissões ordenados alfabeticamente.

### `POST /gmweb/api/cargos-profissao`
- **Scopes**: `cadastros:write`
- **Descrição**: Cria cargo/profissão gerando código sequencial.

### `PUT /gmweb/api/cargos-profissao/{codigo}`
- **Scopes**: `cadastros:write`
- **Descrição**: Atualiza descrição do cargo/profissão.

### `DELETE /gmweb/api/cargos-profissao/{codigo}`
- **Scopes**: `cadastros:write`
- **Descrição**: Exclui o registro caso não esteja vinculado a nenhum agraciado.

### `GET /gmweb/api/comarcas`
- **Scopes**: `cadastros:read`
- **Descrição**: Lista comarcas ativas (JOIN com MUNICIPIO) para preencher comboboxes.

### `GET /gmweb/api/referencias/sexos`
- **Scopes**: `cadastros:read`
- **Descrição**: Recupera valores do domínio `SEXO` (CG_REF_CODES) para popular listas.

### `GET /gmweb/api/agraciados/relatorios/ano`
- **Scopes**: `agraciados:read`
- **Query Params**: `tipo` (obrigatório) e `ano` (obrigatório).
- **Descrição**: Lista detalhada (com flags Sim/Não) dos agraciados por ano, equivalente ao relatório “Agraciados por ano”.

### `GET /gmweb/api/agraciados/relatorios/ordem`
- **Scopes**: `agraciados:read`
- **Query Params**: `tipo` (obrigatório).
- **Descrição**: Retorna agraciados ordenados alfabeticamente, espelhando o relatório “Agraciados por ordem alfabética”.

### `GET /gmweb/api/agraciados/relatorios/cargo`
- **Scopes**: `agraciados:read`
- **Query Params**: `tipo` (obrigatório) e `cargoId` (opcional).
- **Descrição**: Relatório filtrado por cargo/profissão, compatível com a listagem Delphi que aceita agraciados sem cargo informado.

### `GET /gmweb/api/agraciados/relatorios/sem-indicacao`
- **Scopes**: `agraciados:read`
- **Query Params**: `ano` (obrigatório).
- **Descrição**: Exibe as comarcas mineiras que não possuem indicação para a Medalha Des. Hélio Costa no ano selecionado.

### `GET /gmweb/api/agraciados/relatorios/minas-gerais`
- **Scopes**: `agraciados:read`
- **Query Params**: `ano` (obrigatório).
- **Descrição**: Gera o arquivo texto no layout exigido pelo Diário Oficial *Minas Gerais* com os agraciados da Medalha Des. Hélio Costa.
