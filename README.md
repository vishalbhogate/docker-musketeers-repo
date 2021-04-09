# Docker - Musketeers

🐳 Lightweight image with essential tools for a [3 Musketeers][link3Musketeers] project. ⚔️

## Tools

- Docker: useful when doing Docker in Docker (DinD).
- Compose
- make
- zip
- curl
- git
- openssl
- bash
- envsubst

## Usage

```bash
# pull image
$ docker pull flemay/musketeers
# run image
$ docker run --rm flemay/musketeers docker --version
```

```bash
# Development

# generate .env file
$ make envfile
# build image
$ make build
# test image
$ make test
# go inside a musketeers container
$ make shell
```

## Example

The GitLab pipeline to build and test the Docker image [flemay/cookiecutter][link3MusketeersExamples] uses `flemay/musketeers` image.

## Versioning

This image will always be built with the tag `latest` so tools will always be up to date. This may cause issues if any tool has a breaking change.

## Automated build process

In a nutshell, any change to master triggers a [Travis build][linkTravisCIProject] and if the tests passed it triggers a [Docker Hub build][linkDockerHubProjectBuild]. The automatic build on Docker Hub has been disabled ensuring the build process to go only through Travis.

A cron task in Travis triggers a build every month making the image to be as fresh as possible automatically.


[link3Musketeers]: https://3musketeers.io
[link3MusketeersExamples]: https://3musketeers.io/examples/

[linkLicenseBadge]: https://img.shields.io/dub/l/vibe-d.svg
[linkLicense]: LICENSE
[linkTravisCIProjectBadge]: https://travis-ci.org/flemay/docker-musketeers.svg?branch=master
[linkTravisCIProject]: https://travis-ci.org/flemay/docker-musketeers
[linkDockerHubProjectBadge]: https://img.shields.io/badge/repository-dockerhub-blue.svg
[linkDockerHubProject]: https://hub.docker.com/r/flemay/musketeers
[linkDockerHubProjectBuild]: https://hub.docker.com/r/flemay/musketeers/builds/
[linkBadgeDockerProjectBuildBadge]: https://img.shields.io/docker/build/flemay/musketeers.svg