# syntax=docker/dockerfile:1
###########################
# GenieACS-SIM Dockerfile #
############################################################################
# docker buildx build --platform linux/amd64,linux/arm64 \                 #
#   -t drumsergio/genieacs-sim:version -t drumsergio/genieacs-sim:latest \ #
#   --push .                                                               #
############################################################################

FROM node:25-alpine
LABEL maintainer="acsdesk@protonmail.com"

RUN apk update && apk upgrade && apk add git

WORKDIR /opt
RUN git clone --depth 1 --single-branch \
      --branch "master" \
      https://github.com/zaidka/genieacs-sim.git

WORKDIR /opt/genieacs-sim
RUN npm install

CMD ["./genieacs-sim","-u","http://genieacs:7547/"]