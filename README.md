# Plan Together

A lightweight group availability planner. No accounts needed — share a link, everyone marks when they're free.

## Live site

Hosted on GitHub Pages at: `https://windyzn.github.io/nook/`

---

## First-time setup

### 1. Supabase

1. Create a free project at [supabase.com](https://supabase.com)
2. Go to **SQL Editor** and run the contents of `schema.sql`
3. Go to **Settings → API** and copy:
   - Project URL
   - Anon public key

### 2. Add your credentials to index.html

Open `index.html` and find these two lines near the top:

```js
const SUPABASE_URL  = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON = 'YOUR_ANON_KEY';
```

Replace the placeholder strings with your actual values. Save the file.

### 3. Push to GitHub

```bash
git clone https://github.com/YOUR-USERNAME/plan-together.git
cd plan-together
# copy index.html, schema.sql, .github/ folder into this directory
git add .
git commit -m "initial setup"
git push
```

GitHub Actions will automatically deploy to Pages within ~1 minute.

---

## Making changes

Edit `index.html` locally, then:

```bash
git add index.html
git commit -m "describe your change"
git push
```

That's it — GitHub Actions redeploys automatically.

---

## Project structure

```
plan-together/
├── index.html          ← entire app (HTML + CSS + JS)
├── schema.sql          ← run once in Supabase SQL Editor
├── README.md
└── .github/
    └── workflows/
        └── deploy.yml  ← auto-deploy on push to main
```

## How it works

- **Create**: Organiser picks dates + optional password → gets a shareable link like `yoursite.github.io/plan-together/?event=abc123`
- **Fill in**: Anyone with the link enters their name and marks free slots
- **Results**: Heat map + best times list, updated live from Supabase

No accounts, no logins required for respondents.
