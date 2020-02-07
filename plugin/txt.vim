command! -bar -range=% RemoveTrailingSpaces
            \ call util#PreserveViewPort('keeppatterns '.<line1>.','.<line2>.'s/\s\+$//e')
