" be iMproved, required set nocompatible
" enable syntax and plugins for netrw
syntax enable
filetype plugin on
filetype indent on

" Leader
let mapleader = ","

set splitbelow
set lazyredraw
set t_Co=256
set number
set encoding=utf-8
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=80
set autoread " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.

set ts=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" set python friendly
autocmd FileType py set autoindent
autocmd FileType py set smartindent
autocmd FileType py set textwidth=79 " PEP-8 Friendly

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching

" Display all matching files when we tab complete
set wildmenu
set wildignore+=*.pyc,*/.git

set laststatus=2
set noshowmode

" set paste
set pastetoggle=<F4>
set spell spelllang=en_us
set nospell

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
nnoremap <Leader>f :tabf

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


call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes
Plug 'vim-scripts/xoria256.vim'
Plug 'itchyny/lightline.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

colorscheme xoria256
highlight ColorColumn ctermbg=235

" lightline config
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" neovim settings
" To disable Python 2 support:
let g:loaded_python_provider = 1
" The last command reports the interpreter path. Add it to your init.vim: >
let g:python3_host_prog = '/home/mariano/.virtualenvs/python3neovim/bin/python'

" ale config
let g:ale_completion_enabled = 1
let g:ale_open_list = 'on_save'
let g:ale_list_window_size = 5
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
let b:ale_fixers = {
\   'python': ['autopep8'],
\   'python3': ['autopep8']
\}
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

" StripTrailingWhitespaces
autocmd BufWritePre *.py :%s/\s\+$//e

" tab navigation mappings
map tt :tabnew 
map tn :tabn<CR>
map tp :tabp<CR>

" navigate windows with alt+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j
