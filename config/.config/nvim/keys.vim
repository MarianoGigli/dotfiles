" navigate windows with alt+motion-keys
nnoremap <silent> <S-M-l> <c-w>l
nnoremap <silent> <S-M-h> <c-w>h
nnoremap <silent> <S-M-k> <c-w>k
nnoremap <silent> <S-M-j> <c-w>j
inoremap <silent> <S-M-l> <ESC><c-w>l
inoremap <silent> <S-M-h> <ESC><c-w>h
inoremap <silent> <S-M-k> <ESC><c-w>k
inoremap <silent> <S-M-j> <ESC><c-w>j

" move between buffers
nnoremap <silent> <M-l> :bnext<CR>
nnoremap <silent> <M-h> :bprev<CR>
inoremap <silent> <M-l> :bnext<CR>
inoremap <silent> <M-h> :bprev<CR>

" rezise windows with alt+motion-keys
nnoremap <silent> <M-RIGHT> <c-w>10>
nnoremap <silent> <M-LEFT> <c-w>10<
nnoremap <silent> <M-UP> <c-w>10+
nnoremap <silent> <M-DOWN> <c-w>10-

" completion
inoremap <C-Space> <C-X><C-O>
