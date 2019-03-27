# Requirements

It requires gVim 8.0 or greater (*+packages*).

# Packages

It comes with a few plugins bundled. To wit:

- [dbext.vim](https://github.com/lbrayner/easy_dbext.vim)
- [delimitMate](https://github.com/Raimondi/delimitMate)
- [vim-obsession](https://github.com/tpope/vim-obsession.git)
- [vim-sensible](https://github.com/tpope/vim-sensible)

The only one that changes the behavior of the editor is
[delimitMate](https://github.com/Raimondi/delimitMate): it *...provides automatic
closing of quotes, parenthesis, brackets, etc., besides some other related
features that should make your time in insert mode a little bit easier...*

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

# Helptags

Don't forget to `:helptags ALL`. Ignore the errors.

# Mappings (Insert Mode)

They are provided by the package `easy_dbext.vim`:

- `CTRL-Enter`: execute SQL (SQL, DML or DDL) in paragraph.
- `SHIFT-Enter`: describe table under cursor.
- `F1`: show these (and more) mappings.
- `F5`: refresh the file (`:e`) to reload the *dbext* modelines (SQL buffers
  only).
- `F8`: toggle *wrap* (when on, lines longer than the width of the window will
  wrap and displaying continues on the next line).
- `F9`: execute *DBResultsOpen* if in a buffer other than **Result**; toggle its
  size (*tall* or *short*) when in it.
- `F10`: execute *DBResultsClose*.
- `CTRL-NumpadMinus`: resize the window with -5 as parameter.
- `CTRL-NumpadPlus`: resize the window with +5 as parameter.
- `CTRL-F9`: equalize all windows.
- `ESC ESC`: close all windows except the current one (SQL buffers only).
 
# Maintainer's mappings

Insert mode:

- `SHIFT-F3`: *set noinsertmode*, effectively disabling Easy Mode so that the
  maintainer may expect normal Vim behavior.
- `F12`: toggle *list* to, for example, differentiate between tabs and spaces.

Normal mode:

- `CTRL-F3`: *set insertmode* to re-enable Easy Mode.
- `F12`: same as above.

# Other mappings

Insert mode:

- `CTRL-K`: behave like Emacs' *C-K*, i.e., kill-line (erase everything until the
  end of the line).

Command-line mode:

- `CTRL-K`: same as above.

# Local configuration

Local packages can be installed in `pack/local`; and local configuration should
reside in `config.local.vim` (both inside the *easy_dbext_bundle.vim*
directory). For example, suppose you want to install the
[gruvbox](https://github.com/morhetz/gruvbox) colorscheme:

```
easy_dbext_bundle.vim$ git clone 'https://github.com/morhetz/gruvbox' pack/local/start/gruvbox
```

Then create `config.local.vim` inside *easy_dbext_bundle.vim* and add
`colorscheme gruvbox` to it.
