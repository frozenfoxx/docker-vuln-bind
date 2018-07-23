# docker-vuln-bind
A vulnerable Docker container for Bind.

Docker Hub: [https://hub.docker.com/r/frozenfoxx/vuln-bind/](https://hub.docker.com/r/frozenfoxx/vuln-bind/)

# How to Build
```
git clone git@gitlab.com:frozenfoxx/docker-vuln-bind.git
cd docker-vuln-bind
docker build .
```

# How to Use this Image
## Quickstart
The following will run the latest vulnerable Bind server with a default configuration.

```
docker run -d --rm -p 53:53 --name=bind_server frozenfoxx/vuln-bind:latest
```

## Individual Vulnerabilities
Most of the time you'll want to experiment with a given vulnerability or combination thereof. These are stored in the various tags, loading the `allowtransfer` vulnerable tag for instance can be done like this:

```
docker run -it --rm -p 53:53 --name=bind_server -e CONFIG=allowtransfer frozenfoxx/vuln-bind:latest
```

# Configuration
To create a new custom configuration perform the following:
* create a new directory under `configs/`
* load configuration files under the new directory
* `docker build . -t frozenfoxx/docker-vuln-bind:custom`
* `docker run -it --rm -p 53:53 --name=custom_server -e CONFIG=custom_config_dir frozenfoxx/vuln-bind:custom`

# Available Configs
Used with `-e CONFIG=[name]`:
* `allowtransfer`: allows zone transfers.
* `default`: standard configuration (default).
