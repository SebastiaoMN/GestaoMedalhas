# API Overview

## Authentication
All requests must include a Bearer token issued by Keycloak with the scopes `medals:read` or `medals:write` depending on the operation.

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

### `GET /gmweb/api/medals`
- **Scopes**: `medals:read`
- **Description**: Retrieves all medals stored in Oracle.
- **Response**: Array of medal objects.

### `POST /gmweb/api/medals`
- **Scopes**: `medals:write`
- **Request Body**:
  ```json
  {
    "athleteName": "Ana Silva",
    "modality": "Natação",
    "category": "200m Livre",
    "medalType": "Ouro"
  }
  ```
- **Response**: Medal created with generated identifier.
