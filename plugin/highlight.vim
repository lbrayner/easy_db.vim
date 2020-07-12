function! WhiteSpaceErrorGroup()
    highlight WhiteSpaceError ctermbg=red ctermfg=white guibg=#ff0000
endfunction

call WhiteSpaceErrorGroup()

function! HighlightWhiteSpaceError()
    if &syntax !~# 'sql'
        call ClearWhiteSpaceError()
        return
    endif
    call ClearWhiteSpaceError()
    let w:WhiteSpaceErrorID = matchadd("WhiteSpaceError",'\s\+$')
endfunction

function! ClearWhiteSpaceError()
    if exists("w:WhiteSpaceErrorID")
        silent! call matchdelete(w:WhiteSpaceErrorID)
        unlet w:WhiteSpaceErrorID
    endif
endfunction

augroup HighlightAndMatch
    autocmd!
    autocmd ColorScheme * call WhiteSpaceErrorGroup()
    autocmd BufWinLeave * call ClearWhiteSpaceError()
    " BufWinEnter covers all windows on startup (think of sessions)
    autocmd BufWinEnter * call HighlightWhiteSpaceError()
    " But it becomes insufficient and redundant after that
    autocmd VimEnter * autocmd! HighlightAndMatch BufWinEnter
    autocmd VimEnter * autocmd HighlightAndMatch
                \ WinEnter,Syntax * call HighlightWhiteSpaceError()
    autocmd VimEnter * call HighlightWhiteSpaceError()
augroup END
