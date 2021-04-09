FROM docker
LABEL maintainer "@flemay"
RUN apk --no-cache update && apk --no-cache upgrade \
    && apk --no-cache add --upgrade make zip git curl py-pip openssl bash gettext \
      gcc python2-dev openssl-dev libffi-dev musl-dev
# for some reasons packages "gcc python2-dev openssl-dev libffi-dev musl-dev" are required
# to install compose, which previously were not
RUN pip install --upgrade pip
CMD [ "make" ]