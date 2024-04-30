# Stage 1: Build the application
FROM node:16-alpine as build

# Set the working directory inside the container
WORKDIR /app/client

# Copy package.json and package-lock.json
COPY ./package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY ./ .

# Build the application
RUN npm run build

# Stage 2: Create the production image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app/client

# Copy the build artifacts from the previous stage
COPY --from=build /app/client/build ./build

# Start the application
CMD ["npx", "serve", "-s", "build"]