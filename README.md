<p align="center">
  <img src="https://raw.githubusercontent.com/GeiserX/genieacs-sim-container/main/docs/images/banner.svg" alt="genieacs-sim-container" width="900"/>
</p>

<h1 align="center">genieacs-sim-container</h1>

<p align="center">
  <a href="https://github.com/GeiserX/genieacs-sim-container/releases"><img src="https://img.shields.io/github/v/release/GeiserX/genieacs-sim-container" alt="Release"></a>
  <a href="https://github.com/GeiserX/genieacs-sim-container/blob/main/LICENSE"><img src="https://img.shields.io/github/license/GeiserX/genieacs-sim-container" alt="License"></a>
  <a href="https://hub.docker.com/r/drumsergio/genieacs-sim-container"><img src="https://img.shields.io/docker/pulls/drumsergio/genieacs-sim-container" alt="Docker Pulls"></a>
</p>

A Docker image of the [GenieACS simulator](https://github.com/zaidka/genieacs-sim): fake TR-069 CPE devices that connect to an ACS, so you can test a GenieACS deployment without hardware.

## Features

- Runs the upstream GenieACS simulator (`genieacs-sim`) against any ACS you point it at.
- Default target `http://genieacs:7547/`, the CWMP port of the `genieacs` service in [genieacs-container](https://github.com/GeiserX/genieacs-container).
- Simulates one device by default, or as many as you ask for with `-p`.
- Multi-arch image for amd64 and arm64.
- Ships as the `--profile testing` service of genieacs-container's Compose stack.

## Quick start

With the genieacs-container Compose stack, the simulator is one profile away:

```bash
curl -fsSLO https://raw.githubusercontent.com/GeiserX/genieacs-container/main/docker-compose.yml
docker compose --profile testing up -d
```

Open http://localhost:3000 and the simulated device appears under Devices after its first inform. To run it against another ACS, and for the simulator's options, see [Getting started](https://github.com/GeiserX/genieacs-sim-container/blob/main/docs/getting-started.md).

## Documentation

- [Getting started](https://github.com/GeiserX/genieacs-sim-container/blob/main/docs/getting-started.md): with genieacs-container, or on its own against any ACS
- [Usage](https://github.com/GeiserX/genieacs-sim-container/blob/main/docs/usage.md): the simulator's options, more devices, another data model

## Related projects

Part of the GenieACS family: [genieacs-container](https://github.com/GeiserX/genieacs-container), [genieacs-ansible](https://github.com/GeiserX/genieacs-ansible), [genieacs-mcp](https://github.com/GeiserX/genieacs-mcp), [genieacs-ha](https://github.com/GeiserX/genieacs-ha), [genieacs-services](https://github.com/GeiserX/genieacs-services). The full list is in [genieacs-container's related projects](https://github.com/GeiserX/genieacs-container/blob/main/docs/related.md).

## License

[GPL-3.0-or-later](https://github.com/GeiserX/genieacs-sim-container/blob/main/LICENSE)
