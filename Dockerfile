FROM debian:12.5-slim

LABEL maintainer="nonk123 <me@nonk.dev>"
LABEL name="docker-tor-bridges"
LABEL version="latest"

RUN \
	apt update && apt upgrade -y && \
	apt install -y tor obfs4proxy curl && \
	chmod 700 /var/lib/tor && \
	tor --version

HEALTHCHECK --timeout=10s --start-period=60s \
	CMD curl --fail --socks5-hostname localhost:9150 -I -L 'https://www.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion/' || exit 1

EXPOSE 9050/tcp

CMD ["/usr/bin/tor", "-f", "/torrc"]
