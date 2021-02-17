#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function pyenv::config::main::factory {
    # shellcheck source=/dev/null
    source "${ZSH_PYENV_PATH}"/config/base.zsh
    case "${OSTYPE}" in
    darwin*)
        # shellcheck source=/dev/null
        source "${ZSH_PYENV_PATH}"/config/osx.zsh
        ;;
    linux*)
        # shellcheck source=/dev/null
        source "${ZSH_PYENV_PATH}"/config/linux.zsh
      ;;
    esac
}

pyenv::config::main::factory
