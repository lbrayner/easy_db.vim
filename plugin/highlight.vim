function! s:Hightlight()
    highlight WhiteSpaceError ctermbg=red ctermfg=white guibg=#ff0000
endfunction

call s:Hightlight()

" SQL

function! s:Match()
    if "sql" ==# &ft
        match WhiteSpaceError /\s\+$/
    endif
endfunction

" Highlighting

augroup HighlightAndMatch
    autocmd!
    autocmd ColorScheme * call s:Hightlight()
    autocmd VimEnter * call s:Match()
    autocmd WinEnter,BufWinEnter * call s:Match()
    autocmd BufWinLeave * call clearmatches()
augroup END
