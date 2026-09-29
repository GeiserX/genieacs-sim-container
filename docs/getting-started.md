# Getting started

The image is `drumsergio/genieacs-sim-container` on Docker Hub, for amd64 and arm64. It needs a running
ACS to talk to; nothing else.

## With genieacs-container

[genieacs-container](https://github.com/GeiserX/genieacs-container)'s `docker-compose.yml` already has the
simulator as the `genieacs-sim` service behind the `testing` profile, on the same network as the
`genieacs` service:

```bash
curl -fsSLO https://raw.githubusercontent.com/GeiserX/genieacs-container/main/docker-compose.yml
docker compose --profile testing up -d
```

The simulator waits for GenieACS to report healthy, then starts. What working looks like:

- `docker logs genieacs-sim` prints `Simulator 000000 started`.
- The GenieACS UI at http://localhost:3000 lists one device under Devices, serial number `000000`,
  after its first inform.

Stop it with `docker compose --profile testing down`; add `-v` to delete the MongoDB data too.

## On its own, against any ACS

The image's command is `./genieacs-sim -u http://genieacs:7547/`. There is no entrypoint, so to change
the target you pass the whole command after the image name:

```bash
docker run -d --name genieacs-sim drumsergio/genieacs-sim-container:1.0.1 \
  ./genieacs-sim -u http://acs.example.com:7547/
```

Use the CWMP URL of your ACS: port 7547 on GenieACS. If the ACS runs in Docker on the same host, put the
simulator on its network with `--network <network>` and use the service name as the host.

The simulator's options are on [Usage](usage.md).
