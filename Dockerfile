FROM quay.io/ibmgaragecloud/node:lts-stretch  as build
WORKDIR /app
COPY . .
RUN npm install

FROM quay.io/upslopeio/nginx-unprivileged
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf