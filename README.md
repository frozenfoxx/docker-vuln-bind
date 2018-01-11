# docker-vuln-bind
A vulnerable Docker container for Bind.

Docker Hub: [https://hub.docker.com/r/frozenfoxx/docker-vuln-bind/](https://hub.docker.com/r/frozenfoxx/docker-vuln-bind/)

# How to Build
```
git clone git@github.com:frozenfoxx/docker-vuln-bind.git
cd docker-vuln-bind
docker build .
```

# How to Use this Image
## Quickstart
The following will run the latest vulnerable Bind server with all vulnerabilities loaded.

```
docker run -d --rm -p 53:53 --name=bind_server frozenfoxx/docker-vuln-bind:latest
```

## Individual Vulnerabilities
Most of the time you'll want to experiment with a given vulnerability or combination thereof. These are stored in the various tags, loading the `reversetransfer` vulnerable tag for instance can be done like this:

```
docker run -it --rm -p 53:53 --name=bind_server frozenfoxx/docker-vuln-bind:reversetransfer
```

# Configuration
Custom configurations for bind can be loaded by overriding the config files themselves. The default structure is included under the `conf` directory, simply edit a file and load it in place of the old.
