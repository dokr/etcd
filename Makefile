DISCOVERY_URL := "https://discovery.etcd.io/e61a77c7370b865d1d91ab698ac4c892"

ips :=	107.170.56.232 \
	107.170.56.212 \
	162.243.64.28

new-dis:
	curl -i -Ss 'https://discovery.etcd.io/new?size=3'

build:
	docker build -t etcd .

p1:
	docker run --rm -it \
 -p 2379:2379 \
 -p 2380:2380 \
 ckeyer/etcd etcd \
 --name p1 \
 --advertise-client-urls http://107.170.56.232:2379 \
 --listen-client-urls http://0.0.0.0:2379 \
 --initial-advertise-peer-urls http://107.170.56.232:2380 \
 --listen-peer-urls http://0.0.0.0:2380 \
 --discovery "https://discovery.etcd.io/b0e87260273d7f6167de4021e1448b06" \
 --data-dir /data

p2:
	docker run --rm -it \
 -p 2379:2379 \
 -p 2380:2380 \
 ckeyer/etcd etcd \
 --name p2 \
 --advertise-client-urls http://107.170.56.212:2379 \
 --listen-client-urls http://0.0.0.0:2379 \
 --initial-advertise-peer-urls http://107.170.56.212:2380 \
 --listen-peer-urls http://0.0.0.0:2380 \
 --discovery "https://discovery.etcd.io/b0e87260273d7f6167de4021e1448b06" \
 --data-dir /data

p3:
	docker run --rm -it \
 -p 2379:2379 \
 -p 2380:2380 \
 ckeyer/etcd etcd \
 --name p3 \
 --advertise-client-urls http://162.243.64.28:2379 \
 --listen-client-urls http://0.0.0.0:2379 \
 --initial-advertise-peer-urls http://162.243.64.28:2380 \
 --listen-peer-urls http://0.0.0.0:2380 \
 --discovery "https://discovery.etcd.io/b0e87260273d7f6167de4021e1448b06" \
 --data-dir /data
