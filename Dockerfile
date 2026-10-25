FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json ./
# Buat lockfile di dalam image agar build tetap deterministik meski lockfile
# lokal belum pernah berhasil dibuat karena registry host tidak tersedia.
RUN npm install --package-lock-only --omit=dev && npm ci --omit=dev

FROM node:20-alpine
WORKDIR /app
ENV NODE_ENV=production
COPY --from=deps /app/node_modules ./node_modules
COPY package.json ./
COPY src ./src
COPY public ./public
RUN addgroup -S appgroup && adduser -S appuser -G appgroup && chown -R appuser:appgroup /app
USER appuser
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 CMD wget -q -O /dev/null http://localhost:3000/api/health || exit 1
CMD ["node", "src/server.js"]
