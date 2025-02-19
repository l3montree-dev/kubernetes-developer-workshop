# Architecture Overview


## Building the Docker-Images

```bash
docker build -t ghcr.io/l3montree-dev/kubernetes-developer-workshop/color-api:latest color-api
```


```bash
docker build -t ghcr.io/l3montree-dev/kubernetes-developer-workshop/nextjs-frontend:latest nextjs-frontend
```

## Pushing the Docker-Images

```bash
docker push ghcr.io/l3montree-dev/kubernetes-developer-workshop/color-api:latest
```

```bash
docker push ghcr.io/l3montree-dev/kubernetes-developer-workshop/nextjs-frontend:latest
```