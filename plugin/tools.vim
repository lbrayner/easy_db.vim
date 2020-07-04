" Copy text to the system clipboard

function! Clip(...)
    if a:0 > 0
        let text = a:1
        if type(a:1) != type("")
            let text = string(a:1)
        endif
        let @"=text
    endif
    let @+=@" | let @*=@"
    if stridx(getreg('"'),"\n") < 0 && len(getreg('"')) <= &columns*0.9
        echo @"
    elseif len(getreg('"',1,1)) > 2
        echo len(getreg('"',1,1)) . " lines clipped"
    endif
endfunction

function! Path()
    return expand("%")
endfunction

function! FullPath()
    return expand("%:p:~")
endfunction

function! Name()
    return expand("%:t")
endfunction

" Copy Path to the Clipboard

command! Path call Clip(Path())
command! FullPath call Clip(FullPath())
command! Name call Clip(Name())
