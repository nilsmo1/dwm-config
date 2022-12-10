# Neovim dotfiles

## Requirements
Before getting started, make sure that `curl` and `git` are installed.

## Get started
Create a directory called `nvim` in `.config`, and create a config file called `init.vim`:

```bash
$ mkdir -p ~/.config/nvim; cd "$_"
$ touch init.vim
```

Install [`vim-plug`](https://github.com/junegunn/vim-plug):

(Neovim: Unix, Linux)
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Plugins
In the `init.vim` file, this is how you format plugins:
```vim
...
call plug#begin()

Plug '<link>'

call plug#end()
...
```

then run `:PlugInstall` (optionally `:PlugClean` for removing plugins which are not specified in the file) in command mode.
