FROM alpine:latest

MAINTAINER Kai Yuan <kent.yuan@gmail.com>
ENV UID=33 GID=33 
RUN apk -U upgrade \
	&& apk add --no-cache --update su-exec aria2 darkhttpd \
	&& mkdir -p aria2/conf aria2/conf-temp aria2/downloads aria-ng 

COPY init.sh /aria2/init.sh
COPY conf-temp /aria2/conf-temp

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80 8080

CMD ["/aria2/init.sh"]
