# syntax=docker/dockerfile:1
###########################
# GenieACS-SIM Dockerfile #
############################################################################
# docker buildx build --platform linux/amd64,linux/arm64 \                 #
#   -t drumsergio/genieacs-sim-container:version -t drumsergio/genieacs-sim-container:latest \ #
#   --push .                                                               #
############################################################################

FROM node:26-alpine
LABEL maintainer="acsdesk@protonmail.com"

RUN apk update && apk upgrade && apk add git
# The CA bundle must postdate the eMudhra distrust (20261020-r0); its own line, so a
# cached layer of the line above cannot keep the old bundle. Node's built-in roots
# still trust those intermediates, so verify against the system bundle instead.
RUN apk upgrade --no-cache ca-certificates-bundle
ENV NODE_OPTIONS=--use-openssl-ca

WORKDIR /opt
RUN git clone --depth 1 --single-branch \
      --branch "master" \
      https://github.com/zaidka/genieacs-sim.git

WORKDIR /opt/genieacs-sim
RUN npm install

CMD ["./genieacs-sim","-u","http://genieacs:7547/"]