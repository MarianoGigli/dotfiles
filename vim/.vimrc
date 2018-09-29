" be iMproved, required set nocompatible
" enable syntax and plugins for netrw
syntax enable
filetype plugin on
filetype indent on
set lazyredraw
set t_Co=256
set number
set numberwidth=5
"set relativenumber
set encoding=utf-8
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=80

set ts=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching

" Leader
let mapleader = ","

" no arrows keys
"noremap <Up> <Nop>
"noremap <Down> <Nop>
"noremap <Left> <Nop>
"noremap <Right> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>

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

" set paste
set pastetoggle=<F4>

au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'vim-scripts/xoria256.vim'
Plug 'itchyny/lightline.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'davidhalter/jedi-vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitmate'
call plug#end()

colorscheme xoria256
highlight ColorColumn ctermbg=235

" lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

let g:virtualenv_auto_activate = 1
" vim-jedi config
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview

" python-mode configuration
autocmd CompleteDone * pclose
set splitbelow
let g:pymode_python = 'python3'
let g:pymode_virtualenv = 1
let g:pymode_lint_ignore = ["W391",]
let g:pymode_lint_on_fly = 1


" NEERDTree configuration
let NERDTreeNaturalSort = 1
map <F2> :NERDTreeToggle<CR>


" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
