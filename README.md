# QuickFix

Site public pentru o firmă de reparații și intervenții la domiciliu.

## Ce conține

- homepage responsive
- servicii: instalații sanitare, electricitate, încălzire și climatizare
- secțiunea „Cum lucrăm”
- beneficii QuickFix
- formular de programare
- contact telefonic și email
- deployment automat prin GitHub Pages

## Structură

- `index.html` — pagina principală
- `assets/css/style.css` — design și responsive
- `assets/js/app.js` — formular și interacțiuni
- `.github/workflows/pages.yml` — publicarea site-ului

## Publicare

Orice push pe `main` declanșează workflow-ul GitHub Pages.

Formularul este pregătit pentru conectarea unui endpoint API separat. Fără backend configurat, pagina rămâne complet utilizabilă ca site de prezentare.

## Înainte de lansarea comercială

Înlocuiește numărul de telefon și adresa de email demonstrative din `index.html` cu datele reale ale companiei.