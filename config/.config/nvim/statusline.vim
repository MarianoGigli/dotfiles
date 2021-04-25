" STATUS LINE
let b:gitbranch=""
function! StatuslineGitBranch()
  if &modifiable
    try
      let l:dir=expand('%:p:h')
      let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
      if !v:shell_error
        let b:gitbranch="[".substitute(l:gitrevparse, '\n', '', 'g')."]"
      endif
    catch
    endtry
  endif
endfunction

augroup GetGitBranch
  autocmd!
  autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#Visual#               " colour
set statusline+=%{&paste?'\ \ PASTE\ ':''}
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#           " colour
set statusline+=\ %{b:gitbranch}
set statusline+=\ %t\ \                 " short file name
set statusline+=%#CursorIM#             " colour
set statusline+=%R\                     " readonly flag
set statusline+=%m\                     " modified [+] flag
set statusline+=%=                      " right align
set statusline+=%#CursorLine#           " colour
set statusline+=\ %Y                    " file type
set statusline+=\ %{strlen(&fenc)?&fenc:'none'}
set statusline+=\ %{&ff}\ 
set statusline+=%#CursorIM#             " colour
set statusline+=%3l:%-2c\               " line + column
set statusline+=%#Cursor#               " colour
set statusline+=\ %3p%%\                " percentage
