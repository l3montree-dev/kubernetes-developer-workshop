FROM node:22.14.0-alpine3.21

COPY . .

RUN npm install

RUN npm run build

CMD ["npm", "start"]