call plug#begin("$HOME/.local/share/nvim/plugged")
" Make sure you use single quotes
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/xoria256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
