FROM node:18-bullseye
WORKDIR /app

RUN corepack enable && corepack prepare yarn@1.22.22 --activate

ARG NEXT_PUBLIC_SITE_URL
ENV NEXT_PUBLIC_SITE_URL=$NEXT_PUBLIC_SITE_URL

# Copy package manifests
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile --production

# Copy built app (from CI build step)
COPY apps/web ./apps/web
COPY packages ./packages
COPY .next ./.next

ENV NODE_ENV=production
EXPOSE 3000

CMD ["yarn", "workspace", "web", "start"]
