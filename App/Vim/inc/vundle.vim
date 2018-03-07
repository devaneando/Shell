" ●▬▬▬▬▬๑۩ Vundle ۩๑▬▬▬▬▬●

" Required - do not touch!
set             nocompatible
filetype        off

" set the runtime path to include Vundle and initialize
set             rtp+=~/.vim/bundle/Vundle.vim

call            vundle#begin('~/.vim/bundle/')

"""""""""" Usability plugins

" Lean & mean status/tabline for vim that's light as air.
Plugin          'bling/vim-airline'
Plugin          'vim-airline/vim-airline-themes'

" Allows you to create an after/colors/ script for customizing any colorscheme.
"Plugin          'vim-scripts/AfterColors.vim'

" This plugin causes all trailing whitespace characters (see Supported Whitespace Characters below) to be highlighted.
Plugin          'ntpeters/vim-better-whitespace'

"""""""""" Color scheme

Plugin          'kiddos/malokai.vim'

"""""""""" tools plugins

" A Vim plugin which shows a git diff in the 'gutter' (sign column). It shows whether each line has been added, modified, and where lines have been removed.
Plugin          'airblade/vim-gitgutter'

" I'm not going to lie to you; fugitive.vim may very well be the best Git wrapper of all time. Check out these features:
Plugin          'tpope/vim-fugitive'

" Comment stuff out.
Plugin          'tpope/vim-commentary'

"""""""""" Syntax highlight
Plugin          'evidens/vim-twig'
Plugin          'groenewege/vim-less'
Plugin          'jelera/vim-javascript-syntax'
Plugin          'smerrill/vcl-vim-plugin'
Plugin          'StanAngeloff/php.vim'
Plugin          'stephpy/vim-yaml'
Plugin          'vim-scripts/httplog'
Plugin          'vim-scripts/nginx.vim'

"""""""""" Latex plugins
Plugin          'xuhdev/vim-latex-live-preview'
Plugin          'bjoernd/vim-ycm-tex'

call            vundle#end()
filetype        plugin indent on

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
