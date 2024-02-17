# Stage 1: Build and test the Angular application
FROM node:18-alpine3.16 as builder

WORKDIR /app

COPY my-spa-uwu/package*.json ./

RUN npm install

# Stage 2: Create a smaller image for running the application
FROM gcr.io/distroless/nodejs18-debian11:nonroot

# Copy the built Angular app from the builder stage
COPY --from=builder /app /app

WORKDIR /app

CMD ["app.js"]
