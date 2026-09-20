# QuickFix

Platformă de management operațional pentru o firmă de reparații și intervenții la domiciliu.

## MVP funcțional
- Dashboard
- Login JWT
- Intervenții: listare, creare, actualizare
- Clienți: listare și creare
- Tehnicieni: listare și încărcare activă
- Stoc materiale
- PostgreSQL
- GitHub Pages frontend

## API
- GET /api/health
- POST /api/auth/login
- GET /api/me
- GET/POST /api/interventions
- PATCH /api/interventions/:id
- GET/POST /api/clients
- GET /api/technicians
- GET /api/materials

Configurează backend-ul prin variabile de mediu. Nu pune secrete în Git.