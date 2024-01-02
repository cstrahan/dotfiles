zimfw() { source $ZIM_HOME/zimfw.zsh "${@}" }
zmodule() { source $ZIM_HOME/zimfw.zsh "${@}" }
fpath=($ZIM_HOME/modules/zim-rtx/functions $ZIM_HOME/modules/git/functions $ZIM_HOME/modules/utility/functions $ZIM_HOME/modules/duration-info/functions $ZIM_HOME/modules/git-info/functions $ZIM_HOME/modules/zsh-completions/src ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info
source $ZIM_HOME/modules/zim-rtx/init.zsh
source $ZIM_HOME/modules/environment/init.zsh
source $ZIM_HOME/modules/git/init.zsh
source $ZIM_HOME/modules/input/init.zsh
source $ZIM_HOME/modules/termtitle/init.zsh
source $ZIM_HOME/modules/utility/init.zsh
source $ZIM_HOME/modules/duration-info/init.zsh
source $ZIM_HOME/modules/asciiship/asciiship.zsh-theme
source $ZIM_HOME/modules/completion/init.zsh
source $ZIM_HOME/modules/fzf-tab/fzf-tab.plugin.zsh
source $ZIM_HOME/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZIM_HOME/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZIM_HOME/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZIM_HOME/modules/fzf/init.zsh
