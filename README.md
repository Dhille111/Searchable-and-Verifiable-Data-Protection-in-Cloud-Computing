# Searchable and Verifiable Data Protection in Cloud Computing

## Run locally
- Java 21+
- MySQL 8+ or PostgreSQL 14+
- Import/create schema before starting app
- Configure DB using environment variables or defaults in `connect.jsp`

Environment variables supported:
- `DB_TYPE` (`mysql` or `postgres`, optional; auto-detected from `DB_PORT`)
- `DB_URL` (recommended on Render; supports `postgres://...` and `jdbc:postgresql://...`)
- `DB_HOST`
- `DB_PORT`
- `DB_NAME`
- `DB_USER`
- `DB_PASS`

## Render deployment
This project is configured for Docker deployment on Render.

### Files added
- `Dockerfile`
- `render-start.sh`
- `render.yaml`

### Deploy steps
1. Push this project to GitHub.
2. In Render: **New +** → **Blueprint** (or Web Service from repo).
3. Select this repository.
4. Set environment variables (recommended):
   - `DB_TYPE` = `postgres`
   - `DB_URL` = Render PostgreSQL **Internal Database URL**
5. Optional fallback vars (if you prefer split config):
   - `DB_HOST`, `DB_PORT` (`5432`), `DB_NAME`, `DB_USER`, `DB_PASS`
6. Deploy.

## Notes
- The app is deployed at web root (`ROOT`) in Tomcat.
- Startup script binds Tomcat to Render's `PORT` automatically.
