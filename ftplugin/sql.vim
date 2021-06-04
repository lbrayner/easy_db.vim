" user:dbname@(host|srvname) in the statusline
function! s:define_local_statusline()
    if exists("b:dbext_user")
        let &l:statusline=' %<%t %m%= %{&ft}'
\.' %{b:dbext_type}:%{b:dbext_user}:%{b:dbext_dbname}@%{Options("b:dbext_host","b:dbext_srvname")}'
                    \.' %r'
                    \.' %{&fileencoding}'
                    \.' %-10.(%5l,%-3.c%V%) %3.P %L '
    endif
endfunction

autocmd BufWinEnter <buffer> call s:define_local_statusline()

" lines longer than the width of the window will wrap and displaying continues
" on the next line
setlocal wrap

" Mappings exclusive to sql buffers

inoremap <buffer> <f1> <c-o>:h easy_dbext_bundle.txt<cr>

inoremap <buffer> <silent> <Esc><Esc> <c-o>:only<CR>
inoremap <buffer> <silent> <f5> <c-o>:e<cr>

" delimitMate

let b:delimitMate_matchpairs = "(:),[:],{:}"
