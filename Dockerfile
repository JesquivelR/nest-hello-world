FROM public.ecr.aws/docker/library/node:24
WORKDIR /usr/src/app
COPY package*.json ./

COPY tsconfig*.json ./
RUN npm install --quiet
COPY . .
RUN npm run build
CMD npm run start:dev