# zim-atuin

A [Zim](https://zimfw.sh/)'s module that helps set up [Atuin](https://docs.atuin.sh/).

## Prerequisites

- [Atuin](https://docs.atuin.sh/)

## Usage

Add the following to your `~/.zimrc`.

```zsh
zmodule shihanng/zim-atuin
```

I also have the following in my `~/.zshrc` because I am using [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode).

```zsh
export ATUIN_NOBIND="true"

# Somewhere after Zim initialization.
# ...

function zvm_after_init() {
  zvm_bindkey vicmd '^R' atuin-search
  zvm_bindkey viins '^R' atuin-search
}
```
