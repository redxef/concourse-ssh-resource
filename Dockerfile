FROM alpine:latest

RUN apk --no-cache add openssh-client jq \
 && adduser --no-create-home --uid 1000 -D user \
 && mkdir -p /opt/resource/
USER 1000:1000
WORKDIR /tmp/
COPY check in out /opt/resource/
