# Use a specific version of Node.js Alpine as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json separately
# This allows Docker to cache dependencies when only package.json changes
COPY package.json package-lock.json ./ 

# Install npm dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the application
RUN npm run build

# Expose port 3000 to the outside world
EXPOSE 3000

# Command to start the application
CMD ["npm", "run", "start"]

