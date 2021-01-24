#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pyenv::internal::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_PYENV_PATH}"/internal/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_PYENV_PATH}"/internal/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_PYENV_PATH}"/internal/linux.zsh
      ;;
    esac
}

pyenv::internal::main::factory

if ! type -p curl > /dev/null; then pyenv::internal::curl::install; fi
if ! type -p pyenv > /dev/null; then pyenv::internal::pyenv::install; fi

pyenv::internal::pyenv::load