# Icecast

[![dockeri.co](http://dockeri.co/image/seldszar/icecast)](https://hub.docker.com/r/seldszar/icecast/)

[![GitHub issues](https://img.shields.io/github/issues/seldszar/docker-icecast.svg "GitHub issues")](https://github.com/seldszar/docker-icecast) [![GitHub stars](https://img.shields.io/github/stars/seldszar/docker-icecast.svg "GitHub stars")](https://github.com/seldszar/docker-icecast)

Another Icecast Docker image, with some bonuses.

## Supported tags and respective `Dockerfile` links

 - [`2.4.3`, `2.4`, `2`, `latest` (2.4/Dockerfile)](https://github.com/Seldszar/docker-icecast/blob/master/2.4/Dockerfile)
 - [`onbuild-2.4.3`, `onbuild-2.4`, `onbuild-2`, `onbuild` (2.4/onbuild//Dockerfile)](https://github.com/Seldszar/docker-icecast/blob/master/2.4/onbuild/Dockerfile)

## How to use this image

### Create a `Dockerfile` in your Icecast project

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

#### Notes

 - The image assumes that your application has a file names `icecast.xml` to run your Icecast instance.

### Run the Icecast Docker image

If you don't need to build a custom container, you can just run Icecast and copy your configuration file directly.

```console
$ docker run -it --rm --name my-running-script -v "$PWD":/etc/icecast2 -w /etc/icecast2 seldszar/icecast:2 icecast2 -c icecast.xml
```

## Additional features

 - You can set environment variables directly in the configuration file. They will be replaced by their values at launch by using the following syntax: `${MY_ENV_VARIABLE}`.

## Image Variants

The node images come in many flavors, each designed for a specific use case.

### `seldszar/icecast:<version>`

This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of. This tag is based off of buildpack-deps. buildpack-deps is designed for the average user of docker who has many images on their system. It, by design, has a large number of extremely common Debian packages. This reduces the number of packages that images that derive from it need to install, thus reducing the overall size of all images on your system.

### `seldszar/icecast:onbuild`

This image makes building derivative images easier. For most use cases, creating a Dockerfile in the base of your project directory with the line FROM node:onbuild will be enough to create a stand-alone image for your project.

While the onbuild variant is really useful for "getting off the ground running" (zero to Dockerized in a short period of time), it's not recommended for long-term usage within a project due to the lack of control over when the ONBUILD triggers fire (see also docker/docker#5714, docker/docker#8240, docker/docker#11917).

Once you've got a handle on how your project functions within Docker, you'll probably want to adjust your Dockerfile to inherit from a non-onbuild variant and copy the commands from the onbuild variant Dockerfile (moving the ONBUILD lines to the end and removing the ONBUILD keywords) into your own file so that you have tighter control over them and more transparency for yourself and others looking at your Dockerfile as to what it does. This also makes it easier to add additional requirements as time goes on (such as installing more packages before performing the previously-ONBUILD steps).
