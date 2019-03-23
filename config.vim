set enc=utf-8
set listchars=eol:¬,tab:»\ ,trail:·
set modeline
"show existing tab with 4 spaces width
set tabstop=4

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

if !has("nvim")
    let s:bkp_dir = g:vim_dir."/backup"
    exe "let s:has_bkp_dir = isdirectory('".s:bkp_dir."')"
    if !s:has_bkp_dir
        call mkdir(s:bkp_dir)
    endif
    let &backupdir=s:bkp_dir."/"
endif

" ruler & statusline

set noruler
set statusline=%<%f\ %m%=\ %{&ft}\ %r\ %{&fileformat}\ %-14.(%l,%c%V%)\ %P

" Mappings

" emacs c-k behaviour
inoremap <c-k> <c-o>D
cnoremap <c-k> <c-f>D<c-c><c-c>:<up>

" Toggle insertmode
inoremap <s-f3> <c-o>:set noinsertmode<cr>:set insertmode?<cr>
nnoremap <c-f3> <c-o>:set insertmode<cr>

" list
inoremap <silent> <F12>  <c-o>:setlocal list!<CR>
nnoremap <silent> <F12>  :setlocal list!<CR>
