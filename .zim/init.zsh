zimfw() { source /Users/cstrahan/.zim/zimfw.zsh "${@}" }
zmodule() { source /Users/cstrahan/.zim/zimfw.zsh "${@}" }
fpath=(/Users/cstrahan/.zim/modules/zim-rtx/functions /Users/cstrahan/.zim/modules/git/functions /Users/cstrahan/.zim/modules/utility/functions /Users/cstrahan/.zim/modules/duration-info/functions /Users/cstrahan/.zim/modules/git-info/functions /Users/cstrahan/.zim/modules/zsh-completions/src ${fpath})
autoload -Uz -- git-alias-lookup git-branch-current git-branch-delete-interactive git-branch-remote-tracking git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info
source /Users/cstrahan/.zim/modules/zim-rtx/init.zsh
source /Users/cstrahan/.zim/modules/environment/init.zsh
source /Users/cstrahan/.zim/modules/git/init.zsh
source /Users/cstrahan/.zim/modules/input/init.zsh
source /Users/cstrahan/.zim/modules/termtitle/init.zsh
source /Users/cstrahan/.zim/modules/utility/init.zsh
source /Users/cstrahan/.zim/modules/duration-info/init.zsh
source /Users/cstrahan/.zim/modules/asciiship/asciiship.zsh-theme
source /Users/cstrahan/.zim/modules/completion/init.zsh
source /Users/cstrahan/.zim/modules/fzf-tab/fzf-tab.plugin.zsh
source /Users/cstrahan/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/cstrahan/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /Users/cstrahan/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/cstrahan/.zim/modules/fzf/init.zsh
