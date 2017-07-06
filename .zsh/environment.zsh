#
# Smart URLs
#

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# General
#

setopt BRACE_CCL          # Allow brace character class list expansion.
setopt COMBINING_CHARS    # Combine zero-length punctuation characters (accents)
                          # with the base character.
setopt RC_QUOTES          # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
unsetopt MAIL_WARNING     # Don't print a warning message if a mail file has been accessed.

#
# Jobs
#

setopt LONG_LIST_JOBS     # List jobs in the long format by default.
setopt AUTO_RESUME        # Attempt to resume existing job before creating a new process.
setopt NOTIFY             # Report status of background jobs immediately.
unsetopt BG_NICE          # Don't run all background jobs at a lower priority.
unsetopt HUP              # Don't kill jobs on shell exit.
unsetopt CHECK_JOBS       # Don't report on jobs when shell exit.

#
# Grep
#

export GREP_COLOR='37;45'

#
# Termcap
#

export LESS_TERMCAP_mb=$'\E[01;31m'       # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'           # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'           # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[1;31m'        # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'           # Ends underline.
export LESS_TERMCAP_us=$'\E[04;33;5;146m' # Begins underline.

#
# Term
#

# Because setting default-terminal in tmux to screen-256color
# seems to still result in $TERM == screen
if [[ $TERM =~ screen ]]; then
  export TERM=screen-256color
fi

#
# Ranger
#

#if whence -p w3mimgdisplay >/dev/null; then
#  export W3MIMGDISPLAY_PATH="$(whence -p w3mimgdisplay)"
#fi

#
# Wine
#

# Prevent Wine from changing filetype associations.
# https://wiki.winehq.org/FAQ#How_can_I_prevent_Wine_from_changing_the_filetype_associations_on_my_system_or_adding_unwanted_menu_entries.2Fdesktop_links.3F
export WINEDLLOVERRIDES=winemenubuilder.exe=d
