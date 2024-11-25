# See note in ~/.zshenv about macOS's /etc/profile messing up PATH.
# This puts my preferred paths in front of those set by /usr/libexec/path_helper.
if (( ${#path_before_etc_profile} )); then
  path[1,0]=("$path_before_etc_profile[@]")
fi

if (( ${#manpath_before_etc_profile} )); then
  manpath[1,0]=("$manpath_before_etc_profile[@]")
fi

# OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
