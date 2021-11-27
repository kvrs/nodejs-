# nodejs base image 
FROM node:16 
# create app directory 
RUN mkdir -p /var/www/app

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

COPY package*.json ./

RUN npm install 

# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source( So if you set: WORKDIR /tmp and do COPY . . It will copy everything in the current folder, to /tmp)
COPY . .

# Your app binds to port 8080 so you'll use the EXPOSE instruction to have it mapped by the docker daemon:
EXPOSE 8080

#Last but not least, define the command to run your app using CMD which defines your runtime. Here we will use node server.js to start your server:

CMD ["node","server.js"]

