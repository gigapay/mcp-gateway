FROM node:23-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm install

# Copy the rest of the application files (optional if you'd like to build/run an application)
COPY . .

# Command to keep the container running
CMD ["npm", "start"]
