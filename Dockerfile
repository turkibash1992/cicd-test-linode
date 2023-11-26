# Step 1: Build the application
FROM node:16 as build-stage
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
# COPY certs/ca.pem /usr/local/share/ca-certificates/ca.crt
# RUN update-ca-certificates
COPY . ./
RUN npm run build

# Step 2: Serve the application from Nginx
# FROM nginx:alpine
# COPY --from=build-stage /app/dist /usr/share/nginx/html
# EXPOSE 3000
# CMD ["nginx", "-g", "daemon off;"]
