" dbext

" - Whether to use separate result buffers for each file
let g:dbext_default_use_sep_result_buffer = 1

" Don't prompt for parameters
let g:dbext_default_prompt_for_parameters=0

" If you define a function, DBextPostResult, in your .vimrc (or elsewhere)
" it will be called automatically each time the Result buffer is updated.
function! DBextPostResult(db_type, buf_nr)
    " clearing buffer local mappings
    mapclear <buffer>
    inoremap <buffer> <silent> C <c-o>:call <SID>CloneResultBuffer()<cr>
    inoremap <buffer> <f1> <c-o>:h easy_dbext_bundle.txt<cr>
    setlocal readonly
    setlocal nomodifiable
    setlocal nomodified
    call s:ResultBufferSyntax(b:)
endfunction

function! s:ResultBufferSyntax(dbext_opts)
    if a:dbext_opts['dbext_type'] ==# "PGSQL"
        if a:dbext_opts['dbext_extra'] =~# "QUIET=off"
            if !search('^SET$')
                return
            endif
            syn region ResultFold start="\%2l" end="^SET$"
                        \ keepend transparent fold
            syn sync maxlines=20
            setlocal foldmethod=syntax
            normal! 2j
        endif
        return
    endif
    if a:dbext_opts['dbext_type'] ==# "MYSQL"
        if a:dbext_opts['dbext_extra'] =~# "vvv"
            syn region ResultFold start="^--------------$" end="^--------------$"
                        \ keepend transparent fold
            syn sync maxlines=20
            setlocal foldmethod=syntax
            normal! 2j
        endif
        return
    endif
endfunction

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

function! s:Do_SQL_VisualSelection()
    exe "normal! :\<c-u>call dbext#DB_execSql(DB_getVisualBlock())\<cr>"
endfunction

function! s:SQL_VisualSelection()
    call s:PreserveViewPort(funcref("<SID>Do_SQL_VisualSelection"))
endfunction

" Describe table

function! s:Do_SQL_DescribeTable()
    exe "normal! :\<c-u>call dbext#DB_describeTable()\<cr>"
endfunction

function! s:SQL_DescribeTable()
    call s:PreserveViewPort(funcref("<SID>Do_SQL_DescribeTable"))
endfunction

" ToggleSizeOrOpenResults

let s:toggle_window_size = 0
let s:result_window_small_size = 10

function! s:ToggleSizeOrOpenResults()
    let last_winnr = winnr()
    call dbext#DB_openResults()

    " dbext code sets modified
    setlocal readonly
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

function! s:ResultsClose()
    if dbext#DB_isResultBufferVisible()
        call dbext#DB_openResults()
        quit
    endif
endfunction

function! s:Random()
    if &sh =~# 'sh'
        return system('echo $RANDOM')[:-2]
    endif
    if has("win32") || has("win64")
        if &sh =~# 'cmd.exe'
            return system('echo %RANDOM%')[:-2]
        endif
    endif
    return -1
endfunction

function! s:CloneResultBuffer()
    let dbext_opts = b:
    let buf_nr = bufnr('%')
    let buf_name = bufname('%')
    silent! keepalt topleft 10 new
    setlocal modifiable
    setlocal noreadonly
    exec "file ".buf_name."-".s:Random()
    silent! put =getbufline(buf_nr,1,'$')
    1d_
    setlocal readonly
    setlocal nomodified
    setlocal nomodifiable
    setlocal nowrap
    setlocal nonumber
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal complete-=wbuU
    setlocal nowritebackup
    setlocal undolevels=-1
    call s:ResultBufferSyntax(dbext_opts)
    exec bufwinnr(buf_nr)."wincmd w"
endfunction

" Mappings

inoremap <silent> <c-kMinus> <c-o>:res-5<cr>
inoremap <silent> <c-kPlus> <c-o>:res+5<cr>

inoremap <silent> <c-return> <c-o>:call <SID>SQL_SelectParagraph()<cr>
inoremap <silent> <c-kEnter> <c-o>:call <SID>SQL_SelectParagraph()<cr>
inoremap <silent> <S-return> <c-o>:call <SID>SQL_DescribeTable()<cr>

snoremap <silent> <c-return> <esc><c-o>:call <SID>SQL_VisualSelection()<cr>

inoremap <silent> <c-f9> <c-o><c-w>=
inoremap <silent> <f9> <c-o>:call <SID>ToggleSizeOrOpenResults()<cr>
inoremap <silent> <f10> <c-o>:call <SID>ResultsClose()<cr>

" Normal Mode Mappings

nnoremap <silent> <leader><return> :call <SID>SQL_SelectParagraph()<cr>
nnoremap <silent> <leader><kEnter> :call <SID>SQL_SelectParagraph()<cr>
nnoremap <silent> <F9> :call <SID>ToggleSizeOrOpenResults()<cr>
