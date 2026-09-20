# QuickFix API

Backend Express + PostgreSQL pentru QuickFix.

## Configurare
Setează `DATABASE_URL`, `JWT_SECRET`, `ADMIN_EMAIL` și `ADMIN_PASSWORD` în `.env`.

Rulează mai întâi `database/schema.sql`, apoi:
```
npm install
npm start
```

## API
- `GET /api/health`
- `POST /api/auth/login`
- `GET /api/me`
- `GET /api/interventions`
- `POST /api/interventions`

API-ul folosește PostgreSQL pentru utilizatori, clienți și intervenții.