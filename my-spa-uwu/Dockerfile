# Stage 1: Build and test the Angular application
FROM node:18-alpine3.16 as dependencies

WORKDIR /app

COPY application/package.json application/package-lock.json ./
RUN npm install


# Stage 2: Run additional tests or perform other tasks if needed
FROM dependencies as builder

COPY ./application .
RUN sed -i "s|<API_URL>|http://my-api-uwu.detectionserver.site:8080|g" src/app/app.component.ts
RUN npm run build --prod

# Stage 3: Create a smaller image for running the application
FROM nginx:alpine

# Copy the built Angular app from the builder stage
COPY --from=builder /app/dist/application/browser /usr/share/nginx/html

# Remove the default Nginx configuration and replace with custom configuration
RUN rm -rf /etc/nginx/conf.d
COPY application/nginx.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
