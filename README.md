This is a Vim distribution. It is meant to be used in Easy Mode.

# Requirements

It requires gVim 8.0 or greater (_+packages_).

# Packages

It's bundled with a few plugins as `git` _submodules_. To wit:

- [dbext.vim](https://github.com/lbrayner/dbext.vim) (a fork with a few bug
  fixes and tweaks)
- [delimitMate](https://github.com/Raimondi/delimitMate)
- [vim-afterglow](https://github.com/danilo-augusto/vim-afterglow)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-diminactive](https://github.com/blueyed/vim-diminactive)
- [vim-obsession](https://github.com/tpope/vim-obsession.git)

The main one is __dbext.vim__, which, in the author's own words, _...contains
functions/mappings/commands to enable Vim to access several databases_. 

The only one that changes the behavior of the editor is
[delimitMate](https://github.com/Raimondi/delimitMate): it _...provides automatic
closing of quotes, parenthesis, brackets, etc., besides some other related
features that should make your time in insert mode a little bit easier..._

# Easy mode

```
-y    Easy mode.  ...  Starts with 'insertmode' set and behaves like a click-and-type
      editor. This sources the script $VIMRUNTIME/evim.vim.  Mappings are set up to
      work like most click-and-type editors, see evim-keys.  The GUI is started when
      available. {not in Vi}
```

# Setup

```
$ git clone 'https://github.com/lbrayner/easy_dbext_bundle.vim'
$ cd easy_dbext_bundle.vim
easy_dbext_bundle.vim$ git submodule update --init
```

# How to start it

Use `init.vim` as _vimrc_ with the `-u` flag: it will make this repository the
effective _.vim_ folder, removing the standard locations from the _RUNTIMEPATH_.
It's meant to be used with __gVim Easy__, so:

```
easy_dbext_bundle.vim$ gvim -y -u init.vim
```

Make a script of it or a Windows shortcut.

## Setting up a connection

The best way to configure a connection is on a per file basis, with _dbext_
modelines. If you're not sure what modelines are, consult the help files
(`:h modelines`).

As an example, the following _dbext_ modeline defines a PostgreSQL connection:

~~~
-- dbext:type=PGSQL:user=baka:host=127.0.0.1:extra=--variable=QUIET=off
~~~

Note that the following parameters are set:

- `type=PGSQL`;
- `user=baka`;
- `host=127.0.0.1`;
- `extra=--variable=QUIET=off`.

The `extra` parameter is delivered verbatim to the underlying program (in this
case, `psql`).

`psql` requires an empty `$HOME/.pgpass` file with permissions set to _0600_.
Beacause of quirks and details such as this, it's recommended trying to setup a
connection on regular Vim first, so that you can follow the documentation as
intended.

Please refer to the [dbext.vim](https://github.com/vim-scripts/dbext.vim)
documentation for instructions on how to connect to a specific solution (Oracle,
MySQL, SQL Server, PostgreSQL etc.).

# Mappings (Insert Mode)

- `CTRL-Enter`: execute SQL (SQL, DML or DDL) in paragraph.
- `CTRL-Enter` (Select-mode): execute SQL (SQL, DML or DDL) in selection.
- `SHIFT-Enter`: describe table under cursor.
- `F1`: show these (and more) mappings (SQL and Result buffers only).
- `F2`: toggle _hlsearch_ (when there is a previous search pattern, highlight
  all its matches).
- `F5`: refresh the file (`:e`) to reload the _dbext_ modelines (SQL buffers
  only).
- `F8`: toggle _wrap_ (when on, lines longer than the width of the window will
  wrap and displaying continues on the next line).
- `F9`: open __Result__ if in a buffer other than it; toggle its size (_tall_ or
  _short_) when in it.
- `F10`: close the __Result__ buffer.
- `F12`: toggle List mode (useful to see the difference between tabs and spaces
  and for trailing blanks).
- `CTRL-NumpadMinus`: resize the window with -5 as parameter.
- `CTRL-NumpadPlus`: resize the window with +5 as parameter.
- `CTRL-F9`: equalize all windows.
- `ESC ESC`: close all windows except the current one (SQL buffers only).

Result buffer mappings:

- `C`: clone the buffer (displays the current results in a separate window at
  the top).

These facilitate other plugins' functionalities:

- `ALT-/`: toggle comment — it also works on selected text (_vim-commentary_).

# Maintainer's mappings

Insert mode:

- `SHIFT-F3`: _set noinsertmode_, effectively disabling Easy Mode so that the
  maintainer may expect normal Vim behavior.
- `F12`: toggle _list_ to, for example, differentiate between tabs and spaces.

Normal mode:

- `CTRL-F3`: _set insertmode_ to re-enable Easy Mode.
- `F12`: same as above.

# Other mappings

Insert mode:

- `CTRL-K`: behave like Emacs' _C-K_, i.e., kill-line (erase everything until the
  end of the line).

Command-line mode:

- `CTRL-K`: same as above.

# Trailing spaces

Trailing white space is highlighted in red.

# Custom menu items

They are:

- Remove trailing spaces, in Edit;
- Copy full path, in Buffer;
- Copy full path (Cygwin), in Buffer;
- Copy relative path, in Buffer;
- Copy name, in Buffer;

# Helptags

On _easy_dbext_bundle.vim_, don't forget to `:helptags ALL` (`C-L` will take you
to Normal mode in Easy Mode). Ignore the errors.

# vim-obsession

> _Vim features a_ `:mksession` _command to write a file containing the current state_
> _of Vim: window positions, open folds, stuff like that._

If you're setting this up for someone else, don't forget to use tpope's
[vim-obsession](https://github.com/tpope/vim-obsession.git).

On _easy_dbext_bundle.vim_, run the command `:Obsession` with a filename (e.g.
_sessions/session.vim_), which will be the Vim session file.

```
:Obsession sessions/session.vim
```

(The _sessions_ directory is created automatically when you start up
_easy_dbext_bundle.vim_.)

To resume the session:

```
easy_dbext_bundle.vim$ gvim -y -S sessions/session.vim -u init.vim
```

# Local configuration

Local packages can be installed in `pack/local`; and local configuration should
reside in `config.local.vim` (both inside the _easy_dbext_bundle.vim_
directory). For example, suppose you want to install the
[gruvbox](https://github.com/morhetz/gruvbox) color scheme:

```
easy_dbext_bundle.vim$ git clone 'https://github.com/morhetz/gruvbox' pack/local/start/gruvbox
```

Then create `config.local.vim` inside _easy_dbext_bundle.vim_ and add
`colorscheme gruvbox` to it.

GUI local configuration should reside in `ginit.local.vim`.
