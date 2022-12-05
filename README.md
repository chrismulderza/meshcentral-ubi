# Meshcentral on UBI9

## Mesh Central Container

### Deploying

- Pull the container from [quay.io](https://quay.io) 

```bash
podman pull quay.io/rh_ee_cmulder/meshcentral-ubi
```

### Building


```bash
podman run -it --publish 8443:8443 --publish 8080:8080 --publish 4433:4433 \
  --volume ./data:/opt/meshcentral/meshcentral-data:Z,U \
  --name meshcentral \
  --env HOST_FQDN=meshcentral.example.com \
  meshcentral-ubi:latest
```
