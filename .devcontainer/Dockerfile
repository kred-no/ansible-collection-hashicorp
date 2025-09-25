ARG base_image_tag

FROM "mcr.microsoft.com/devcontainers/base:${base_image_tag:-'ubuntu'}"

ENV DEBIAN_FRONTEND=noninteractive \
    PATH="/opt/venv-ansible/bin:$PATH"

RUN set -e \
  && apt-get update \
  && apt-get install -y python3-pip python3-venv podman

RUN set -e \
  && python3 -m venv /opt/venv-ansible \
  && pip install --upgrade pip \
  && pip install --upgrade ansible-dev-tools \
  && pip install --upgrade molecule-podman
