#FROM node:12.15.0-alpine
FROM public.ecr.aws/bitnami/node:14-prod

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install npm packages
RUN npm install

# Bundle app source
COPY . .

# Build our app for production
RUN npm run build

EXPOSE 3000
CMD [ "npm", "run", "start:prod" ]
