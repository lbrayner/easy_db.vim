function! DBextPostResult(...)
    " removing an undesirable mapping
    unmap <buffer> q
    set nomodifiable
endfunction
