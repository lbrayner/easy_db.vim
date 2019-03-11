if exists("g:easy_dbext_disable") && g:easy_dbext_disable
    finish
endif

if !&insertmode || !has("gui_running")
    finish
endif

function! s:SQL_SelectParagraph()
    exe "normal! vip:\<c-u>call dbext#DB_execSql(DB_getVisualBlock())\<cr>"
endfunction

imap <silent> <c-kMinus> <c-o>:res-5<cr>
imap <silent> <c-kPlus> <c-o>:res+5<cr>

imap <silent> <f5> <c-o>:e<cr>
imap <silent> <c-return> <c-o>:call <SID>SQL_SelectParagraph()<cr>

let s:toggle_window_size = 0
let s:result_window_small_size = 10

function! s:ToggleSizeOrOpenResults()
    let last_winnr = winnr()
    call dbext#DB_windowOpen()
    " dbext code sets modified
    if !&modifiable
        set nomodified
    endif
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
