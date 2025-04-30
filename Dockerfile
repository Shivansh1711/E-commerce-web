# Step 1: Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy package.json and package-lock.json into the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the source code into the working directory
COPY . .

# Step 6: Build the React app for production
RUN npm run build

# Step 7: Install serve to serve the built app
RUN npm install -g serve

# Step 8: Expose the port that the app will run on
EXPOSE 3000

# Step 9: Command to run the app
CMD ["serve", "-s", "build", "-l", "3000"]
