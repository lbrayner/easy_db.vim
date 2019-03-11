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

# Mappings (Insert Mode)

They are provided by the package `easy_dbext.vim`:

- `CTRL-Enter`: execute SQL in paragraph.
- `F1`: show these mappings.
- `F5`: refresh the file (`:e`) to reload the *dbext* modelines.
- `F9`: execute *DBResultsOpen* if in a buffer other than **Result**; toggle its
  size (*tall* or *short*) when in it.
- `F10`: execute *DBResultsClose*.
- `CTRL-NumpadMinus`: resize the window with -5 as parameter.
- `CTRL-NumpadPlus`: resize the window with +5 as parameter.
- `CTRL-F9`: equalize all windows.

# Helptags

Don't forget to `:helptags ALL`. Ignore the errors.
