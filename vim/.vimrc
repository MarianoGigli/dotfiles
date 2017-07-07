" be iMproved, required
set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

set t_Co=256

set number
set numberwidth=5
set relativenumber
set pastetoggle=<F4>
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=80
highlight ColorColumn ctermbg=235
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching

" no arrows keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy
" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:
" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R --exclude=@/home/mariano/.ctagsexclude .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack
" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/Dockerfile.vim'
Plug 'nvie/vim-flake8'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/argtextobj.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/xoria256.vim'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()

" airline config
set laststatus=2
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colorscheme xoria256
highlight ColorColumn ctermbg=235
