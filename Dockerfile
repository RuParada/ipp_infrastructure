FROM node:18-alpine
RUN apk add --no-cache python3 make g++ bash
RUN yarn global add gatsby-cli

WORKDIR /app

COPY ./ipp ./
COPY ./ipp/node_modules ./node_modules

RUN yarn build

EXPOSE 9000
CMD ["gatsby", "serve", "-H", "0.0.0.0", "-p", "9000"]
