# Database

QuickFix folosește PostgreSQL ca model de persistență.

## Fișiere
- `schema.sql` — tabele, relații, indecși și trigger pentru actualizarea `updated_at`.
- `seed.sql` — materiale demo pentru modulul Stoc.

## Ordine
1. Creează baza PostgreSQL.
2. Rulează `schema.sql`.
3. Rulează `seed.sql`.
4. Setează `DATABASE_URL` în backend.
