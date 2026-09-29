# Usage

The simulator is upstream's [`genieacs-sim`](https://github.com/zaidka/genieacs-sim), cloned from its
`master` branch when the image is built. Its options:

| Option | Default in upstream | What it does |
|---|---|---|
| `-u, --acs-url <url>` | `http://127.0.0.1:7547/` | The ACS URL to contact. The image's command sets `http://genieacs:7547/`. |
| `-p, --processes <count>` | `1` | Number of devices to simulate, one process each. |
| `-w, --wait <ms>` | `1000` | Delay between starting one device and the next. |
| `-s, --serial <offset>` | `0` | Serial number offset. Devices get six-digit serials from the offset up: `000000`, `000001`... |
| `-m, --data-model <file>` | the bundled CSV | The data model template, a CSV or JSON file. |

`docker run --rm drumsergio/genieacs-sim-container:1.0.1 ./genieacs-sim --help` prints the same list.

## Simulate more devices

```bash
docker run -d --name genieacs-sim drumsergio/genieacs-sim-container:1.0.1 \
  ./genieacs-sim -u http://acs.example.com:7547/ -p 20 -s 1000
```

This starts 20 devices, serials `001000` to `001019`, one second apart. A device that exits is restarted
after 10 seconds.

## Use your own data model

The default template is a CSV export from a real CPE, bundled in upstream's repository. To simulate a
different device, mount your own CSV or JSON file and point `-m` at it:

```bash
docker run -d --name genieacs-sim -v "$PWD/my-model.csv:/models/my-model.csv:ro" \
  drumsergio/genieacs-sim-container:1.0.1 \
  ./genieacs-sim -u http://acs.example.com:7547/ -m /models/my-model.csv
```

The CSV needs the columns `Parameter`, `Object`, `Writable`, `Value` and `Value type`, the format of
upstream's bundled file.
