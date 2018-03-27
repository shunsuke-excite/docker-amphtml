from node:9
RUN mkdir -p /app
WORKDIR /app
COPY ./amphtml/build-system build-system
COPY ./amphtml/package.json .
COPY ./amphtml/yarn.lock .
RUN yarn && \
    yarn global add gulp && \
    echo '127.0.0.1 ads.localhost iframe.localhost' >> /etc/hosts
