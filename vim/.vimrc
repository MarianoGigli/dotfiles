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
nnoremap <Leader>f :tabf 

" Display all matching files when we tab complete
set wildmenu
set wildignore+=*.pyc

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

set spell spelllang=en_us
set nospell

au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'vim-scripts/xoria256.vim'
Plug 'itchyny/lightline.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
call plug#end()

colorscheme xoria256
highlight ColorColumn ctermbg=235

" lightline config
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" ale config
let g:ale_completion_enabled = 1
let g:ale_open_list = 'on_save'
let g:ale_list_window_size = 5
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_fix_on_save = 0
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'python3': ['flake8', 'pylint'],
\}

augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

"let g:virtualenv_auto_activate = 1
" vim-jedi config
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 1
autocmd FileType python setlocal completeopt-=preview

autocmd CompleteDone * pclose
set splitbelow

" NEERDTree configuration
let NERDTreeNaturalSort = 1
map <F2> :NERDTreeToggle<CR>

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
