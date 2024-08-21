# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /nodejs-jenkins

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies (if any)
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port the app will run on
EXPOSE 3000

# Command to run the application
CMD [ "node", "app.js" ]
