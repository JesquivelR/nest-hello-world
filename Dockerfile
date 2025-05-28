# Etapa de construcción
FROM public.ecr.aws/docker/library/node:18 AS build

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY . .
RUN npm run build

# Etapa de producción
FROM public.ecr.aws/docker/library/node:18-alpine

WORKDIR /usr/src/app
COPY --from=build /usr/src/app .
CMD ["npm", "run", "start:prod"]
