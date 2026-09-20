# QuickFix

QuickFix este o platformă de management operațional pentru o firmă de reparații și intervenții la domiciliu.

## Ce există acum

### Frontend
- Dashboard
- Intervenții
- Programări
- Clienți
- Tehnicieni
- Stoc
- Rapoarte
- Login JWT
- Căutare și filtrare intervenții
- Formular de creare a unei intervenții
- Interfață responsive

### Backend
- Express.js
- PostgreSQL
- JWT authentication
- API pentru login și intervenții
- Health check pentru baza de date
- Configurare prin .env

### Database
- users
- clients
- technicians
- interventions
- materials
- intervention_materials
- audit_log

## Rulare locală

### Backend

cd backend
npm install
copy .env.example .env
npm start

Setează în .env:
- DATABASE_URL
- JWT_SECRET
- ADMIN_EMAIL
- ADMIN_PASSWORD

Rulează apoi database/schema.sql în PostgreSQL.

### Frontend

index.html este frontend-ul QuickFix.

Pentru API local, setează în browser:
localStorage.setItem("quickfix_api","http://localhost:3000")

## Deploy

Frontend-ul este pregătit pentru GitHub Pages prin workflow-ul din .github/workflows/pages.yml.

Backend-ul trebuie găzduit separat, iar URL-ul lui se setează în quickfix_api.
