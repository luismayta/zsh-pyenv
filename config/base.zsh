#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

export PYENV_ROOT="${HOME}/.pyenv"
export PYENV_ROOT_BIN="${HOME}/.pyenv/bin"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_MESSAGE_BREW="Please install brew or use antibody bundle luismayta/zsh-brew branch:develop"
export PYENV_PACKAGE_NAME=pyenv
export PYENV_VERSIONS=(
    anaconda3-5.3.1
    miniconda3-4.3.30
    3.8.0
    3.8.5
    3.9.0
    3.10.4
)
export PYENV_VERSION_GLOBAL=3.10.4
export PYENV_MODULES=(
    lastversion
    ansible
    ansible-lint
    checkov
    pip
    opencv-python
)

export ZSH_PYENV_LAZY_VIRTUALENV=true
