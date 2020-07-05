" lines longer than the width of the window will wrap and displaying continues
" on the next line
setlocal wrap

" Mappings exclusive to sql buffers

inoremap <buffer> <f1> <c-o>:h easy_dbext_bundle.txt<cr>

inoremap <buffer> <silent> <Esc><Esc> <c-o>:only<CR>
inoremap <buffer> <silent> <f5> <c-o>:e<cr>

" delimitMate

let b:delimitMate_matchpairs = "(:),[:],{:}"
