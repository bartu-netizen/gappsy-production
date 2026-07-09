# 🚀 DEPLOY INSTRUCTIES - Maak je site LIVE

## Probleem
"Unexpected Server Error" bij het proberen te deployen vanuit Bolt.

## Oplossing: De code is al gefixt! Nu moet je deployen.

## Methode 1: Via Netlify (AANBEVOLEN)

### Stap 1: Installeer Netlify CLI
```bash
npm install -g netlify-cli
```

### Stap 2: Login bij Netlify
```bash
netlify login
```

### Stap 3: Deploy je site
```bash
netlify deploy --prod
```

Volg de prompts en kies de `dist` folder als je publish directory.

---

## Methode 2: Via Netlify Dashboard (Zonder CLI)

### Stap 1: Ga naar https://app.netlify.com

### Stap 2: Klik op "Add new site" → "Deploy manually"

### Stap 3: Sleep de `dist` folder naar het upload gebied

### Stap 4: Wacht tot deployment compleet is

---

## Methode 3: Via Vercel

### Stap 1: Installeer Vercel CLI
```bash
npm install -g vercel
```

### Stap 2: Deploy
```bash
vercel --prod
```

---

## BELANGRIJK: Build is al klaar!
- ✅ Code is gefixt
- ✅ Build is succesvol (npm run build)
- ✅ Alle 52 state pages zijn pre-rendered
- ✅ dist/ folder bevat alle bestanden

Je hoeft alleen nog maar de `dist` folder te uploaden naar je hosting provider!

---

## Snel Testen Lokaal
Als je eerst wilt testen of alles werkt:

```bash
npm run preview
```

Dan kan je de site bekijken op http://localhost:4173
