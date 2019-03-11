# Requirements

It requires Vim 8.0 or greater (*+packages*).

# Packages

It comes with a few plugins bundled. To wit:

- `dbext.vim`
- `vim-obsession`
- `vim-sensible`

# Installation

```
$ git clone 'https://github.com/lbrayner/easy_dbext_bundle.vim'
$ cd easy_dbext_bundle.vim
easy_dbext_bundle.vim$ git submodule update --init
```

# How to start it

Use `init.vim` as *vimrc* with the `-u` flag: it will make this repository the
effective *.vim* folder, removing the standard locations from the *RUNTIMEPATH*.
It's meant to be used with **gVim Easy**, so:

```
easy_dbext_bundle.vim$ gvim -y -u init.vim
```

Make a script of it or a Windows shortcut.

If you're setting this up for someone else, don't forget to use tpope's
[vim-obsession](https://github.com/tpope/vim-obsession.git).
