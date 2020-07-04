" Save As Special
aunmenu File.Save\ As\.\.\.
amenu 0.350 &File.Save\ &As\.\.\.<Tab>:SaveAs :SaveAs<cr>
imenu File.Save\ As\.\.\.<Tab>:SaveAs <c-o>:SaveAs<cr>

" Remove all trailing spaces

amenu .390 Edit.Remove\ &trailing\ spaces<Tab>:RemoveTrailingSpaces
            \ :RemoveTrailingSpaces<cr>

" Copy Full Path to the Clipboard

amenu .50 Tools.Copy\ &full\ path<Tab>:FullPath :FullPath<cr>
if util#has_cygwin()
    amenu .55 Tools.Copy\ full\ path\ (C&ygwin)<Tab>:FullPathCygwin :FullPathCygwin<cr>
endif
amenu .60 Tools.Copy\ &relative\ path<Tab>:Path :Path<cr>
amenu .70 Tools.Copy\ na&me<Tab>:Name :Name<cr>
amenu .100 Tools.-Sep-	:
