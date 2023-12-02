# Use an official Node.js runtime as a parent image
FROM node:18-alpine3.17

# Set the working directory in the container
WORKDIR /home/node/app

# Environment variables
ENV PORT=80

# Copy package.json and package-lock.json to the working directory
COPY package.json yarn.lock ./

# Install the application dependencies
RUN corepack enable && yarn

# Copy the application code to the container
COPY . .

# Build the application
RUN yarn run build

# Expose the port that your app is running on
EXPOSE 80

# Command to start your application
CMD ["yarn", "run", "start"]
