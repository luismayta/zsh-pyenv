#!/usr/bin/env ksh

# -*- coding: utf-8 -*-
export PYENV_PACKAGES=(
    flake8 elpy jedi rope
    isort epc importmagic
    yapf pylint cookiecutter wakatime
    pipenv mypy autopep8
)

function pyenv::packages::install {
    if ! type -p python > /dev/null; then
        message_warning "it's neccesary have python"
        return
    fi

    message_info "Installing required python packages"
    python -m pip install --user --upgrade pip
    for package in "${PYENV_PACKAGES[@]}"; do
        python -m pip install --user --upgrade "${package}"
    done
    message_success "Installed required python packages"
}
