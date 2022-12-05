# Meshcentral on UBI9

[![Docker Repository on Quay](https://quay.io/repository/rh_ee_cmulder/meshcentral-ubi/status "Docker Repository on Quay")](https://quay.io/repository/rh_ee_cmulder/meshcentral-ubi)

## Mesh Central container build

My personal container build of the open source projects focused on remote management of devices, in particular
for managing Intel(R) AMT devices. Used as part of my home lab build.

### Deploying

- Pull the container from [quay.io](https://quay.io) 

```bash
podman pull quay.io/rh_ee_cmulder/meshcentral-ubi
```

### Building


### Running 

- an example of runnning the container on Fedora using Podman: 

```bash
podman run -it --publish 8443:8443 --publish 8080:8080 --publish 4433:4433 \
  --volume ./data:/opt/meshcentral/meshcentral-data:Z,U \
  --name meshcentral \
  --env HOST_FQDN=meshcentral.example.com \
  meshcentral-ubi:latest
```
