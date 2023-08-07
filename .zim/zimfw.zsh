# AUTOMATICALLY GENERATED FILE. EDIT ONLY THE SOURCE FILES AND THEN COMPILE.
# DO NOT DIRECTLY EDIT THIS FILE!

# MIT License
#
# Copyright (c) 2015-2016 Matt Hamilton and contributors
# Copyright (c) 2016-2023 Eric Nielsen, Matt Hamilton and contributors
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

autoload -Uz is-at-least && if ! is-at-least 5.2; then
  print -u2 -PR "%F{red}${0}: Error starting Zim. You're using Zsh version %B${ZSH_VERSION}%b and versions < %B5.2%b are not supported. Upgrade your Zsh.%f"
  return 1
fi
autoload -Uz zargs

# Define Zim location
if (( ! ${+ZIM_HOME} )) typeset -g ZIM_HOME=${0:h}

_zimfw_print() {
  if (( _zprintlevel > 0 )) print "${@}"
}

_zimfw_mv() {
  local -a cklines
  if cklines=(${(f)"$(command cksum ${1} ${2} 2>/dev/null)"}) && \
      [[ ${${(z)cklines[1]}[1,2]} == ${${(z)cklines[2]}[1,2]} ]]; then
    _zimfw_print -PR "%F{green})%f %B${2}:%b Already up to date"
  else
    if [[ -e ${2} ]]; then
      command mv -f ${2}{,.old} || return 1
    fi
    command mv -f ${1} ${2} && _zimfw_print -PR "%F{green})%f %B${2}:%b Updated.${_zrestartmsg}"
  fi
}

