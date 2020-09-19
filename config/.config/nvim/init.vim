" neovim settings
" To disable Python 2 support:
let g:loaded_python_provider = 1
" The last command reports the interpreter path. Add it to your init.vim: >
let g:python3_host_prog = '/home/mariano/.virtualenvs/python3neovim/bin/python'

" initialize plugins
source $HOME/.config/nvim/vim-plug.vim
" base settings
source $HOME/.config/nvim/settings.vim
" themes configurations
source $HOME/.config/nvim/themes-config/lightline.vim
source $HOME/.config/nvim/themes-config/nord.vim
" plugins configurations
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/ctrlp.vim
source $HOME/.config/nvim/plug-config/highlightedyank.vim
" key bindings
source $HOME/.config/nvim/keys.vim
