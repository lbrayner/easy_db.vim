set modeline

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
