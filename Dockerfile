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
# Node's built-in roots still trust the compromised eMudhra intermediates; verify
# against the system bundle that `apk upgrade` just patched (20261020-r0 or newer).
ENV NODE_OPTIONS=--use-openssl-ca

WORKDIR /opt
RUN git clone --depth 1 --single-branch \
      --branch "master" \
      https://github.com/zaidka/genieacs-sim.git

WORKDIR /opt/genieacs-sim
RUN npm install

CMD ["./genieacs-sim","-u","http://genieacs:7547/"]