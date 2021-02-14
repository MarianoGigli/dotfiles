function! PackInit() abort
  packadd minpac

  call minpac#init({'verbose': 3})
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
    call minpac#add('machakann/vim-highlightedyank')
    call minpac#add('arcticicestudio/nord-vim', {'type': 'opt'})
    call minpac#add('raimondi/delimitmate')
    call minpac#add('itchyny/lightline.vim')
    call minpac#add('itchyny/vim-gitbranch')
    call minpac#add('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
endfunction

" Plugin settings here.
"...

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
