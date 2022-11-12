set number
set hlsearch

syntax on
:colo desert
set encoding=UTF-8

set mouse=a

set autoindent
set expandtab
set tabstop=4

set undofile
set undodir=~/.vim/undodir

autocmd BufWritePost *.tex silent! !tex-live-preview.sh <afile>