_zimfw_build_init() {
  local -r ztarget=${ZIM_HOME}/init.zsh
  # Force update of init.zsh if it's older than .zimrc
  if [[ ${ztarget} -ot ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
    command mv -f ${ztarget}{,.old} || return 1
  fi
  _zimfw_mv =(
    print -R "zimfw() { source ${(q-)ZIM_HOME}/zimfw.zsh \"\${@}\" }"
    print -R "zmodule() { source ${(q-)ZIM_HOME}/zimfw.zsh \"\${@}\" }"
    local zroot_dir zpre
    local -a zif_functions zif_cmds zroot_functions zroot_cmds
    local -a zfunctions=(${_zfunctions}) zcmds=(${_zcmds})
    # Keep fpath constant regardless of "if" root dirs, to avoid confusing compinit.
    # Move all from zfunctions and zcmds with "if" root dirs prefixes.
    for zroot_dir in ${_zroot_dirs}; do
      if (( ${+_zifs[${zroot_dir}]} )); then
        zpre=${zroot_dir}$'\0'
        zif_functions+=(${(M)zfunctions:#${zpre}*})
        zif_cmds+=(${(M)zcmds:#${zpre}*})
        zfunctions=(${zfunctions:#${zpre}*})
        zcmds=(${zcmds:#${zpre}*})
      fi
    done
    zpre=$'*\0'
    if (( ${#_zfpaths} )) print 'fpath=('${(q-)${_zfpaths#${~zpre}}:a}' ${fpath})'
    if (( ${#zfunctions} )) print -R 'autoload -Uz -- '${zfunctions#${~zpre}}
    for zroot_dir in ${_zroot_dirs}; do
      zpre=${zroot_dir}$'\0'
      if (( ${+_zifs[${zroot_dir}]} )); then
        zroot_functions=(${${(M)zif_functions:#${zpre}*}#${zpre}})
        zroot_cmds=(${${(M)zif_cmds:#${zpre}*}#${zpre}})
        if (( ${#zroot_functions} || ${#zroot_cmds} )); then
          print -R 'if '${_zifs[${zroot_dir}]}'; then'
          if (( ${#zroot_functions} )) print -R '  autoload -Uz -- '${zroot_functions}
          if (( ${#zroot_cmds} )) print -R ${(F):-  ${^zroot_cmds}}
          print fi
        fi
      else
        zroot_cmds=(${${(M)zcmds:#${zpre}*}#${zpre}})
        if (( ${#zroot_cmds} )) print -R ${(F)zroot_cmds}
      fi
    done
  ) ${ztarget}
}

_zimfw_build_login_init() {
  local -r ztarget=${ZIM_HOME}/login_init.zsh
  # Force update of login_init.zsh if it's older than .zimrc
  if [[ ${ztarget} -ot ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
    command mv -f ${ztarget}{,.old} || return 1
  fi
  _zimfw_mv =(
    print '# Do nothing. This file is deprecated.'
  ) ${ztarget}
}

_zimfw_build() {
  _zimfw_build_init && _zimfw_build_login_init && _zimfw_print -P 'Done with build.'
}

zmodule() {
  local -r ztarget=${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc}
  local -r zusage="Usage: %B${0}%b <url> [%B-n%b|%B--name%b <module_name>] [%B-r%b|%B--root%b <path>] [options]

Add %Bzmodule%b calls to your %B${ztarget}%b file to define the modules to be initialized.
The initialization will be done in the same order it's defined.

  <url>                      Module absolute path or repository URL. The following URL formats
                             are equivalent: %Bfoo%b, %Bzimfw/foo%b, %Bhttps://github.com/zimfw/foo.git%b.
                             If an absolute path is given, the module is considered externally
                             installed, and won't be installed or updated by zimfw.
  %B-n%b|%B--name%b <module_name>    Set a custom module name. Default: the last component in <url>.
                             Slashes can be used inside the name to organize the module into
                             subdirectories. The module will be installed at
                             %B${ZIM_HOME}/%b<module_name>.
  %B-r%b|%B--root%b <path>           Relative path to the module root.

Per-module options:
  %B-b%b|%B--branch%b <branch_name>  Use specified branch when installing and updating the module.
                             Overrides the tag option. Default: the repository default branch.
  %B-t%b|%B--tag%b <tag_name>        Use specified tag when installing and updating the module. Over-
                             rides the branch option.
  %B-u%b|%B--use%b <%Bgit%b|%Bdegit%b>       Install and update the module using the defined tool. Default is
                             either defined by %Bzstyle ':zim:zmodule' use '%b<%Bgit%b|%Bdegit%b>%B'%b, or %Bgit%b
                             if none is provided.
                             %Bgit%b requires git itself. Local changes are preserved on updates.
                             %Bdegit%b requires curl or wget, and currently only works with GitHub
                             URLs. Modules install faster and take less disk space. Local
                             changes are lost on updates. Git submodules are not supported.
  %B--no-submodules%b            Don't install or update git submodules.
  %B-z%b|%B--frozen%b                Don't install or update the module.

  The per-module options above are carried over multiple zmodule calls for the same module.
  Modules are uniquely identified by their name.

Per-module-root options:
  %B--if%b <test>                Will only initialize module root if specified test returns a zero
                             exit status. The test is evaluated at every new terminal startup.
  %B--on-pull%b <command>        Execute command after installing or updating the module. The com-
                             mand is executed in the module root directory.
  %B-d%b|%B--disabled%b              Don't initialize the module root or uninstall the module.

  The per-module-root options above are carried over multiple zmodule calls for the same mod-
  ule root.

Per-call initialization options:
  %B-f%b|%B--fpath%b <path>          Will add specified path to fpath. The path is relative to the
                             module root directory. Default: %Bfunctions%b, if the subdirectory
                             exists and is non-empty.
  %B-a%b|%B--autoload%b <func_name>  Will autoload specified function. Default: all valid names inside
                             the %Bfunctions%b subdirectory, if any.
  %B-s%b|%B--source%b <file_path>    Will source specified file. The path is relative to the module
                             root directory. Default: %Binit.zsh%b, if a non-empty %Bfunctions%b sub-
                             directory exists, else the largest of the files matching the glob
                             %B(init.zsh|%b<name>%B.(zsh|plugin.zsh|zsh-theme|sh))%b, if any.
                             <name> in the glob is resolved to the last component of the mod-
                             ule name, or the last component of the path to the module root.
  %B-c%b|%B--cmd%b <command>         Will execute specified command. Occurrences of the %B{}%b placeholder
                             in the command are substituted by the module root directory path.
                             I.e., %B-s 'foo.zsh'%b and %B-c 'source {}/foo.zsh'%b are equivalent.

  Setting any per-call initialization option above will disable the default values from the
  other per-call initialization options, so only your provided values will be used. I.e. these
  values are either all automatic, or all manual in each zmodule call. To use default values
  and also provided values, use separate zmodule calls."
  if [[ ${${funcfiletrace[1]%:*}:A} != ${ztarget:A} ]]; then
    print -u2 -PlR "%F{red}${0}: Must be called from %B${ztarget}%b%f" '' ${zusage}
    return 2
  fi
  if (( ! # )); then
    print -u2 -PlR "%F{red}x ${funcfiletrace[1]}: Missing zmodule url%f" '' ${zusage}
    _zfailed=1
    return 2
  fi
  local zurl=${1} zname=${1:t} zroot zarg
  local -a zfpaths zfunctions zcmds
  if [[ ${zurl} =~ ^[^:/]+: ]]; then
    zname=${zname%.git}
  elif [[ ${zurl} != /* ]]; then
    # Count number of slashes
    case ${#zurl//[^\/]/} in
      0) zurl=https://github.com/zimfw/${zurl}.git ;;
      1) zurl=https://github.com/${zurl}.git ;;
    esac
  fi
  shift
  while [[ ${1} == (-n|--name|-r|--root) ]]; do
    if (( # < 2 )); then
      print -u2 -PlR "%F{red}x ${funcfiletrace[1]}:%B${zname}:%b Missing argument for zmodule option %B${1}%b%f" '' ${zusage}
      _zfailed=1
      return 2
    fi
    case ${1} in
      -n|--name)
        shift
        zname=${${1%%/##}##/##}
        ;;
      -r|--root)
        shift
        zroot=${${1%%/##}##/##}
        ;;
    esac
    shift
  done
  if [[ ${zurl} == /* ]]; then
    _zdirs[${zname}]=${zurl%%/##}
    zurl=
  else
    _zdirs[${zname}]=${ZIM_HOME}/modules/${zname}
  fi
  if [[ ${+_zurls[${zname}]} -ne 0 && ${_zurls[${zname}]} != ${zurl} ]]; then
    print -u2 -PlR "%F{red}x ${funcfiletrace[1]}:%B${zname}:%b Module already defined with a different URL. Expected %B${_zurls[${zname}]}%b%f" '' ${zusage}
    _zfailed=1
    return 2
  fi
  _zurls[${zname}]=${zurl}
  local -r zroot_dir=${_zdirs[${zname}]}${zroot:+/${zroot}}
  _zroot_dirs+=(${zroot_dir})
  # Set default values
  if (( ! ${+_ztools[${zname}]} )); then
    zstyle -s ':zim:zmodule' use "_ztools[${zname}]" || _ztools[${zname}]=git
  fi
  if (( ! ${+_ztypes[${zname}]} )) _ztypes[${zname}]=branch
  if (( ! ${+_zsubmodules[${zname}]} )) _zsubmodules[${zname}]=1
  # Set values from options
  while (( # > 0 )); do
    case ${1} in
      -b|--branch|-t|--tag|-u|--use|--on-pull|--if|-f|--fpath|-a|--autoload|-s|--source|-c|--cmd)
        if (( # < 2 )); then
          print -u2 -PlR "%F{red}x ${funcfiletrace[1]}:%B${zname}:%b Missing argument for zmodule option %B${1}%b%f" '' ${zusage}
          _zfailed=1
          return 2
        fi
        ;;
    esac
    case ${1} in
      -b|--branch|-t|--tag|-u|--use|--no-submodules)
        if [[ -z ${zurl} ]] _zimfw_print -u2 -PR "%F{yellow}! ${funcfiletrace[1]}:%B${zname}:%b The zmodule option %B${1}%b has no effect for external modules%f"
        ;;
    esac
    case ${1} in
      -b|--branch)
        shift
        _ztypes[${zname}]=branch
        _zrevs[${zname}]=${1}
        ;;
      -t|--tag)
        shift
        _ztypes[${zname}]=tag
        _zrevs[${zname}]=${1}
        ;;
      -u|--use)
        shift
        _ztools[${zname}]=${1}
        ;;
      --no-submodules) _zsubmodules[${zname}]=0 ;;
      -z|--frozen) _zfrozens[${zname}]=1 ;;
      --on-pull)
        shift
        zarg=${1}
        if [[ -n ${zroot} ]] zarg="(builtin cd -q ${zroot}; ${zarg})"
        _zonpulls[${zname}]="${_zonpulls[${zname}]+${_zonpulls[${zname}]}; }${zarg}"
        ;;
      --if)
        shift
        _zifs[${zroot_dir}]=${1}
        ;;
      -f|--fpath)
        shift
        zarg=${1}
        if [[ ${zarg} != /* ]] zarg=${zroot_dir}/${zarg}
        zfpaths+=(${zarg})
        ;;
      -a|--autoload)
        shift
        zfunctions+=(${1})
        ;;
      -s|--source)
        shift
        zarg=${1}
        if [[ ${zarg} != /* ]] zarg=${zroot_dir}/${zarg}
        zcmds+=("source ${(q-)zarg:a}")
        ;;
      -c|--cmd)
        shift
        zcmds+=(${1//{}/${(q-)zroot_dir:a}})
        ;;
      -d|--disabled) _zdisabled_root_dirs+=(${zroot_dir}) ;;
      *)
        print -u2 -PlR "%F{red}x ${funcfiletrace[1]}:%B${zname}:%b Unknown zmodule option %B${1}%b%f" '' ${zusage}
        _zfailed=1
        return 2
        ;;
    esac
    shift
  done
  if (( _zflags & 1 )); then
    _znames+=(${zname})
  fi
  if (( _zflags & 2 )); then
    if [[ ! -e ${zroot_dir} ]]; then
      print -u2 -PR "%F{red}x ${funcfiletrace[1]}:%B${zname}: ${zroot_dir}%b not found%f"
      _zfailed=1
      return 1
    fi
    if (( ! ${#zfpaths} && ! ${#zfunctions} && ! ${#zcmds} )); then
      zfpaths=(${zroot_dir}/functions(NF))
      # _* functions are autoloaded by compinit
      # prompt_*_setup functions are autoloaded by promptinit
      zfunctions=(${^zfpaths}/^(*~|*.zwc(|.old)|_*|prompt_*_setup)(N-.:t))
      local -ra prezto_scripts=(${zroot_dir}/init.zsh(N))
      if (( ${#zfpaths} && ${#prezto_scripts} )); then
        # this follows the prezto module format, no need to check for other scripts
        zcmds=('source '${(q-)^prezto_scripts:a})
      else
        # get script with largest size (descending `O`rder by `L`ength, and return only `[1]` first)
        local -ra zscripts=(${zroot_dir}/(init.zsh|(${zname:t}|${zroot_dir:t}).(zsh|plugin.zsh|zsh-theme|sh))(NOL[1]))
        zcmds=('source '${(q-)^zscripts:a})
      fi
    fi
    if (( ! ${#zfpaths} && ! ${#zfunctions} && ! ${#zcmds} )); then
      _zimfw_print -u2 -PlR "%F{yellow}! ${funcfiletrace[1]}:%B${zname}:%b Nothing found to be initialized. Customize the module name, root or initialization with %Bzmodule%b options.%f" '' ${zusage}
    fi
    # Prefix is added to all _zfpaths, _zfunctions and _zcmds to distinguish the originating root dir
    local -r zpre=${zroot_dir}$'\0'
    _zfpaths+=(${zpre}${^zfpaths})
    _zfunctions+=(${zpre}${^zfunctions})
    _zcmds+=(${zpre}${^zcmds})
  fi
}

_zimfw_source_zimrc() {
  local -r ztarget=${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} _zflags=${1}
  local -i _zfailed=0
  if ! source ${ztarget} || (( _zfailed )); then
    print -u2 -PR "%F{red}Failed to source %B${ztarget}%b%f"
    return 1
  fi
  if (( _zflags & 1 && ${#_znames} == 0 )); then
    print -u2 -PR "%F{red}No modules defined in %B${ztarget}%b%f"
    return 1
  fi
  # Remove all from _zfpaths, _zfunctions and _zcmds with disabled root dirs prefixes
  local zroot_dir zpre
  for zroot_dir in ${_zdisabled_root_dirs}; do
    zpre=${zroot_dir}$'\0'
    _zfpaths=(${_zfpaths:#${zpre}*})
    _zfunctions=(${_zfunctions:#${zpre}*})
    _zcmds=(${_zcmds:#${zpre}*})
  done
}

_zimfw_list_unuseds() {
  local -i i=1
  local zinstalled=(${ZIM_HOME}/modules/*(N/))
  local -r zdirs=(${(v)_zdirs})
  # Search into subdirectories
  while (( i <= ${#zinstalled} )); do
    if (( ${zdirs[(I)${zinstalled[i]}/*]} )); then
      zinstalled+=(${zinstalled[i]}/*(N/))
      zinstalled[i]=()
    else
      (( i++ ))
    fi
  done
  # Unused = all installed dirs not in zdirs
  _zunused_dirs=(${zinstalled:|zdirs})
  local zunused
  for zunused (${_zunused_dirs}) _zimfw_print -PR "%B${zunused:t}:%b ${zunused}${1}"
}

_zimfw_check_dumpfile() {
  _zimfw_print -u2 -PR '%F{yellow}! Deprecated action. This is now handled by the completion module alone.'
}

_zimfw_check_version() {
  if (( ${1} )); then
    # Get latest version (get all `v*` tags from repo, delete `*v` from beginning,
    # sort in descending `O`rder `n`umerically, and get the `[1]` first)
    if (( ${2} )); then
      # background check
      if [[ -w ${_zversion_target:h} ]]; then
        print -R ${${(On)${(f)"$(GIT_HTTP_LOW_SPEED_LIMIT=1000 GIT_HTTP_LOW_SPEED_TIME=30 command git ls-remote --tags --refs \
            https://github.com/zimfw/zimfw.git 'v*' 2>/dev/null)"}##*v}[1]} >! ${_zversion_target} &!
      fi
    else
      # foreground check
      local tags
      tags=$(command git ls-remote --tags --refs https://github.com/zimfw/zimfw.git 'v*') || return 1
      >! ${_zversion_target} <<<${${(On)${(f)tags}##*v}[1]} || return 1
    fi
  fi
  if [[ -f ${_zversion_target} ]]; then
    local -r zlatest_version=$(<${_zversion_target})
    if [[ -n ${zlatest_version} && ${_zversion} != ${zlatest_version} ]]; then
      _zimfw_print -u2 -PR "%F{yellow}Latest zimfw version is %B${zlatest_version}%b. You're using version %B${_zversion}%b. Run %Bzimfw upgrade%b to upgrade.%f"
      return 4
    fi
  fi
}

_zimfw_clean_compiled() {
  # Array with unique dirs. ${ZIM_HOME} or any subdirectory should only occur once.
  local -Ur zscriptdirs=(${ZIM_HOME:A} ${${(v)_zdirs##${ZIM_HOME:A}/*}:A})
  local zopt
  if (( _zprintlevel > 0 )) zopt=-v
  command rm -f ${zopt} ${^zscriptdirs}/**/*.zwc(|.old)(N) && \
      _zimfw_print -P 'Done with clean-compiled. Restart your terminal or run %Bzimfw compile%b to re-compile.'
}

_zimfw_clean_dumpfile() {
  local zdumpfile zopt
  zstyle -s ':zim:completion' dumpfile 'zdumpfile' || zdumpfile=${ZDOTDIR:-${HOME}}/.zcompdump
  if (( _zprintlevel > 0 )) zopt=-v
  command rm -f ${zopt} ${zdumpfile}(|.dat|.zwc(|.old))(N) && \
      _zimfw_print -P "Done with clean-dumpfile.${_zrestartmsg}"
}

_zimfw_compile() {
  # Compile Zim scripts
  local zroot_dir zfile
  for zroot_dir in ${_zroot_dirs:|_zdisabled_root_dirs}; do
    if [[ ! -w ${zroot_dir} ]]; then
      _zimfw_print -PR "%F{yellow}! %B${zroot_dir}:%b No write permission, unable to compile.%f"
      continue
    fi
    for zfile in ${zroot_dir}/(^*test*/)#*.zsh(|-theme)(N-.); do
      if [[ ! ${zfile}.zwc -nt ${zfile} ]]; then
        zcompile -UR ${zfile} && _zimfw_print -PR "%F{green})%f %B${zfile}.zwc:%b Compiled"
      fi
    done
  done
  _zimfw_print -P 'Done with compile.'
}

_zimfw_info() {
  print -R 'zimfw version:        '${_zversion}' (built at 2023-07-17 23:54:58 UTC, previous commit is 49386ca)'
  local zparam
  for zparam in LANG ${(Mk)parameters:#LC_*} OSTYPE TERM TERM_PROGRAM TERM_PROGRAM_VERSION ZIM_HOME ZSH_VERSION; do
    print -R ${(r.22....:.)zparam}${(P)zparam}
  done
}

_zimfw_uninstall() {
  local zopt
  if (( _zprintlevel > 0 )) zopt=-v
  if (( ${#_zunused_dirs} )); then
    if (( _zprintlevel <= 0 )) || read -q "?Uninstall ${#_zunused_dirs} module(s) listed above [y/N]? "; then
      _zimfw_print
      command rm -rf ${zopt} ${_zunused_dirs} || return 1
    fi
  fi
  _zimfw_print -P 'Done with uninstall.'
}

_zimfw_upgrade() {
  local -r ztarget=${ZIM_HOME}/zimfw.zsh zurl=https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh.gz
  {
    if (( ${+commands[curl]} )); then
      command curl -fsSL -o ${ztarget}.new.gz ${zurl} || return 1
    else
      local zopt
      if (( _zprintlevel <= 1 )) zopt=-q
      if ! command wget -nv ${zopt} -O ${ztarget}.new.gz ${zurl}; then
        if (( _zprintlevel <= 1 )); then
          print -u2 -PR "%F{red}Failed to download %B${zurl}%b. Use %B-v%b option to see details.%f"
        fi
        return 1
      fi
    fi
    command gunzip -f ${ztarget}.new.gz || return 1
    # .latest_version can be outdated and will yield a false warning if zimfw is
    # upgraded before .latest_version is refreshed. Bad thing about having a cache.
    _zimfw_mv ${ztarget}{.new,} && command rm -f ${ZIM_HOME}/.latest_version && \
        _zimfw_print -P 'Done with upgrade.'
  } always {
    command rm -f ${ztarget}.new{,.gz}
  }
}

_zimfw_run_list() {
  local -r zname=${1}
  local -r zdir=${_zdirs[${zname}]}
  print -PnR "%B${zname}:%b ${zdir}"
  if [[ -z ${_zurls[${zname}]} ]] print -n ' (external)'
  if (( ${_zfrozens[${zname}]} )) print -n ' (frozen)'
  if (( ${_zdisabled_root_dirs[(I)${zdir}]} )) print -n ' (disabled)'
  print
  if (( _zprintlevel > 1 )); then
    if [[ ${_zfrozens[${zname}]} -eq 0 && -n ${_zurls[${zname}]} ]]; then
      print -nR "  From: ${_zurls[${zname}]}, "
      if [[ -z ${_zrevs[${zname}]} ]]; then
        print -n 'default branch'
      else
        print -nR "${_ztypes[${zname}]} ${_zrevs[${zname}]}"
      fi
      print -nR ", using ${_ztools[${zname}]}"
      if (( ! _zsubmodules[${zname}] )) print -n ', no git submodules'
      print
      if [[ -n ${_zonpulls[${zname}]} ]] print -R "  On-pull: ${_zonpulls[${zname}]}"
    fi
    # Match the current module dir prefix from _zroot_dirs
    local -r zroot_dirs=(${(M)_zroot_dirs:#${zdir}/*})
    if (( ${#zroot_dirs} )); then
      print '  Additional root:'
      local zroot_dir
      for zroot_dir in ${zroot_dirs}; do
        print -nR "    ${zroot_dir}"
        if (( ${_zdisabled_root_dirs[(I)${zroot_dir}]} )) print -n ' (disabled)'
        print
      done
    fi
    # Match and remove the prefix from _zfpaths, _zfunctions and _zcmds
    local -r zpre="${(q)zdir}(|/*)"$'\0'
    local -r zfpaths=(${${(M)_zfpaths:#${~zpre}*}#${~zpre}}) zfunctions=(${${(M)_zfunctions:#${~zpre}*}#${~zpre}}) zcmds=(${${(M)_zcmds:#${~zpre}*}#${~zpre}})
    if (( ${#zfpaths} )) print -R '  fpath: '${zfpaths}
    if (( ${#zfunctions} )) print -R '  autoload: '${zfunctions}
    if (( ${#zcmds} )) print -R '  cmd: '${(j:; :)zcmds}
  fi
}

_zimfw_print_error() {
  print -u2 -PlR $'\E[2K\r'"%F{red}x %B${_zname}:%b ${1}%f" ${2:+${(F):-  ${(f)^2}}}
}

_zimfw_print_okay() {
  if (( _zprintlevel > ${2:-0} )) print -PlR $'\E[2K\r'"%F{green})%f %B${_zname}:%b ${1}" ${3:+${(F):-  ${(f)^3}}}
}

_zimfw_pull_print_okay() {
  # Useb by tools, which run in a subshell
  if [[ -n ${ONPULL} ]]; then
    if ! ERR=$(builtin cd -q ${DIR} 2>&1 && builtin eval ${ONPULL} 2>&1); then
      _zimfw_print_error 'Error during on-pull' ${ERR}
      return 1
    elif [[ ${_zprintlevel} -gt 1 && -n ${ERR} ]]; then
      # Overrides ${3} to include the on-pull output, to be used by _zimfw_print_okay below.
      builtin set ${1} ${2:-0} ${3:+${3}$'\n'}'On-pull output:'$'\n'${ERR}
    fi
  fi
  _zimfw_print_okay "${@}"
}

_zimfw_download_tarball() {
  if [[ ${URL} =~ ^([^:@/]+://)?([^@]+@)?([^:/]+)[:/]([^/]+/[^/]+)/?$ ]]; then
    readonly HOST=${match[3]}
    readonly REPO=${match[4]%.git}
  fi
  if [[ ${HOST} != github.com || -z ${REPO} ]]; then
    _zimfw_print_error "${URL} is not a valid GitHub URL. Will not try to ${_zaction}."
    return 1
  fi
  readonly HEADERS_TARGET=${DIR}/${TEMP}_headers
  {
    if [[ -r ${INFO_TARGET} ]]; then
      readonly INFO=("${(@f)"$(<${INFO_TARGET})"}")
      if [[ ${URL} != ${INFO[1]} ]]; then
        _zimfw_print_error "URL does not match. Expected ${URL}. Will not try to ${_zaction}."
        return 1
      fi
      # Previous REV is in line 2, reserved for future use.
      readonly INFO_HEADER=${INFO[3]}
    fi
    readonly TARBALL_URL=https://api.github.com/repos/${REPO}/tarball/${REV}
    if [[ ${_zaction} == check ]]; then
      if [[ -z ${INFO_HEADER} ]] return 0
      if (( ${+commands[curl]} )); then
        command curl -IfsL -H ${INFO_HEADER} ${TARBALL_URL} >${HEADERS_TARGET}
      else
        command wget --spider -qS --header=${INFO_HEADER} ${TARBALL_URL} 2>${HEADERS_TARGET}
      fi
    else
      if (( ${+commands[curl]} )); then
        if ! ERR=$(command curl -fsSL ${INFO_HEADER:+-H} ${INFO_HEADER} -o ${TARBALL_TARGET} -D ${HEADERS_TARGET} ${TARBALL_URL} 2>&1); then
          _zimfw_print_error "Error downloading ${TARBALL_URL} with curl" ${ERR}
          return 1
        fi
      else
        # wget returns 8 when 304 Not Modified, so we cannot use wget's error codes
        command wget -qS ${INFO_HEADER:+--header=${INFO_HEADER}} -O ${TARBALL_TARGET} ${TARBALL_URL} 2>${HEADERS_TARGET}
      fi
    fi
    while IFS= read -r HEADER; do
      HEADER=${${HEADER## ##}%%$'\r'##}
      if [[ ${HEADER} == HTTP/* ]]; then
        HTTP_CODE=${${(s: :)HEADER}[2]}
      elif [[ ${${(L)HEADER%%:*}%% ##} == etag ]]; then
        ETAG=${${HEADER#*:}## ##}
      fi
    done < ${HEADERS_TARGET}
    if (( HTTP_CODE == 304 )); then
      # Not Modified
      command rm -f ${TARBALL_TARGET} 2>/dev/null
      return 0
    elif (( HTTP_CODE != 200 )); then
      _zimfw_print_error "Error downloading ${TARBALL_URL}, HTTP code ${HTTP_CODE}"
      return 1
    fi
    if [[ -z ${ETAG} ]]; then
      _zimfw_print_error "Error downloading ${TARBALL_URL}, no ETag header found in response"
      return 1
    fi
    if [[ ${_zaction} == check ]]; then
      command touch ${TARBALL_TARGET} # Update available
    else
      if ! print -lR "${URL}" "${REV}" "If-None-Match: ${ETAG}" >! ${INFO_TARGET} 2>/dev/null; then
        _zimfw_print_error "Error creating or updating ${INFO_TARGET}"
        return 1
      fi
    fi
  } always {
    command rm -f ${HEADERS_TARGET} 2>/dev/null
  }
}

_zimfw_untar_tarball() {
  if ! ERR=$(command tar -C ${1} --strip=1 -xzf ${TARBALL_TARGET} 2>&1); then
    _zimfw_print_error "Error extracting ${TARBALL_TARGET}" ${ERR}
    return 1
  fi
}

_zimfw_create_dir() {
  if ! ERR=$(command mkdir -p ${1} 2>&1); then
    _zimfw_print_error "Error creating ${1}" ${ERR}
    return 1
  fi
}

_zimfw_tool_degit() {
  # This runs in a subshell
  readonly -i SUBMODULES=${5}
  readonly DIR=${1} URL=${2} REV=${4} ONPULL=${6} TEMP=.zdegit_${sysparams[pid]}
  readonly TARBALL_TARGET=${DIR}/${TEMP}_tarball.tar.gz INFO_TARGET=${DIR}/.zdegit
  case ${_zaction} in
    install)
      {
        _zimfw_create_dir ${DIR} && _zimfw_download_tarball && _zimfw_untar_tarball ${DIR} && _zimfw_pull_print_okay Installed || return 1
      } always {
        # return 1 does not change ${TRY_BLOCK_ERROR}, only changes ${?}
        (( TRY_BLOCK_ERROR = ? ))
        command rm -f ${TARBALL_TARGET} 2>/dev/null
        if (( TRY_BLOCK_ERROR )) command rm -rf ${DIR} 2>/dev/null
      }
      ;;
    check|update)
      if [[ ! -r ${INFO_TARGET} ]]; then
        _zimfw_print -u2 -PR $'\E[2K\r'"%F{yellow}! %B${_zname}:%b Module was not installed using Zim's degit. Will not try to ${_zaction}. Use zmodule option %B-z%b|%B--frozen%b to disable this warning.%f"
        return 0
      fi
      readonly DIR_NEW=${DIR}${TEMP}
      {
        _zimfw_download_tarball || return 1
        if [[ ${_zaction} == check ]]; then
          if [[ -e ${TARBALL_TARGET} ]]; then
            _zimfw_print_okay 'Update available'
            return 4
          fi
          _zimfw_print_okay 'Already up to date' 1
          return 0
        else
          if [[ -e ${TARBALL_TARGET} ]]; then
            _zimfw_create_dir ${DIR_NEW} && _zimfw_untar_tarball ${DIR_NEW} || return 1
            if (( ${+commands[diff]} )); then
              LOG=$(command diff -x '.zdegit*' -x '*.zwc' -x '*.zwc.old' -qr ${DIR} ${DIR_NEW} 2>/dev/null)
              LOG=${${LOG//${DIR_NEW}/new}//${DIR}/old}
            fi
            if ! ERR=$({ command cp -f ${INFO_TARGET} ${DIR_NEW} && \
                command rm -rf ${DIR} && command mv -f ${DIR_NEW} ${DIR} } 2>&1); then
              _zimfw_print_error "Error updating ${DIR}" ${ERR}
              return 1
            fi
            _zimfw_pull_print_okay Updated 0 ${LOG} || return 1
          else
            _zimfw_pull_print_okay 'Already up to date' || return 1
          fi
        fi
      } always {
        command rm -f ${TARBALL_TARGET} 2>/dev/null
        command rm -rf ${DIR_NEW} 2>/dev/null
      }
      ;;
  esac
  # Check after successful install or update
  if [[ ${_zprintlevel} -gt 0 && ${SUBMODULES} -ne 0 && -e ${DIR}/.gitmodules ]]; then
    print -u2 -PR $'\E[2K\r'"%F{yellow}! %B${_zname}:%b Module contains git submodules, which are not supported by Zim's degit. Use zmodule option %B--no-submodules%b to disable this warning.%f"
  fi
}

_zimfw_tool_git() {
  # This runs in a subshell
  readonly -i SUBMODULES=${5}
  readonly  DIR=${1} URL=${2} TYPE=${3} ONPULL=${6}
  REV=${4}
  case ${_zaction} in
    install)
      if ERR=$(command git clone ${REV:+-b} ${REV} -q --config core.autocrlf=false ${${SUBMODULES:#0}:+--recursive} -- ${URL} ${DIR} 2>&1); then
        _zimfw_pull_print_okay Installed
      else
        _zimfw_print_error 'Error during git clone' ${ERR}
        return 1
      fi
      ;;
    check|update)
      if [[ ! -r ${DIR}/.git ]]; then
        _zimfw_print -u2 -PR $'\E[2K\r'"%F{yellow}! %B${_zname}:%b Module was not installed using git. Will not try to ${_zaction}. Use zmodule option %B-z%b|%B--frozen%b to disable this warning.%f"
        return 0
      fi
      if [[ ${URL} != $(command git -C ${DIR} config --get remote.origin.url) ]]; then
        _zimfw_print_error "URL does not match. Expected ${URL}. Will not try to ${_zaction}."
        return 1
      fi
      if ! ERR=$(command git -C ${DIR} fetch -pqt origin 2>&1); then
        _zimfw_print_error 'Error during git fetch' ${ERR}
        return 1
      fi
      if [[ ${TYPE} == branch ]]; then
        if [[ -z ${REV} ]]; then
          # Get HEAD remote branch
          if ! ERR=$(command git -C ${DIR} remote set-head origin -a 2>&1); then
            _zimfw_print_error 'Error during git remote set-head' ${ERR}
            return 1
          fi
          if REV=$(command git -C ${DIR} symbolic-ref --short refs/remotes/origin/HEAD 2>&1); then
            REV=${REV#origin/}
          else
            _zimfw_print_error 'Error during git symbolic-ref' ${REV}
            return 1
          fi
        fi
        TO_REV=${REV}@{u}
        if [[ ${_zaction} == check ]]; then
          readonly -i BEHIND=$(command git -C ${DIR} rev-list --count ${REV}..${TO_REV} -- 2>/dev/null)
          if (( BEHIND )); then
            _zimfw_print_okay "Update available [behind ${BEHIND}]"
            return 4
          else
            _zimfw_print_okay 'Already up to date' 1
            return 0
          fi
        fi
      else
        if [[ ${REV} == $(command git -C ${DIR} describe --tags --exact-match 2>/dev/null) ]]; then
          if [[ ${_zaction} == check ]]; then
            _zimfw_print_okay 'Already up to date' 1
            return 0
          else
            _zimfw_pull_print_okay 'Already up to date'
            return ${?}
          fi
        fi
        if [[ ${_zaction} == check ]]; then
          _zimfw_print_okay 'Update available'
          return 4
        fi
        TO_REV=${REV}
      fi
      LOG=$(command git -C ${DIR} log --graph --color --format='%C(yellow)%h%C(reset) %s %C(cyan)(%cr)%C(reset)' ..${TO_REV} -- 2>/dev/null)
      if ! ERR=$(command git -C ${DIR} checkout -q ${REV} -- 2>&1); then
        _zimfw_print_error 'Error during git checkout' ${ERR}
        return 1
      fi
      if [[ ${TYPE} == branch ]]; then
        if ! OUT=$(command git -C ${DIR} merge --ff-only --no-progress -n 2>&1); then
          _zimfw_print_error 'Error during git merge' ${OUT}
          return 1
        fi
        # keep just first line of OUT
        OUT=${OUT%%($'\n'|$'\r')*}
      else
        OUT="Updating to ${TYPE} ${REV}"
      fi
      if (( SUBMODULES )); then
        if ! ERR=$(command git -C ${DIR} submodule update --init --recursive -q -- 2>&1); then
          _zimfw_print_error 'Error during git submodule update' ${ERR}
          return 1
        fi
      fi
      _zimfw_pull_print_okay ${OUT} 0 ${LOG}
      ;;
  esac
}

_zimfw_run_tool() {
  local -r _zname=${1}
  if [[ -z ${_zurls[${_zname}]} ]]; then
    _zimfw_print_okay 'Skipping external module' 1
    return 0
  fi
  if (( _zfrozens[${_zname}] )); then
    _zimfw_print_okay 'Skipping frozen module' 1
    return 0
  fi
  case ${_zaction} in
    install)
      if [[ -e ${_zdirs[${_zname}]} ]]; then
        _zimfw_print_okay 'Skipping already installed module' 1
        return 0
      fi
      _zimfw_print -nR $'\E[2K\r'"Installing ${_zname} ..."
      ;;
    check|update)
      if [[ ! -d ${_zdirs[${_zname}]} ]]; then
        _zimfw_print_error 'Not installed. Run %Bzimfw install%b to install.'
        return 1
      fi
      if [[ ${_zaction} == check ]]; then
        if (( _zprintlevel > 1 )) print -nR $'\E[2K\r'"Checking ${_zname} ..."
      else
        _zimfw_print -nR $'\E[2K\r'"Updating ${_zname} ..."
      fi
      ;;
    *)
      _zimfw_print_error "Unknown action ${_zaction}"
      return 1
      ;;
  esac
  local -r ztool=${_ztools[${_zname}]}
  case ${ztool} in
    degit|git)
      _zimfw_tool_${ztool} "${_zdirs[${_zname}]}" "${_zurls[${_zname}]}" "${_ztypes[${_zname}]}" "${_zrevs[${_zname}]}" "${_zsubmodules[${_zname}]}" "${_zonpulls[${_zname}]}"
      ;;
    *)
      _zimfw_print_error "Unknown tool ${ztool}"
      return 1
      ;;
  esac
}

_zimfw_run_tool_action() {
  local -r _zaction=${1}
  _zimfw_source_zimrc 1 && zargs -n 1 -P 0 -- "${_znames[@]}" -- _zimfw_run_tool
  return 0
}

zimfw() {
  builtin emulate -L zsh -o EXTENDED_GLOB
  local -r _zversion='1.12.0' _zversion_target=${ZIM_HOME}/.latest_version zusage="Usage: %B${0}%b <action> [%B-q%b|%B-v%b]

Actions:
  %Bbuild%b           Build %B${ZIM_HOME}/init.zsh%b and %B${ZIM_HOME}/login_init.zsh%b.
                  Also does %Bcompile%b. Use %B-v%b to also see its output.
  %Bclean%b           Clean all. Does both %Bclean-compiled%b and %Bclean-dumpfile%b.
  %Bclean-compiled%b  Clean Zsh compiled files.
  %Bclean-dumpfile%b  Clean completion dumpfile.
  %Bcompile%b         Compile Zsh files.
  %Bhelp%b            Print this help.
  %Binfo%b            Print Zim and system info.
  %Blist%b            List all modules currently defined in %B${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc}%b.
                  Use %B-v%b to also see the modules details.
  %Binit%b            Same as %Binstall%b, but with output tailored to be used at terminal startup.
  %Binstall%b         Install new modules. Also does %Bbuild%b, %Bcompile%b. Use %B-v%b to also see their
                  output, any on-pull output and skipped modules.
  %Buninstall%b       Delete unused modules. Prompts for confirmation. Use %B-q%b for quiet uninstall.
  %Bcheck%b           Check if updates for current modules are available. Use %B-v%b to also see
                  skipped and up to date modules.
  %Bupdate%b          Update current modules. Also does %Bbuild%b, %Bcompile%b. Use %B-v%b to also see their
                  output, any on-pull output and skipped modules.
  %Bcheck-version%b   Check if a new version of zimfw is available.
  %Bupgrade%b         Upgrade zimfw. Also does %Bcompile%b. Use %B-v%b to also see its output.
  %Bversion%b         Print zimfw version.

Options:
  %B-q%b              Quiet (yes to prompts and only outputs errors)
  %B-v%b              Verbose (outputs more details)"
  local -Ua _znames _zroot_dirs _zdisabled_root_dirs
  local -A _zfrozens _ztools _zdirs _zurls _ztypes _zrevs _zsubmodules _zonpulls _zifs
  local -a _zfpaths _zfunctions _zcmds _zunused_dirs
  local -i _zprintlevel=1
  if (( # > 2 )); then
     print -u2 -PlR "%F{red}${0}: Too many options%f" '' ${zusage}
     return 2
  elif (( # > 1 )); then
    case ${2} in
      -q) _zprintlevel=0 ;;
      -v) _zprintlevel=2 ;;
      *)
        print -u2 -PlR "%F{red}${0}: Unknown option ${2}%f" '' ${zusage}
        return 2
        ;;
    esac
  fi

  if ! zstyle -t ':zim' disable-version-check && [[ ${1} != check-version ]]; then
    # If .latest_version does not exist or was not modified in the last 30 days
    [[ -f ${_zversion_target}(#qNm-30) ]]; local -r zversion_check_force=${?}
    _zimfw_check_version ${zversion_check_force} 1
  fi

  local _zrestartmsg=' Restart your terminal for changes to take effect.'
  case ${1} in
    build)
      _zimfw_source_zimrc 2 && _zimfw_build || return 1
      (( _zprintlevel-- ))
      _zimfw_compile
      ;;
    check-dumpfile) _zimfw_check_dumpfile ;;
    clean) _zimfw_source_zimrc 2 && _zimfw_clean_compiled && _zimfw_clean_dumpfile ;;
    clean-compiled) _zimfw_source_zimrc 2 && _zimfw_clean_compiled ;;
    clean-dumpfile) _zimfw_clean_dumpfile ;;
    compile) _zimfw_source_zimrc 2 && _zimfw_compile ;;
    help) print -PR ${zusage} ;;
    info) _zimfw_info ;;
    list)
      _zimfw_source_zimrc 3 && zargs -n 1 -- "${_znames[@]}" -- _zimfw_run_list && \
          _zimfw_list_unuseds ' (unused)'
      ;;
    check)
      _zrestartmsg=
      _zimfw_run_tool_action ${1} || return 1
      (( _zprintlevel-- ))
      _zimfw_print -PR "Done with ${1}." # Only printed in verbose mode
      ;;
    init)
      _zrestartmsg=
      _zimfw_run_tool_action install || return 1
      (( _zprintlevel-- ))
      _zimfw_print -PR "Done with install." # Only printed in verbose mode
      _zimfw_source_zimrc 2 && _zimfw_build && _zimfw_compile
      ;;
    install|update)
      _zimfw_run_tool_action ${1} || return 1
      _zimfw_print -PR "Done with ${1}.${_zrestartmsg}"
      (( _zprintlevel-- ))
      _zimfw_source_zimrc 2 && _zimfw_build && _zimfw_compile
      ;;
    uninstall) _zimfw_source_zimrc 2 && _zimfw_list_unuseds && _zimfw_uninstall ;;
    check-version) _zimfw_check_version 1 ;;
    upgrade)
      _zimfw_upgrade || return 1
      (( _zprintlevel-- ))
      _zimfw_source_zimrc 2 && _zimfw_compile
      ;;
    version) print -PR ${_zversion} ;;
    *)
      print -u2 -PlR "%F{red}${0}: Unknown action ${1}%f" '' ${zusage}
      return 2
      ;;
  esac
}

if [[ ${functrace[1]} == zmodule:* ]]; then
  zmodule "${@}"
else
  zimfw "${@}"
fi
