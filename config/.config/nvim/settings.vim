syntax enable                            " Enables syntax highlighting
filetype plugin on
filetype indent on

" Leader
let mapleader = ","

set iskeyword+=-                         " treat dash separated words as a word text object"
set formatoptions-=cro                   " Stop newline continution of comments

set encoding=utf-8                       " The encoding displayed
set fileencoding=utf-8                   " The encoding written to file
set fileencodings=utf-8                  " The encoding written to file
set lazyredraw                           " the screen will not be redrawn while executing macros, registers and other commands
set hidden                               " Required to keep multiple buffers open multiple buffers
set noswapfile                           " No write swap file
set nobackup                             " This is recommended by coc
set nowritebackup                        " This is recommended by coc
set noshowmode                           " We don't need to see things like -- INSERT -- anymore
set nowrap                               " Display long lines as just one line
set splitbelow                           " Horizontal splits will automatically be below
set splitright                           " Vertical splits will automatically be to the right
set laststatus=2                         " Always display the status line
set cmdheight=1                          " More space for displaying messages
set showcmd                              " Show command turn of if is slow

set autoread                             " Automatically reread changed files without asking me anything
set backspace=indent,eol,start           " Makes backspace key more powerful.
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set spell spelllang=en_us                " Set spell check

set cursorline                           " Enable highlighting of the current line
set ruler                                " Show the cursor position all the time
set pumheight=10                         " Makes popup menu smaller
set mouse=a                              " Enable your mouse
set colorcolumn=80                       " Make it obvious where 80 characters is
highlight ColorColumn ctermbg=235        " Set color to grey

set t_Co=256                             " Support 256 colors
set termguicolors                        " Enable true colors
set background=dark                      " tell vim what the background color looks like
set conceallevel=0                       " So that I can see `` in markdown files

set autoindent smartindent
set tabstop=4                            " Insert 4 spaces for a tab
set shiftwidth=4                         " Change the number of space characters inserted for indentation
set softtabstop=4                        " Number of spaces that a <Tab> counts for while performing editing operations
set smarttab                             " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                            " Converts tabs to spaces
set smartindent                          " Makes indenting smart
set autoindent                           " Good auto indent

set number                               " Line numbers
set relativenumber                       " Relative line numbers

set showtabline=2                        " Always show tabs
set shortmess+=c                         " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                       " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                       " Faster completion
set timeoutlen=100                       " By default timeoutlen is 1000 ms
set clipboard=unnamedplus                " Copy paste between vim and everything else
set incsearch ignorecase smartcase nohlsearch

" FINDING FILES:
set wildmenu                             " Display all matching files when we tab complete
set wildignore+=*.pyc,*/.git             " Ignore on find
set path+=**                             " Search down into subfolders

" DEFAULT FILE EXPLORER
let g:netrw_liststyle = 3                " File explorer tree display format
let g:netrw_winsize = 30                 " File explorer window size
let g:netrw_alto = 1                     " Change from above splitting to below splitting
let g:netrw_altv = 1                     " change from left splitting to right splitting


autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" You can't stop me
cmap w!! w !sudo tee %


