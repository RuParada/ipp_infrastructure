FROM node:18-alpine
WORKDIR /app
COPY ../ipp/ .
RUN npm install && npm run build
CMD ["npm", "run", "serve"]
