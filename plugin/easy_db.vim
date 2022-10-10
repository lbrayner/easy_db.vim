" vim-dadbob

function! s:PreserveViewPort(command)
    let winview = winsaveview()
    if type(a:command) == type(function("tr"))
        call a:command()
    else
        exe command
    endif
    call winrestview(winview)
endfunction

" Select paragraph

function! s:Do_SQL_SelectParagraph()
    exe "normal! vip:DB\<cr>"
endfunction

function! s:SQL_SelectParagraph()
    call s:PreserveViewPort(funcref("<SID>Do_SQL_SelectParagraph"))
endfunction

" TODO convert this to vim-dadbod
function! s:Do_SQL_VisualSelection()
    exe "normal! :\<c-u>call dbext#DB_execSql(DB_getVisualBlock())\<cr>"
endfunction

function! s:SQL_VisualSelection()
    call s:PreserveViewPort(funcref("<SID>Do_SQL_VisualSelection"))
endfunction

function! s:ResultsClose()
    pclose
endfunction

" Mappings

inoremap <silent> <c-return> <c-o>:call <SID>SQL_SelectParagraph()<cr>
inoremap <silent> <c-kEnter> <c-o>:call <SID>SQL_SelectParagraph()<cr>

snoremap <silent> <c-return> <esc><c-o>:call <SID>SQL_VisualSelection()<cr>

inoremap <silent> <f10> <c-o>:call <SID>ResultsClose()<cr>

" Normal Mode Mappings

nnoremap <silent> <leader><return> :call <SID>SQL_SelectParagraph()<cr>
nnoremap <silent> <leader><kEnter> :call <SID>SQL_SelectParagraph()<cr>
