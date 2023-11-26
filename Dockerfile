# # Step 1: Build the application
# FROM node:16 as build-stage
# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm install
# COPY certs/ca.pem /usr/local/share/ca-certificates/ca.crt
# RUN update-ca-certificates
# COPY . ./
# RUN npm run build

# Use an official Node runtime as a parent image
FROM node:16 as build-stage
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . ./
EXPOSE 3000
CMD ["node", "app.js"]

# # Step 2: Serve the application from Nginx
# FROM nginx:alpine
# COPY --from=build-stage /app/dist /usr/share/nginx/html
# EXPOSE 9000
# CMD ["nginx", "-g", "daemon off;"]
