set encoding=utf-8
set noswapfile nobackup nowritebackup
set hidden
set autowriteall
set nowrap
set spell spelllang=en_us
set splitbelow splitright

set termguicolors
set background=dark

set number relativenumber
set cursorline
set signcolumn=yes
set colorcolumn=80
highlight ColorColumn ctermbg=235        " Set color to grey

set list listchars=tab:»·,trail:·,nbsp:·
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab
set smartindent
set formatoptions-=cro

set shortmess+=c                         " Don't pass messages to |ins-completion-menu|.
set completeopt+=menuone,noinsert
set completeopt-=preview                 " Don't show doc preview on scratch window
set pumheight=10                         " Makes popup menu smaller
set updatetime=300                       " Faster completion
set timeoutlen=100                       " By default timeoutlen is 1000 ms
set clipboard=unnamedplus                " Copy paste between vim and everything else

set ignorecase smartcase nohlsearch
" FINDING FILES:
set wildmenu                             " Display all matching files when we tab complete
set wildignore+=*.pyc,*/.git             " Ignore on find
set path+=**                             " Search down into subfolders
