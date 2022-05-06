FROM alpine:latest

RUN apk --no-cache add bash openssh-client jq \
 && adduser --no-create-home --uid 1000 -D user \
 && mkdir -p /opt/resource/
USER 1000:1000
WORKDIR /opt/resource/
COPY common check in out /opt/resource/
