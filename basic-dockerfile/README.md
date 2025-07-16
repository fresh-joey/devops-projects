# Basic Dockerfile

Build a basic Dockerfile to create a Docker image.

## Requirements

- The Dockerfile should be named Dockerfile.
- The Dockerfile should be in the root directory of the project.
- The base image should be alpine:latest.
- The Dockerfile should contain a single instruction to print “Hello, Captain!” to the console before exiting.

## Prerequisites

- A linux or windows device (preferably linux)
- Ensure Docker is installed on the device

## Steps

- Create a new file named Dockerfile

```console
touch Dockerfile
```

- Enter the content below into the Dockerfile

```ini
FROM alpine:latest

CMD [ "echo", "Hello, Captain!" ]
```

- Build an image from the Dockerfile named "hello"

```console
docker build -t hello .
```

- Verify that the image exists

```console
docker images
```

- Run a container from the image

```console
docker run hello:latest
```

- You can add a name to the container with `--name` flag after `docker run`
- The container should display the content of the Dockerfile on the terminal
