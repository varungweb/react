# --- Stage 1: Build React/Vite App ---
FROM node:20.18.3-alpine AS builder

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

# --- Stage 2: Serve with Nginx ---
FROM nginx:stable-alpine AS production

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy React build from previous stage
COPY --from=builder /app/dist /usr/share/nginx/html

# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
