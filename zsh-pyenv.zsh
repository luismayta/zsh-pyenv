#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

#
# Defines install pyenv for osx or linux.
#
# Authors:
#   Luis Mayta <slovacus@gmail.com>
#
# shellcheck source=/dev/null
[ -e "${HOME}/.zsh-async/async.zsh" ] && source "${HOME}/.zsh-async/async.zsh"

pyenv_package_name=pyenv
PYENV_ROOT="${HOME}/.pyenv"


function curl::install {
    message_info "Installing curl for ${pyenv_package_name}"
    if ! type -p brew > /dev/null; then
        message_error "it's neccesary brew, add: luismayta/zsh-brew"
    fi
    brew install curl
    message_success "Installed curl for ${pyenv_package_name}"
}

if ! type -p curl > /dev/null; then curl::install; fi

function pyenv::dependences {
    message_info "Installing Dependences ${pyenv_package_name}"
}

function pyenv::upgrade {
    message_info "Upgrade ${pyenv_package_name}"
    cd "${PYENV_ROOT}" || exit && git pull && cd - || return
    message_success "Upgraded ${pyenv_package_name}"
}

function pyenv::install {
    pyenv::dependences
    message_info "Installing ${pyenv_package_name}"
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    message_success "Installed ${pyenv_package_name}"
    pyenv::post_install
}

function pyenv::install::version::global {
    message_info "Installing version gloabal for ${pyenv_package_name}"
    pyenv install -f 3.8.0
    pyenv global 3.8.0
    message_success "Installed version global for ${pyenv_package_name}"

}

function pyenv::install::versions::async {
    async_init
    # Start a worker that will report job completion
    async_start_worker pyenv_worker_install_version -u

    # Register our callback function to run when the job completes
    async_register_callback pyenv_worker_install_version pyenv::install::version::callback

    # Start the job
    async_job pyenv_worker_install_version pyenv::install::versions
}

function pyenv::install::versions::factory {
    if command -v async_init > /dev/null; then
        pyenv::install::versions::async
        return
    fi
    pyenv::install::versions
}

# Define a function to process the result of the job
function pyenv::install::version::callback {
    message_success "Finish:: ${1}"
}

function pyenv::install::versions {
    message_info "Installing versions for ${pyenv_package_name}"
    if ! type -p pyenv > /dev/null; then
        message_warning "not found pyenv, please install pyenv"
        return
    fi
    pyenv install -f 3.6.6
    pyenv install -f 3.7.4
    pyenv install -f 3.8.1
    pyenv install -f anaconda3-5.3.1
    pyenv install -f miniconda3-4.3.30
    message_success "Installed versions for ${pyenv_package_name}"
}

function pyenv::install::packages {
    message_info "Installing packages for ${pyenv_package_name}"
    pip install --user --upgrade pip
    pip install --user pipenv mypy autopep8 \
        flake8 elpy jedi rope \
        isort epc importmagic \
        yapf pylint cookiecutter
    message_success "Installed packages for ${pyenv_package_name}"
}

function pyenv::post_install {
    message_info "Installing other tools for ${pyenv_package_name}"
    pyenv::install::version::global
    pyenv::install::packages
    pyenv::install::versions::factory
    message_success "Success install other tools for ${pyenv_package_name}"
}

function pyenv::load {
    [ -e "${HOME}/.pyenv" ] && export PYENV_ROOT="$HOME/.pyenv"
    path_append "${HOME}/.pyenv/bin"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
}

pyenv::load

if ! type -p pyenv > /dev/null; then pyenv::install; fi
