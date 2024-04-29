# Use official Node.js image as the base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app/backend

# Copy package.json and package-lock.json
COPY ./backend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY ./backend .

# Start the application
CMD ["npm", "start"]