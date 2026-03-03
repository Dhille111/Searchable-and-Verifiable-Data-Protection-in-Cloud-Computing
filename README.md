# Searchable and Verifiable Data Protection in Cloud Computing

## Run locally
- Java 21+
- MySQL 8+
- Import `database/Database.sql` into MySQL database `svdp`
- Configure DB using environment variables or defaults in `connect.jsp`

Environment variables supported:
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
4. Set environment variables:
   - `DB_HOST` = your MySQL host
   - `DB_PORT` = `3306`
   - `DB_NAME` = `svdp`
   - `DB_USER` = your MySQL user
   - `DB_PASS` = your MySQL password
5. Deploy.

## Notes
- The app is deployed at web root (`ROOT`) in Tomcat.
- Startup script binds Tomcat to Render's `PORT` automatically.
