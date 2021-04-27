" STATUS LINE
set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Visual#               " colour
set statusline+=%{&paste?'\ \ PASTE\ ':''}
set statusline+=%#CursorLine#
set statusline+=\ %t\                   " short file name
set statusline+=%#CursorIM#
set statusline+=%R\                     " readonly flag
set statusline+=%m\                     " modified [+] flag
set statusline+=%=                      " right align
set statusline+=%#CursorLine#
set statusline+=\ %Y                    " file type
set statusline+=\ %{strlen(&fenc)?&fenc:'none'}
set statusline+=\ %{&ff}\               " file format
set statusline+=%#CursorIM#
set statusline+=\ %l:%c\                " lines:column
