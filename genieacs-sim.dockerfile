# GenieACS-SIM Dockerfile #
###########################

FROM node:10-alpine
LABEL maintainer="acsdesk@protonmail.com"

RUN apk update && apk upgrade && apk add git
WORKDIR /opt
RUN git clone https://github.com/zaidka/genieacs-sim.git
WORKDIR /opt/genieacs-sim
RUN npm install

CMD ["./genieacs-sim","-u","http://genieacs:7547/"]