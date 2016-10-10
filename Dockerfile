FROM mhart/alpine-node:6.3.0

MAINTAINER ContainerShip Developers <developers@containership.io>

# install required packages
RUN apk --update add build-base git python-dev ruby-dev ruby-irb ruby-bundler ruby-rdoc ca-certificates libffi-dev && gem install ohai

# create /app and add files
WORKDIR /app
ADD . /app

# set default NODE_ENV=development
ENV NODE_ENV development

# install dependencies
RUN npm install

# expose ports
EXPOSE 2666
EXPOSE 2777
EXPOSE 8080

# specify volumes
VOLUME /var/run/docker.sock
VOLUME /var/log/containership
VOLUME /root/.containership
VOLUME /opt/containership

# set entrypoint
ENTRYPOINT ["node", "index.js"]
