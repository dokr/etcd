FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update wget tar ca-certificates

EXPOSE 2379 2380

RUN cd /tmp && \
	wget --no-check-certificate 'https://github.com/coreos/etcd/releases/download/v3.1.0-rc.0/etcd-v3.1.0-rc.0-linux-amd64.tar.gz' && \
	tar zxf etcd-v3.1.0-rc.0-linux-amd64.tar.gz && \
	cd /tmp/etcd-v3.1.0-rc.0-linux-amd64 && \
	cp etcd /usr/bin && \
	cp etcdctl /usr/bin && \
	rm -rf /tmp/*

CMD ["/usr/bin/etcd"]