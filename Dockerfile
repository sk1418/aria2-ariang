FROM arm32v7/alpine

MAINTAINER Kai Yuan <kent.yuan@gmail.com>

ENV UID=0 GID=0

RUN apk -U upgrade \
	&& apk add --no-cache --update aria2 darkhttpd \
	&& mkdir -p aria2/conf aria2/conf-temp aria2/downloads aria-ng \
	&& export ng_ver=$(wget --no-check-certificate -q -O - "https://api.github.com/repos/mayswind/AriaNg/releases/latest" | sed '/"tag_name":/!d;s/[^0-9]*\([0-9][^"]*\)".*/\1/') \
	&& wget -q --no-check-certificate -O ui.zip "https://github.com/mayswind/AriaNg/releases/download/$ng_ver/AriaNg-$ng_ver.zip"  \
	&& unzip "ui.zip" -d /aria-ng \
	&& rm -rf "ui.zip" 

COPY init.sh /aria2/init.sh
COPY conf-temp /aria2/conf-temp

WORKDIR /
VOLUME ["/aria2/conf", "/aria2/downloads"]
EXPOSE 6800 80 8080

CMD ["/aria2/init.sh"]
