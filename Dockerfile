FROM node:18-bullseye AS runner
WORKDIR /app
RUN corepack enable && corepack prepare yarn@1.22.22 --activate

# Copy only what’s needed from CircleCI build artifacts
COPY package.json yarn.lock ./
COPY apps/web ./apps/web
COPY packages ./packages
COPY .next ./.next
COPY node_modules ./node_modules

ENV NODE_ENV=production
EXPOSE 3000

CMD ["yarn", "workspace", "web", "start"]
