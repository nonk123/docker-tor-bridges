# docker-tor-bridges

A simple Docker image for running a Tor proxy for your containers. Supports obfs4 bridges too!

## Usage

Mount your torrc to `/torrc` inside the container. If needed, the `obfs4proxy` executable is located in `/usr/bin/obfs4proxy` by default.

Example torrc:

```conf
Log notice stdout
SOCKSPort 0.0.0.0:9050
BridgeRelay 0

UseBridges 1
ClientTransportPlugin obfs4 exec /usr/bin/obfs4proxy managed

Bridge obfs4 <your-bridge-here>
Bridge obfs4 <your-bridge-here>
```

Example docker-compose.yml:

```yaml
version: "3.8"

services:
  proxy:
    image: nonker/docker-tor-bridges:latest
    restart: always
    volumes:
      - /path/to/torrc:/torrc
```

## Acknowledgements

- PeterDaveHello's [tor-socks-proxy](https://github.com/PeterDaveHello/tor-socks-proxy) for giving me an idea where to get started.
- Docker for being awesome!
