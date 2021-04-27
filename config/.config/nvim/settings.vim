set nocompatible
set encoding=utf-8
syntax enable
filetype plugin on
filetype indent on

set formatoptions-=cro
set noswapfile nobackup nowritebackup
set hidden
set autowrite autowriteall autoread
set nowrap
set laststatus=2                         " Always display the status line
set cmdheight=1                          " More space for displaying messages
set showcmd

set spell spelllang=en_us
set splitbelow splitright

set number relativenumber
set termguicolors
set background=dark
set cursorline
set signcolumn=yes
set colorcolumn=80
highlight ColorColumn ctermbg=235        " Set color to grey

set list listchars=tab:»·,trail:·,nbsp:·
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent smartindent

set shortmess+=c                         " Don't pass messages to |ins-completion-menu|.
set completeopt+=menuone,noinsert
set completeopt-=preview                 " Don't show doc preview on scratch window
set pumheight=10                         " Makes popup menu smaller
set updatetime=300                       " Faster completion
set timeoutlen=100                       " By default timeoutlen is 1000 ms
set clipboard=unnamedplus                " Copy paste between vim and everything else

set incsearch ignorecase smartcase nohlsearch
" FINDING FILES:
set wildmenu                             " Display all matching files when we tab complete
set wildignore+=*.pyc,*/.git             " Ignore on find
set path+=**                             " Search down into subfolders

