if exists("g:easy_dbext_disable") && g:easy_dbext_disable
    finish
endif

if !&insertmode || !has("gui_running")
    finish
endif

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
    exe "normal! vip:\<c-u>call dbext#DB_execSql(DB_getVisualBlock())\<cr>"
endfunction

function! s:SQL_SelectParagraph()
    call s:PreserveViewPort(funcref("<SID>Do_SQL_SelectParagraph"))
endfunction

" Describe table

function! s:Do_SQL_DescribeTable()
    exe "normal! :\<c-u>call dbext#DB_describeTable()\<cr>"
endfunction

function! s:SQL_DescribeTable()
    call s:PreserveViewPort(funcref("<SID>Do_SQL_DescribeTable"))
endfunction

imap <f1> <c-o>:h easy_dbext_bundle.txt<cr>

imap <silent> <f5> <c-o>:e<cr>

imap <silent> <c-kMinus> <c-o>:res-5<cr>
imap <silent> <c-kPlus> <c-o>:res+5<cr>

imap <silent> <f5> <c-o>:e<cr>
imap <silent> <c-return> <c-o>:call <SID>SQL_SelectParagraph()<cr>
imap <silent> <S-return> <c-o>:call <SID>SQL_DescribeTable()<cr>

let s:toggle_window_size = 0
let s:result_window_small_size = 10

function! s:ToggleSizeOrOpenResults()
    let last_winnr = winnr()
    call dbext#DB_windowOpen()

    " dbext code sets modified
    setlocal nomodifiable
    setlocal nomodified

    let current_winnr = winnr()
    if last_winnr != current_winnr
        return
    endif
    if s:toggle_window_size == 0
        exe "res " . (&lines - 20)
    endif
    if s:toggle_window_size == 1
        exe "res " . s:result_window_small_size
    endif
    let s:toggle_window_size = (s:toggle_window_size+1)%2
endfunction

imap <silent> <c-f9> <c-o><c-w>=
imap <silent> <f9> <c-o>:call <SID>ToggleSizeOrOpenResults()<cr>
imap <silent> <f10> <c-o>:DBResultsClose<cr>
