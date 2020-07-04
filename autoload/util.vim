" a string or a 0-arg funcref
function! util#PreserveViewPort(command)
    let lazyr = &lazyredraw
    try
        set lazyredraw
        let winview = winsaveview()
        if type(a:command) == type(function("tr"))
            call a:command()
        else
            exe a:command
        endif
        call winrestview(winview)
    finally
        let &lazyredraw = lazyr
    endtry
endfunction

function! util#cygwin_dir()
    return 'c:/cygwin64/bin'
endfunction

function! util#has_cygwin()
    if has("win32") || has("win64")
        if isdirectory(util#cygwin_dir())
            return 1
        endif
    endif
    return 0
endfunction
