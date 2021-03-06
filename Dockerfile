# base image
FROM node:9.6.1

# add `/usr/node_modules/.bin` to $PATH
ENV PATH /usr/node_modules/.bin:$PATH

# install and cache app dependencies
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent

# start app
CMD ["npm", "start"]