#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pyenv::internal::pyenv::install {
    message_info "Installing ${PYENV_PACKAGE_NAME}"
    git clone https://github.com/syndbg/pyenv.git ~/.pyenv
    message_success "Installed ${PYENV_PACKAGE_NAME}"
}

function pyenv::internal::pyenv::load {
    [ -e "${PYENV_ROOT_BIN}" ] && export PATH="${PYENV_ROOT_BIN}:${PATH}"

    # Lazy load pyenv
    if type -p pyenv > /dev/null; then
        export PATH="${PYENV_ROOT}/shims:${PATH}"
        function pyenv {
            unset -f pyenv
            eval "$(command pyenv init -)"
            if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
                eval "$(command pyenv virtualenv-init -)"
            fi
            pyenv $@
        }
    fi
}

function pyenv::internal::version::all::install {
    if ! core::exists pyenv; then
        message_warning "not found pyenv"
        return
    fi

    for version in "${PYENV_VERSIONS[@]}"; do
        message_info "Install version of go ${version}"
        pyenv install "${version}"
        message_success "Installed version of go ${version}"
    done
    pyenv global "${PYENV_VERSION_GLOBAL}"
    message_success "Installed versions of Go"

}

function pyenv::internal::version::global::install {
    if ! core::exists pyenv; then
        message_warning "not found pyenv"
        return
    fi
    message_info "Installing version global of python ${PYENV_VERSION_GLOBAL}"
    pyenv install "${PYENV_VERSION_GLOBAL}"
    pyenv global "${PYENV_VERSION_GLOBAL}"
    message_success "Installed version global of python ${PYENV_VERSION_GLOBAL}"
}

function pyenv::internal::modules::install {
    if ! core::exists python; then
        message_warning "it's neccesary have python"
        return
    fi

    message_info "Installing required python modules"
    python -m pip install --user --upgrade "${PYENV_MODULES[@]}"
    message_success "Installed required python modules"
}
