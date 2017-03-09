autocmd Filetype tex setl updatetime=10
let g:livepreview_previewer = 'evince'

Plug 'airblade/vim-gitgutter'

"""""""""" ntpeters/vim-better-whitespace

" automatically clean white spaces on save
autocmd BufEnter * EnableStripWhitespaceOnSave

"""""""""" bling/vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'
