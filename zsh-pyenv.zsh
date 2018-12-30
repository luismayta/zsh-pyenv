#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pyenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

function install_pyenv {
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
}

function load_pyenv {
    [[ -e "$HOME/.pyenv/bin" ]] && export PATH="$PATH:$HOME/.pyenv/bin"
    if [ -e "$HOME/.pyenv" ]; then
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
}

load_pyenv

if (( ! $+commands[pyenv] )); then
    install_pyenv
fi
