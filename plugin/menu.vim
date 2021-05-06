" Save As Special
aunmenu File.Save\ As\.\.\.
amenu 0.350 &File.Save\ &As\.\.\.<Tab>:SaveAs :SaveAs<cr>
imenu File.Save\ As\.\.\.<Tab>:SaveAs <c-o>:SaveAs<cr>
" vim-eunuch
amenu 0.360 &File.&Rename\ As\.\.\.<Tab>:RenameAs :RenameAs<cr>

" Remove all trailing spaces

amenu .390 Edit.Delte\ &trailing\ whitespace<Tab>:DeleteTrailingWhitespace
            \ :DeleteTrailingWhitespace<cr>

" Copy Full Path to the Clipboard

amenu 80.50 B&uffer.Copy\ &full\ path<Tab>:FullPath :FullPath<cr>
if util#has_cygwin()
    amenu 80.55 Buffer.Copy\ full\ path\ (C&ygwin)<Tab>:FullPathCygwin :FullPathCygwin<cr>
endif
amenu 80.60 Buffer.Copy\ &relative\ path<Tab>:Path :Path<cr>
amenu 80.70 Buffer.Copy\ na&me<Tab>:Name :Name<cr>
amenu 80.100 Buffer.-Sep-	:
