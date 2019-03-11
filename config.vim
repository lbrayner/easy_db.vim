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
