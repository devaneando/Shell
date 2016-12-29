" ●▬▬▬▬▬๑۩ Vundle ۩๑▬▬▬▬▬●

" Required - do not touch!
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle/')

" vim usability plugins
Plugin 'scrooloose/nerdtree'
Plugin 'taiansu/nerdtree-ag'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'vim-scripts/AfterColors.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'kiddos/malokai.vim'

" tools plugins
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Shougo/vimproc.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'

" programming languages plugins
Plugin 'StanAngeloff/php.vim'
Plugin 'm2mdas/phpcomplete-extended'
Plugin 'joonty/vim-phpqa'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'groenewege/vim-less'
Plugin 'evidens/vim-twig'
Plugin 'stephpy/vim-yaml'

" Latex plugins
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'bjoernd/vim-ycm-tex'

call vundle#end()
filetype plugin indent on
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
