# -*- mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Copyright (c) 2021 Nate Brown

# According to the Zsh Plugin Standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

0=${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}
0=${${(M)0:#/*}:-$PWD/$0}

# Then ${0:h} to get plugin's directory

if [[ ${zsh_loaded_plugins[-1]} != */zinit-zsh-hints && -z ${fpath[(r)${0:h}]} ]] {
    fpath+=( "${0:h}" )
}

# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins
Plugins[ZINIT_ZSH_HINTS_DIR]="${0:h}"

autoload -Uz zsh-hints
zstyle ':zsh-hints:*:' dir "${0:h}/zsh-hints-repo"

zle -N zsh-hints-param zsh-hints
bindkey "^Xp" zsh-hints-param
zle -N zsh-hints-paramflags zsh-hints
bindkey "^Xf" zsh-hints-paramflags
zle -N zsh-hints-glob zsh-hints
bindkey "^Xg" zsh-hints-glob


# Use alternate vim marks [[[ and ]]] as the original ones can
# confuse nested substitutions, e.g.: ${${${VAR}}}

# vim:ft=zsh:tw=80:sw=4:sts=4:et:foldmarker=[[[,]]]
