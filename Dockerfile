FROM node:carbon


# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

RUN yarn install

CMD [ "yarn", "yarn start:prod" ]
EXPOSE 3000 

RUN yarn lint
RUN yarn format:check
RUN yarn test 
RUN yarn test:cov
RUN yarn test:e2e
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .


