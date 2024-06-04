# Use official Node.js image as the base image
FROM --platform=arm64 node:14-alpine

# Set the working directory inside the container
WORKDIR /app/backend

# Copy package.json and package-lock.json
COPY ./package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY ./ .

# Start the application
CMD ["npm", "start"]