function! Options(...)
    if a:0 == 1
        return a:1
    endif
    if a:0 > 1
        for index in range(0,a:0-2)
            if exists(a:000[index])
                exec "let value = ".a:000[index]
                if value != ""
                    return value
                endif
            endif
        endfor
        if exists(a:000[a:0-1])
            exec "let value = ".a:000[a:0-1]
            return value
        endif
        return a:000[a:0-1]
    endif
endfunction

set laststatus=2
set noruler
set statusline=\ %<%t\ %m%=\ %{&ft}\ %r\ %{&fileencoding}\ %{&fileformat}
            \\ %5l,%-3.c%V\ %3.P\ %L\ 
