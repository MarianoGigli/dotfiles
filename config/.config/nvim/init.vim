" neovim settings
"Python 3 support:
"let g:loaded_python3_provider = 1
let g:python3_host_prog = '/home/mariano/.virtualenvs/python3neovim/bin/python'

" initialize packages
source $HOME/.config/nvim/pack.vim
" base settings
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/statusline.vim
" themes configurations
source $HOME/.config/nvim/themes-config/nord.vim
" plugins configurations
source $HOME/.config/nvim/packages-config/highlightedyank.vim
source $HOME/.config/nvim/go.vim
" key bindings
source $HOME/.config/nvim/keys.vim

