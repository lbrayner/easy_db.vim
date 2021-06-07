" user[:dbname]@(host|srvname)[:port] in the statusline
function! s:define_local_statusline()
    if exists("b:dbext_user")
        let &l:statusline=' %<%t %m%= '
                    \.' %{b:dbext_type}:%{b:dbext_user}'
                    \.'%{util#statusline_dbext_var("b:dbext_dbname")}@'
                    \.'%{util#Options("b:dbext_host","b:dbext_srvname","localhost")}'
                    \.'%{util#statusline_dbext_var("b:dbext_port")}'
                    \.' %r %{&fileencoding}'
                    \.' %5l,%-3.c%V %3.P %L '
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
