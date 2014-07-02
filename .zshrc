#
# Executes commands at the start of an interactive session.
#

# Custom completions
zstyle ':completion::complete:chruby:*:values' sort false
fpath=(${ZDOTDIR:-$HOME}/.zsh/completions $fpath)

#
# Custom
#


# disable flow control
stty -ixon -ixoff

# autocorrect is annoying
unsetopt correct_all

source ~/.zsh/syntax-highlighting.zsh
source ~/.zsh/environment.zsh
source ~/.zsh/history.zsh
source ~/.zsh/editor.zsh
source ~/.zsh/directory.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/syntax-highlighting.zsh

source ~/.zsh/aliases.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/prompt.zsh

if [[ -s ~/.zsh/private.zsh ]] ; then source ~/.zsh/private.zsh ; fi
