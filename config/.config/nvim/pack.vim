function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Additional plugins here.
    call minpac#add('machakann/vim-highlightedyank')
    call minpac#add('vim-scripts/xoria256.vim')
    call minpac#add('arcticicestudio/nord-vim')
    call minpac#add('drewtempelmeyer/palenight.vim')
    call minpac#add('raimondi/delimitmate')
    call minpac#add('tpope/vim-fugitive')
    call minpac#add('ctrlpvim/ctrlp.vim')
    call minpac#add('itchyny/lightline.vim')
endfunction

" Plugin settings here.
"...

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()
