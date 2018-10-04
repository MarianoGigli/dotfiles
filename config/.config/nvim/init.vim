" neovim settings
" To disable Python 2 support:
let g:loaded_python_provider = 1
" The last command reports the interpreter path. Add it to your init.vim: >
let g:python3_host_prog = '/home/mariano/.virtualenvs/python3neovim/bin/python'

call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes
Plug 'vim-scripts/xoria256.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'davidhalter/jedi-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" be iMproved, required set nocompatible
" enable syntax and plugins for netrw
syntax enable
filetype plugin on
filetype indent on

" Leader
let mapleader = ","

set t_Co=256
set splitbelow
set lazyredraw
set number

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

set autoread " Automatically reread changed files without asking me anything
set backspace=indent,eol,start  " Makes backspace key more powerful.
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands

set incsearch     " do incremental searching
set ignorecase
set smartcase
set nohlsearch

set nowrap
set autoindent

set textwidth=80
set colorcolumn=80 " Make it obvious where 80 characters is
set ts=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set spell spelllang=en_us
set nospell

set laststatus=2
set noshowmode

set pastetoggle=<F4>

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set wildmenu " Display all matching files when we tab complete
set wildignore+=*.pyc,*/.git
set path+=**
nnoremap <Leader>f :tabf

" set python friendly
autocmd FileType py set autoindent
autocmd FileType py set smartindent
autocmd FileType py set textwidth=79 " PEP-8 Friendly

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

autocmd BufWritePre *.py :%s/\s\+$//e " StripTrailingWhitespaces


if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

colorscheme xoria256
highlight ColorColumn ctermbg=235

" jedi config
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "2"
autocmd FileType python setlocal completeopt-=preview

" ale config
let g:ale_completion_enabled = 0
let g:ale_open_list = 0
let g:ale_list_window_size = 5
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
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" tab navigation
map tt :tabnew 
map tn :tabn<CR>
map tp :tabp<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" navigate windows with alt+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" default file explorer
"*g:netrw_browse_split*	when browsing, <cr> will open the file by:
"=0: re-using the same window  (default)
"=1: horizontally splitting the window first
"=2: vertically   splitting the window first
"=3: open file in new tab
map <F2> :Texplore<CR>
map <F3> :Vexplore<CR>
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 25



" vim-airline
let g:airline_theme = 'atomic' " 'minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = ''
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  "let g:airline#extensions#ale#error_symbol = ''
  "let g:airline#extensions#ale#warning_symbol = ''
endif
