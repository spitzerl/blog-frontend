# Dockerfile pour le Frontend Next.js

# ===== BASE STAGE =====
FROM node:20-alpine AS base

RUN apk add --no-cache libc6-compat
WORKDIR /app

# Copier les fichiers de configuration
COPY package*.json ./

# ===== DEPENDENCIES STAGE =====
FROM base AS deps

# Installation des dépendances de production
RUN npm ci --only=production && npm cache clean --force

# ===== DEVELOPMENT DEPENDENCIES STAGE =====
FROM base AS dev-deps

# Installation de toutes les dépendances
RUN npm ci

# ===== BUILD STAGE =====
FROM dev-deps AS build

# Copier le code source
COPY . .

# Variables d'environnement pour le build
ENV NEXT_TELEMETRY_DISABLED=1
ENV NODE_ENV=production

# Build de l'application Next.js
RUN npm run build

# ===== PRODUCTION STAGE =====
FROM base AS production

# Créer un utilisateur non-root
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copier les fichiers nécessaires depuis le build
COPY --from=deps --chown=nextjs:nodejs /app/node_modules ./node_modules
COPY --from=build --chown=nextjs:nodejs /app/.next ./.next
COPY --from=build --chown=nextjs:nodejs /app/public ./public
COPY --from=build --chown=nextjs:nodejs /app/package.json ./package.json
COPY --from=build --chown=nextjs:nodejs /app/next.config.* ./

# Créer le répertoire .next/cache avec les bonnes permissions
RUN mkdir .next/cache
RUN chown -R nextjs:nodejs .next/cache

USER nextjs

EXPOSE 3000

ENV PORT=3000
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1

CMD ["npm", "start"]