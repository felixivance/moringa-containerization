# Use official Node.js image as the base image
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app/client

# Copy package.json and package-lock.json
COPY ./package*.json ./

# check node version
RUN node -v

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY ./ .

# Start the application
CMD ["npm", "start"]