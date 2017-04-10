" ●▬▬▬▬▬๑۩ NERDTree ۩๑▬▬▬▬▬●

map <C-n> :NERDTreeToggle<CR>

" Defines a new group for the next commands
augroup NERDTree

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd NERDTree StdinReadPre * let s:std_in=1
autocmd NERDTree VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if only nerdtree is left opened
autocmd NERDTree bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
