" Many settings here are taken from tpope's vim-sensible
" https://github.com/tpope/vim-sensible
set encoding=utf-8
filetype plugin indent on
set nocompatible
syntax on
set modeline
"show existing tab with 4 spaces width

set listchars=eol:¬,tab:»\ ,trail:·

set wildmenu

set ttimeout
" Time in milliseconds to wait for a key code sequence to complete
set ttimeoutlen=0

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set tabstop=4
set shiftwidth=4

set incsearch

set autoread

set ignorecase

set lazyredraw

set number

set nowrap

if has("win32") || has("win64")
    set shellslash
endif

if has("linebreak")
    set breakindent
endif

" ruler & statusline

set laststatus=2
set noruler
set statusline=%<%f\ %m%=\ %{&ft}\ %r\ %{&fileencoding}\ %{&fileformat}
            \\ %-14.(%l,%c%V%)\ %P\ %L

" setting dir

if !has("nvim")
    let s:swap_dir = g:vim_dir."/swap"
    exe "let s:has_swap_dir = isdirectory('".s:swap_dir."')"
    if !s:has_swap_dir
        call mkdir(s:swap_dir)
    endif
    let &dir=s:swap_dir."//"
endif

" setting backupdir

let s:bkp_dir = g:vim_dir."/backup"
exe "let s:has_bkp_dir = isdirectory('".s:bkp_dir."')"
if !s:has_bkp_dir
    call mkdir(s:bkp_dir)
endif
let &backupdir=s:bkp_dir."/"

" setting undodir

if !has("nvim")
    let s:undo_dir = g:vim_dir."/undo"
    exe "let s:has_undo_dir = isdirectory('".s:undo_dir."')"
    if !s:has_undo_dir
        call mkdir(s:undo_dir)
    endif
    let &undodir=s:undo_dir."/"
endif

" creating the sessions dir if it doesn't exist

let s:sessions_dir = g:vim_dir."/sessions"
exe "let s:has_sessions_dir = isdirectory('".s:sessions_dir."')"
if !s:has_sessions_dir
    call mkdir(s:sessions_dir)
endif

if &synmaxcol == 3000
  " Lowering this improves performance in files with long lines.
  set synmaxcol=500
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Mappings

" emacs c-k behaviour
inoremap <c-k> <c-o>D
cnoremap <c-k> <c-f>D<c-c><c-c>:<up>

" Toggle

"  insertmode
inoremap <s-f3> <c-o>:set noinsertmode insertmode?<cr>
nnoremap <c-f3> :set insertmode<cr>

"  highlight search
inoremap <silent> <f2> <c-o>:set invhlsearch hlsearch?<cr>
nnoremap <silent> <f2> :set invhlsearch hlsearch?<cr>

"  wrap
inoremap <f8> <c-o>:setlocal wrap! wrap?<CR>
nnoremap <f8> :setlocal wrap! wrap?<CR>

" list
inoremap <silent> <F12>  <c-o>:setlocal list!<CR>
nnoremap <silent> <F12>  :setlocal list!<CR>

" vim-commentary

inoremap <silent> <M-/> <c-o>:Commentary<cr>
snoremap <silent> <M-/> <c-o>:Commentary<cr>
