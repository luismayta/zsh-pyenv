#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pyenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

function pyenv::install {
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    pyenv::load
    pyenv install 3.6.4
    pyenv global 3.6.4
}

function pyenv::init {
    unset -f pyenv pyenv::init
    if [[ ! "$PATH" == */.pyenv/bin* ]]; then
        export PATH="$HOME/.pyenv/bin:$PATH"
    fi
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

function pyenv {
    pyenv::init
    pyenv "$@"
}

function pyenv::load {
    [[ -e "$HOME/.pyenv" ]] && export PYENV_ROOT="$HOME/.pyenv"
    [[ -e "$HOME/.pyenv/bin" ]] && export PATH="$PATH:$HOME/.pyenv/bin"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
}

pyenv::load

if (( ! $+commands[pyenv] )); then
    pyenv::install
fi
