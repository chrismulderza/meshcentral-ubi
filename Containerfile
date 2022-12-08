MAINTAINER Chris Mulder <cmulder@bitbuild.io>
FROM registry.access.redhat.com/ubi7/ubi-minimal


# Set the nodejs version
ENV NODEJS_VERSION=14

# Install 
RUN microdnf -y install rh-nodejs${NODEJS_VERSION} shadow-utils && microdnf -y clean all
RUN groupadd -r -g 1001 meshcentral \
  && useradd -r -u 1001 -g meshcentral -m -d /opt/meshcentral -s /bin/bash meshcentral

ENV PATH $PATH:/opt/rh/rh-nodejs14/root/usr/bin
RUN mkdir -p /opt/meshcentral
VOLUME /opt/meshcentral/meshcentral-data
VOLUME /opt/meshcentral/meshcentral-files

RUN cd /opt/meshcentral \
 && npm install meshcentral \
 && echo -n "Meshcentral version: " && npm info meshcentral version

RUN cd /opt/meshcentral \
 && node node_modules/meshcentral --createaccount admin --pass admin --name Admin \
 && node node_modules/meshcentral --adminaccount admin

RUN chown -R meshcentral /opt/meshcentral
ENV NODE_ENV production
ENV HTTPS_PORT 8443
ENV HTTP_PORT 8080
ENV HOST_FQDN meshcentral.example.com
EXPOSE 4433
EXPOSE 8443
EXPOSE 8080

WORKDIR /opt/meshcentral
CMD /opt/rh/rh-nodejs14/root/usr/bin/node node_modules/meshcentral --cert ${HOST_FQDN} --port ${HTTPS_PORT} --redirport ${HTTP_PORT}
