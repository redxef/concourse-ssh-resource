FROM alpine

RUN apk --no-cache add bash openssh-client jq gettext \
 && adduser --no-create-home --uid 1000 -D user \
 && mkdir -p /opt/resource/
WORKDIR /opt/resource/
COPY src/ /opt/resource/
