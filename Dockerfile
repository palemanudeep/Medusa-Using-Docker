FROM node:hydrogen-alpine3.20

ENV NODE_ENV=development

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker's caching
COPY package.json ./ 

# Install dependencies and Medusa CLI globally
RUN npm install && npm install -g @medusajs/medusa-cli@latest

# Copy the rest of the application code with proper ownership for the 'node' user
COPY  . .

# Expose the port the application will run on
EXPOSE 7001
EXPOSE 9000
