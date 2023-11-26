# # Step 1: Build the application
# FROM node:16 as build-stage
# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm install
# COPY certs/ca.pem /usr/local/share/ca-certificates/ca.crt
# RUN update-ca-certificates
# COPY . ./
# RUN npm run build

# # Step 2: Serve the application from Nginx
# # FROM nginx:alpine
# # COPY --from=build-stage /app/dist /usr/share/nginx/html
# # EXPOSE 3000
# # CMD ["nginx", "-g", "daemon off;"]


# Step 1: Base Image
FROM node:latest

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy package files
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy source code
COPY . .

# Step 6: Build the app
RUN npm run build

# Step 7: Install 'serve' and serve the app
RUN npm install -g serve
CMD ["serve", "-s", "dist", "-p", "2000"]

