if exists("g:easy_dbext_disable") && g:easy_dbext_disable
    finish
endif

if !&insertmode
    finish
endif

function! s:SQL_SelectParagraph()
    exe "normal! vip:call dbext#DB_execSql(DB_getVisualBlock())\<cr>"
endfunction

imap <silent> <c-kMinus> <c-o>:res-5<cr>
imap <silent> <c-kPlus> <c-o>:res+5<cr>

imap <silent> <f5> <c-o>:e<cr>
imap <silent> <c-return> <c-o>:call <SID>SQL_SelectParagraph()<cr>
imap <silent> <f9> <c-o><c-w>=
