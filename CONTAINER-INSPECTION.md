# Kubernetes Workshop for Developers

## Inspecting Docker-Images. Just a fancy Tar-Archive

1. Have a look at the example spring boot application in the [color-api](color-api) directory. It is super exiting since it provides an endpoint which returns a random hex color.

2. Have a look at the [Dockerfile](color-api/Dockerfile)
3. Build the Container-File with the following command:
```bash
docker build -t spring-boot-demo:latest color-api
```

4. Run the Container with the following command:
```bash
docker run -p 8080:8080 spring-boot-demo:latest
```

Have a look at ```http://localhost:8080/color``` - it should return a random hex color.

5. Lets inspect the image - actually it is a tarball we just call a fancy name:
```bash
docker save spring-boot-demo:latest -o spring-boot-demo.tar
```

6. Run the inspect_layers shell script
   - It extracts the tar archive into the [extracted_image](extracted_image) folder
   - It extracts each layer tar archive in the [extracted_image/blobs](extracted_image/blobs) folder into the [layers](layers) folder
   - It merges the layers into a single file system in the [merged_layers](merged_layers) folder - it just copies all files and says "replace" when there is a conflict (the script does have a look at the order which is defined in [extracted_image/manifest.json](extracted_image/manifest.json))

7. Have a look at the [merged_layers](merged_layers) folder - it is the file system of the container image

### Understanding Multi-Stage Builds

8. Modify the docker file and follow the instructions inside the comment. This makes it a multi-stage build. Lets build again and inspect the image again.