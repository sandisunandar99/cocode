FROM node

ENV HOME=/app
RUN mkdir /app

RUN apt-get update

COPY package.json $HOME

WORKDIR $HOME

RUN npm install && npm i -g @adonisjs/cli && npm install -g nodemon

EXPOSE 3330

# CMD ["npm", "start"]

CMD [ "nodemon", "server.js" ]

