function! TrailingWhiteSpaceGroup()
    highlight TrailingWhiteSpace ctermbg=red ctermfg=white guibg=#ff0000
endfunction

call TrailingWhiteSpaceGroup()

function! HighlightTrailingWhiteSpace()
    if &syntax !~# 'sql'
        call ClearTrailingWhiteSpace()
        return
    endif
    call ClearTrailingWhiteSpace()
    let w:TrailingWhiteSpaceID = matchadd("TrailingWhiteSpace",'\s\+$')
endfunction

function! ClearTrailingWhiteSpace()
    if exists("w:TrailingWhiteSpaceID")
        silent! call matchdelete(w:TrailingWhiteSpaceID)
        unlet w:TrailingWhiteSpaceID
    endif
endfunction

augroup HighlightAndMatch
    autocmd!
    autocmd ColorScheme * call TrailingWhiteSpaceGroup()
    autocmd BufWinLeave * call ClearTrailingWhiteSpace()
    " BufWinEnter covers all windows on startup (think of sessions)
    autocmd BufWinEnter * call HighlightTrailingWhiteSpace()
    " But it becomes insufficient and redundant after that
    autocmd VimEnter * autocmd! HighlightAndMatch BufWinEnter
    autocmd VimEnter * autocmd HighlightAndMatch
                \ WinEnter,Syntax * call HighlightTrailingWhiteSpace()
    autocmd VimEnter * call HighlightTrailingWhiteSpace()
augroup END
