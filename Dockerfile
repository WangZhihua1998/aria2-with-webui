FROM multiarch/alpine:armhf-edge

MAINTAINER WangZhihua <1069155322wzh@gmail.com>

RUN apk update && \
	apk add --no-cache --update bash && \
	mkdir -p /conf && \
	mkdir -p /conf-copy && \
	mkdir -p /data && \
	apk add --no-cache --update aria2 && \
	apk add --no-cache git && \
	git clone https://github.com/ziahamza/webui-aria2 /aria2-webui && \
	rm /aria2-webui/.git* -rf && \
	apk del git && \
	apk add --no-cache --update darkhttpd && \
	apk add --no-cache tzdata && \
	cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo 'Asia/Shanghai' >/etc/timezone && \
	apk del tzdata
	
ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-complete.sh /conf-copy/on-complete.sh

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/data"]
VOLUME ["/conf"]
EXPOSE 6800
EXPOSE 80
EXPOSE 8080

CMD ["/conf-copy/start.sh"]
