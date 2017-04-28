source          ${HOME}/.vim/inc/vundle.vim
source          ${HOME}/.vim/inc/better-whitespace.vim
source          ${HOME}/.vim/inc/colors.vim
source          ${HOME}/.vim/inc/settings.vim





" === phpqa
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_args = "--standard=psr2"

" == CtrlP ==
nmap <C-Tab> :CtrlPBuffer<CR>
nmap <C-u> :CtrlPMRU<CR>

" === omnicomplete on spacebar
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" === php-vim Configs
function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" === copy paste bindings
nmap <C-V> "+gP
imap <C-V> <ESC>"+gpa
vmap <C-C> "+y

"=== auto-indentation
map <C-k> mzgg=G`z<CR>

"=== help my plox (credits to http://vimsheet.com) ~/.vim/help/AGreatVimCheatSheet.html
:map <silent> <F2> :silent !google-chrome --app="file:///home/miguel/.vim/help/AGreatVimCheatSheet.html" && sleep 0.5 && wmctrl -a "A Great Vim Cheat Sheet" -b add,above &<CR>

" === GUI View Settings
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

