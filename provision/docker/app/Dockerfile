FROM python:3.8.0-slim

MAINTAINER Luis Mayta <@slovacus>

ARG stage

LABEL NAME zsh-pyenv-app-$stage

ENV PACKAGES bash git-core

COPY Pipfile* /usr/src/

# set working directory to /usr/src/
WORKDIR /usr/src/

RUN  groupadd -g 500 -r python \
  && groupadd developer \
  && useradd -m -g developer -G python developer \
  && chown -R developer:python /usr/local/bin \
  && mkdir -p /usr/src \
  && chown -R developer /usr/src \
  && apt-get update -y \
  && apt-get install -y $PACKAGES \
  && pip3 install pipenv \
  && pipenv install --dev --skip-lock \
  && pipenv shell --fancy \
  && apt-get purge \
  && rm -rf /var/lib/apt/lists/*
