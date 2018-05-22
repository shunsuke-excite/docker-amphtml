from node:9
RUN mkdir -p /app
WORKDIR /app
COPY ./amphtml/build-system build-system
COPY ./amphtml/package.json .
COPY ./amphtml/yarn.lock .
RUN yarn && \
    yarn global add gulp && \
    echo '127.0.0.1 ads.localhost iframe.localhost' >> /etc/hosts
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer
