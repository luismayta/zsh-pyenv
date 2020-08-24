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

# shellcheck disable=SC2034  # Unused variables left for readability
PYENV_ROOT_DIR=$(dirname "$0")
PYENV_SRC_DIR="${PYENV_ROOT_DIR}"
PYENV_VERSIONS=(
    3.6.6
    3.7.4
    anaconda3-5.3.1
    miniconda3-4.3.30
    3.8.0
    3.8.5
)
PYENV_VERSION_GLOBAL=3.8.0

# shellcheck source=/dev/null
source "${PYENV_SRC_DIR}"/core/base.zsh

# shellcheck source=/dev/null
source "${PYENV_SRC_DIR}"/core/packages.zsh

function curl::install {
    message_info "Installing curl for ${pyenv_package_name}"
    if ! type -p brew > /dev/null; then
        message_warning "it's neccesary brew, add: luismayta/zsh-brew"
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
    pyenv::load
    pyenv::post_install
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

function pyenv::post_install::versions {
    pyenv::load
    if ! type -p pyenv > /dev/null; then
        message_warning "not found pyenv"
        return
    fi
    message_info "Install versions of pyenv"
    for version in "${PYENV_VERSIONS[@]}"; do
        pyenv install "${version}"
    done
    pyenv global "${PYENV_VERSION_GLOBAL}"
    message_success "Installed versions of pyenv"
}

function pyenv::post_install {
    message_info "Installing other tools for ${pyenv_package_name}"
    pyenv::install::versions::factory
    pyenv::install::packages
    message_success "Success install other tools for ${pyenv_package_name}"
}

function pyenv::load {
    [ -e "${HOME}/.pyenv" ] && export PYENV_ROOT="$HOME/.pyenv"
    [ -e "${HOME}/.pyenv/bin" ] && export PATH="${PATH}:${HOME}/.pyenv/bin"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1

    if type -p pyenv > /dev/null; then
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    fi
}

pyenv::load

if ! type -p pyenv > /dev/null; then pyenv::install; fi
