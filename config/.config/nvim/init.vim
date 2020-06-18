" neovim settings
" To disable Python 2 support:
let g:loaded_python_provider = 1
" The last command reports the interpreter path. Add it to your init.vim: >
let g:python3_host_prog = '/home/mariano/.virtualenvs/python3neovim/bin/python'

call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/xoria256.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
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
set number relativenumber

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
set inccommand=split
set nowrap

" set textwidth=80
set colorcolumn=80 " Make it obvious where 80 characters is
set expandtab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

colorscheme xoria256
highlight ColorColumn ctermbg=235

" -1 make highlight persistent
let g:highlightedyank_highlight_duration = 1000

set spell spelllang=en_us
set nospell

set laststatus=2
set noshowmode

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set wildmenu " Display all matching files when we tab complete
set wildignore+=*.pyc,*/.git
set path+=**
nnoremap <Leader>f :tabf

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" DEFAULT FILE EXPLORER
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

" tab navigation
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" navigate windows with alt+motion-keys
map <M-l> <c-w>l
map <M-h> <c-w>h
map <M-k> <c-w>k
map <M-j> <c-w>j
imap <M-l> <ESC><c-w>l
imap <M-h> <ESC><c-w>h
imap <M-k> <ESC><c-w>k
imap <M-j> <ESC><c-w>j

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" set python friendly
autocmd FileType py set textwidth=79 " PEP-8 Friendly
autocmd BufWritePre *.py :%s/\s\+$//e " StripTrailingWhitespaces

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Do not show docstring on completion
autocmd FileType python setlocal completeopt-=preview

augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" lightline
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
\ }

let g:lightline.tabline = {
    \ 'left': [ [ 'tabs' ] ],
    \ 'right': [ [ 'close' ] ] }
let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

" avoid conflict with editor_config, fugitive and remote files over ssh
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
