#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pyenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#

package_name=pyenv

plugin_dir=$(dirname "${0}":A)

# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/messages.zsh
# shellcheck source=/dev/null
source "${plugin_dir}"/src/helpers/tools.zsh

function pyenv::dependences {
    message_info "Installing Dependences ${package_name}"
}

function pyenv::install {
    pyenv::dependences
    message_info "Installing ${package_name}"
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    pyenv install 3.7.4
    pyenv install 3.8.0
    pyenv global 3.7.4
    message_success "Installed ${package_name}"
    pyenv::post_install
}

function pyenv::post_install {
    message_info "Installing other tools for ${package_name}"
    pip install --user pipenv mypy autopep8 \
        flake8 elpy jedi rope \
        isort epc importmagic \
        yapf pylint cookiecutter
    message_success "Success install other tools for ${package_name}"
}

function pyenv::load {
    PATH=$(get_path)
    [ -e "$HOME/.pyenv" ] && export PYENV_ROOT="$HOME/.pyenv"
    [ -e "$HOME/.pyenv/bin" ] && export PATH="$PATH:$HOME/.pyenv/bin"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

pyenv::load

if [ ! -x "$(command which pyenv)" ]; then
    pyenv::install
fi
