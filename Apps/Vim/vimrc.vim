source ${HOME}/.vim/inc/vundle.vim
source ${HOME}/.vim/inc/startify.vim
source ${HOME}/.vim/inc/settings.vim

" === NERDTree
nmap <C-n> :NERDTreeToggle<CR>
set laststatus=2

" GoldenView
let g:goldenview__enable_default_mapping = 0
nmap <silent> <Tab> <Plug>GoldenViewNext

" === Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'

" === easymotion
let g:EasyMotion_leader_key = '`'
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_smartcase = 1

" === phpqa
let g:phpqa_messdetector_autorun = 0
let g:phpqa_codesniffer_args = "--standard=psr2"

" == CtrlP ==
nmap <C-Tab> :CtrlPBuffer<CR>
nmap <C-u> :CtrlPMRU<CR>

"== Ctrl funky
nnoremap <C-f> :CtrlPFunky<Cr>

" === phpcomplete
let g:phpcomplete_index_composer_command = 'composer'
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP
set completeopt=longest,menuone

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

" === ColorScheme
colorscheme molokai

" === GUI View Settings
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

