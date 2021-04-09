FROM golang:1.9 AS build-ecr-plugin

RUN go get -u github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
WORKDIR /go/src/github.com/awslabs/amazon-ecr-credential-helper
RUN make linux-amd64


FROM docker:18

LABEL maintainer "@adenot"

RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make zip git curl py-pip openssl bash gettext \
      gcc python2-dev openssl-dev libffi-dev musl-dev

# for some reasons packages "gcc python2-dev openssl-dev libffi-dev musl-dev" are required
# to install compose, which previously were not
RUN pip install --upgrade pip docker-compose

COPY --from=build-ecr-plugin /go/src/github.com/awslabs/amazon-ecr-credential-helper/bin/linux-amd64/docker-credential-ecr-login /bin
RUN mkdir -p ~/.docker
RUN echo > ~/.docker/config.json '{ "credsStore": "ecr-login" }'

CMD [ "make" ]