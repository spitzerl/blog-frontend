# Frontend du Blog

Ce repository contient la partie frontend de l'application blog construite avec Next.js 15.

## 🚀 Démarrage rapide

### Développement local
```bash
npm install
npm run dev
```

### Avec Docker
```bash
# Développement
npm run docker:dev

# Production
npm run docker:prod
```

## 🛠️ Technologies utilisées

- **Next.js 15** - Framework React avec App Router
- **React 19** - Bibliothèque UI
- **TypeScript** - Typage statique
- **Tailwind CSS** - Framework CSS utilitaire
- **React Markdown** - Rendu Markdown

## 📁 Structure du projet

```
app/
├── layout.tsx          # Layout principal
├── page.tsx           # Page d'accueil
├── globals.css        # Styles globaux
├── favicon.ico        # Favicon
├── articles/          # Pages des articles
└── components/        # Composants réutilisables
    ├── ArticleCard.tsx
    └── MarkdownRenderer.tsx
```

## 🔧 Configuration

### Variables d'environnement

Créez un fichier `.env.local` :

```env
NEXT_PUBLIC_API_URL=http://localhost:3001
NODE_ENV=development
```

### Pour la production

```env
NEXT_PUBLIC_API_URL=https://api.votredomaine.com
NODE_ENV=production
```

## 🐳 Docker

Le frontend utilise une image Docker optimisée avec build multi-stage.

### Commandes Docker

- `npm run docker:build` - Construire l'image
- `npm run docker:dev` - Lancer en mode développement
- `npm run docker:prod` - Lancer en mode production
- `npm run docker:stop` - Arrêter les conteneurs
- `npm run docker:clean` - Nettoyer les conteneurs et images

## 🔗 Communication avec l'API

Le frontend communique avec l'API backend via les variables d'environnement `NEXT_PUBLIC_API_URL`.

## 📦 Déploiement

Le frontend peut être déployé sur :
- Vercel (recommandé pour Next.js)
- Netlify
- Docker (avec reverse proxy)
- Tout hébergeur supportant Node.js

## 🔄 API Routes

Les API routes Next.js sont utilisées uniquement pour :
- Health checks (`/api/health`)
- Proxy vers le backend si nécessaire