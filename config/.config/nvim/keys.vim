" tab navigation
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" navigate windows with alt+motion-keys
map <silent> <S-M-l> <c-w>l
map <silent> <S-M-h> <c-w>h
map <silent> <S-M-k> <c-w>k
map <silent> <S-M-j> <c-w>j
imap <silent> <S-M-l> <ESC><c-w>l
imap <silent> <S-M-h> <ESC><c-w>h
imap <silent> <S-M-k> <ESC><c-w>k
imap <silent> <S-M-j> <ESC><c-w>j

" move between buffers
map <silent> <M-l> :bnext<CR>
map <silent> <M-h> :bprev<CR>
imap <silent> <M-l> :bnext<CR>
imap <silent> <M-h> :bprev<CR>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap <silent> J :m '>+1<CR>gv=gv
vnoremap <silent> K :m '<-2<CR>gv=gv

" rezise windows with alt+motion-keys
nnoremap <silent> <M-RIGHT> <c-w>10>
nnoremap <silent> <M-LEFT> <c-w>10<
nnoremap <silent> <M-UP> <c-w>10+
nnoremap <silent> <M-DOWN> <c-w>10-
