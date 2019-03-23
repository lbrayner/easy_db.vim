function! s:LoopBuffers(predicate,command)
	let last_buffer = bufnr('$')
	let buffer_count = 0
	let n = 1
	while n <= last_buffer
        if eval(a:predicate)
            silent exe a:command . ' ' . n
            let buffer_count = buffer_count+1
        endif
		let n = n+1
	endwhile
    return buffer_count
endfunction

function! s:BufWipeForce(wipe_pattern)
    call s:LoopBuffers('buflisted(n) && bufname(n) =~# '
                        \ . "'" . a:wipe_pattern . "'",'bwipe!')
endfunction

function! s:BufWipeFileTypeForce(filetype)
    call s:LoopBuffers('getbufvar(n,"&ft") == '
                        \ . '"' . a:filetype . '"','bwipe!')
endfunction

" VimEnter

augroup VimEnterAutoGroup
    au!
    au VimEnter * call s:BufWipeForce('^Result$')
    au VimEnter * call s:BufWipeFileTypeForce("help")
augroup END

" Swap | File changes outside
" https://github.com/neovim/neovim/issues/2127
augroup AutoSwap
        autocmd!
        autocmd SwapExists *  call s:AS_HandleSwapfile(expand('<afile>:p'), v:swapname)
augroup END

function! s:AS_HandleSwapfile (filename, swapname)
        " if swapfile is older than file itself, just get rid of it
        if getftime(v:swapname) < getftime(a:filename)
                call delete(v:swapname)
                let v:swapchoice = 'e'
        endif
endfunction
autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
  \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
