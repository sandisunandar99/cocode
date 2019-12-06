FROM node

ENV HOME=/app
RUN mkdir /app

COPY package.json $HOME

WORKDIR $HOME

RUN npm install && npm i -g @adonisjs/cli

EXPOSE 3330

CMD ["npm", "start"]