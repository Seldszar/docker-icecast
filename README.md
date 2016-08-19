# Icecast

[![dockeri.co](http://dockeri.co/image/seldszar/icecast)](https://registry.hub.docker.com/seldszar/icecast/)

[![GitHub issues](https://img.shields.io/github/issues/seldszar/docker-icecast.svg "GitHub issues")](https://github.com/seldszar/docker-icecast) [![GitHub stars](https://img.shields.io/github/stars/seldszar/docker-icecast.svg "GitHub stars")](https://github.com/seldszar/docker-icecast)

Another Icecast Docker image, with some bonuses.

## Usage

### How to use this image

Create a `Dockerfile` in your Icecast project

```dockerfile
FROM seldszar/icecast:onbuild

# replace this with your application's default port
EXPOSE 8000
```

You can then build and run the Docker image:

```console
$ docker build -t my-icecast-app .
$ docker run -it --rm --name my-running-app my-icecast-app
```
