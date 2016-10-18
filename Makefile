DISCOVERY_URL := "https://discovery.etcd.io/e61a77c7370b865d1d91ab698ac4c892"

new-dis:
	curl -i -Ss 'https://discovery.etcd.io/new?size=3'

build:
	docker build -t etcd .

ips:
	echo "107.170.56.232"
	echo "107.170.56.212"
	echo "162.243.64.28"

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
 --discovery "https://discovery.etcd.io/597d528704e34c2c3e3f5636287e4215" \
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
 --discovery "https://discovery.etcd.io/597d528704e34c2c3e3f5636287e4215" \
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
 --discovery "https://discovery.etcd.io/597d528704e34c2c3e3f5636287e4215" \
 --data-dir /data

curl "http://107.170.56.232:2379/"