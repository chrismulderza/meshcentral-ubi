# Meshcentral on UBI7

[![Docker Repository on Quay](https://quay.io/repository/rh_ee_cmulder/meshcentral-ubi/status "Docker Repository on Quay")](https://quay.io/repository/rh_ee_cmulder/meshcentral-ubi)

## Mesh Central container build

This branch tries to build Mesh Central on UBI7 and NodeJS14 in order to support running the container
on older hardware that does not support the x86-64-v2 ABI.

My personal container build of the open source projects focused on remote management of devices, in particular
for managing Intel(R) AMT devices. Used as part of my home lab build.

### Deploying

- Pull the container from [quay.io](https://quay.io) 

```bash
podman pull quay.io/rh_ee_cmulder/meshcentral-ubi:ubi7
```

### Building

- Use a regular `podman build` to build this image

```bash
podman build -t meshcentral-ubi:ubi7 -f Containerfile
```

- Push the image to Quay.io

```bash
podman push meshcentral-ubi:ubi7 quay.io/rh_ee_cmulder/meshcentral-ubi:ubi7
```


### Running 

- an example of runnning the container on Fedora using Podman: 

```bash
podman run -it --publish 8443:8443 --publish 8080:8080 --publish 4433:4433 \
  --volume ./data:/opt/meshcentral/meshcentral-data:Z,U \
  --name meshcentral \
  --env HOST_FQDN=meshcentral.example.com \
  meshcentral-ubi:ubi7
```
