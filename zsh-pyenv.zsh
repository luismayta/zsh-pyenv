#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pyenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

LIGHT_GREEN='\033[1;32m'
CLEAR='\033[0m'

function pyenv::dependences {
    echo -e "${CLEAR}${LIGHT_GREEN}Installing Dependences${CLEAR}"
}

function pyenv::install {
    pyenv::dependences
    echo -e "${CLEAR}${LIGHT_GREEN} Install pyenv ${CLEAR}"
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    pyenv install 3.7.4
    pyenv install 3.8.0
    pyenv global 3.7.4
    pyenv::post_install
}

function pyenv::post_install {
    echo -e "${CLEAR}${LIGHT_GREEN} Post Install for Pyenv ${CLEAR}"
    pip install pipenv mypy autopep8 flake8 elpy jedi rope isort epc importmagic yapf pylint cookiecutter
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

if [[ ! -x "$(command which pyenv)" ]]; then
    pyenv::install
fi
