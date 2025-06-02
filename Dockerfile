FROM node:18-slim
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    bash \
    && rm -rf /var/lib/apt/lists/*
RUN yarn global add gatsby-cli

WORKDIR /app
COPY ./ipp/package.json ./ipp/yarn.lock ./
COPY ./ipp/node_modules ./node_modules
COPY ./ipp ./
RUN yarn build

EXPOSE 9000
CMD ["gatsby", "serve", "-H", "0.0.0.0", "-p", "9000"]
