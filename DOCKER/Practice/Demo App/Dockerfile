
# Starts with a Node.js 14 base image.
FROM node:14
# Sets up a working folder in the container.
WORKDIR /app
# Brings your dependency list into the container.
COPY package.json /app
# Installs the dependencies listed in package.json.
RUN npm install
# We will now copy over all our source code into our container.
COPY . /app
# Tells Docker your app will listen on port 80 (this is just a placeholder, not a requirement).
EXPOSE 80 
# Runs your app when the container starts.
CMD [ "npm", "start" ]