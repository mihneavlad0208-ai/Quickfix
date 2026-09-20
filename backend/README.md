# QuickFix API

API Express pentru QuickFix.

## Configurare
1. Copiază .env.example în .env.
2. Setează un JWT_SECRET aleator și puternic.
3. Setează ADMIN_EMAIL și ADMIN_PASSWORD.
4. Rulează npm install.
5. Pornește cu npm start.

## Endpoint-uri
- GET /api/health
- POST /api/auth/login
- GET /api/me
- GET /api/interventions
- POST /api/interventions

Datele intervențiilor sunt încă ținute în memorie. DATABASE_URL este pregătit pentru conectarea PostgreSQL/Supabase.