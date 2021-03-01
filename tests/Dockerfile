FROM ubuntu:latest

RUN set -e \
    && apt-get update \
    && apt-get -qqy install \
       python3 python3-apt ansible gpg curl vim \
    && apt-get autoclean
