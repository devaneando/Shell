" Sets how many lines of history VIM has to remember"
set             history=700

" Redraw only when necessary"
set             lazyredraw

" Handle paste without formating"
set             nopaste
set             pastetoggle=<F12>

" No annoying sound on errors"
set             noerrorbells
set             novisualbell
set             t_vb=
set             tm=500

"#### User Interface"
"#####################################################################"

" Turn on the Wild menu"
set             wildmenu

" Set 7 lines to the cursor - when moving vertically using j/k"
set             so=7

" Mark a line at the 120 character for you to know the line is too big
let             &colorcolumn=join(range(121,121),",")

"Always show current position"
set             ruler

" Display line numbers"
set             number

" Height of the command bar"
set             cmdheight=1

" Configure backspace so it acts as it should act"
set             backspace=eol,start,indent
set             whichwrap+=<,>,h,l

" Show matching brackets when text indicator is over them"
set             showmatch

" Disable paired bracked display"
let             loaded_matchparen = 1

" How many tenths of a second to blink when matching brackets"
set             mat=2

" Prevent copy of line numbers along with the text
" set             mouse=a

" Use spaces instead of tabs"
set             expandtab!

" Be smart when using tabs and set 4 spaces for a tab"
set             smarttab
set             shiftwidth=4
set             tabstop=4

" Linebreak on 500 characters and wrap line"
set             lbr
set             tw=500

" Auto indent"
set             ai

" Wrap lines"
set             wrap

" Enable syntax
syntax          on

"#### File handling"
"#####################################################################"

" Set utf8 as standard encoding and en_US as the standard language"
set             encoding=utf8

" Use Unix as the standard file type"
set             ffs=unix,dos,mac

" Disable backups"
set             nobackup
set             nowb
set             noswapfile

"#### Searches"
"#####################################################################"

" Highlight search results"
set             hlsearch

" Makes search act like search in modern browsers"
set             incsearch

" When searching try to be smart about cases"
set             smartcase

" Ignore case when searching"
set             ignorecase

" Ignore compiled files"
set             wildignore=*.o,*~,*.pyc

" Allow saving of files as sudo when I forgot to start vim using sudo"
cmap            w!! w !sudo tee > /dev/null %
