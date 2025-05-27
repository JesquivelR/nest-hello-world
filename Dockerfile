FROM node
WORKDIR /usr/src/app
COPY package*.json ./

COPY tsconfig*.json ./
RUN npm install --quiet
COPY . .
RUN npm run build
CMD npm run start:dev
