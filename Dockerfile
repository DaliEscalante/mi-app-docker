# Usa Node que ya trae Corepack
FROM node:20

WORKDIR /usr/src/app

# Copiamos manifiestos primero para aprovechar cache
COPY package.json yarn.lock .yarnrc.yml ./

# Activa Corepack y prepara Yarn 4.x (según tu packageManager)
RUN corepack enable && corepack prepare yarn@4.9.2 --activate

# Instala dependencias
RUN yarn install --immutable

# Copia el resto del código
COPY . .

EXPOSE 3000
CMD ["yarn", "start"]
