#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Custom completions
zstyle ':completion::complete:chruby:*:values' sort false
fpath=(${ZDOTDIR:-$HOME}/.zsh/completions $fpath)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# Custom
#


# disable flow control
stty -ixon -ixoff

# autocorrect is annoying
unsetopt correct_all

source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/prompt.zsh
if [[ -s ~/.zsh/private.zsh ]] ; then source ~/.zsh/private.zsh ; fi
