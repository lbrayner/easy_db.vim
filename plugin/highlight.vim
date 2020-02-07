function! s:WhiteSpaceErrorHighlight()
    highlight WhiteSpaceError ctermbg=red ctermfg=white guibg=#ff0000
endfunction

call s:WhiteSpaceErrorHighlight()

" SQL

function! s:HighlightWhiteSpaceError()
    if "sql" ==# &ft
        match WhiteSpaceError /\s\+$/
    endif
endfunction

" Highlighting

augroup HighlightAndMatch
    autocmd!
    autocmd ColorScheme * call s:WhiteSpaceErrorHighlight()
    autocmd VimEnter * call s:HighlightWhiteSpaceError()
    autocmd WinEnter,BufWinEnter sql call s:HighlightWhiteSpaceError()
    autocmd BufWinLeave * call clearmatches()
augroup END
