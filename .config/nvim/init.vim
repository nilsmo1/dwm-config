set number relativenumber hlsearch encoding=UTF-8
set autoindent expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4
set undofile undodir=~/.config/.vim/undodir
set mouse=a
syntax on

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'

call plug#end()

autocmd BufWritePost *.tex silent! !tex-live-preview.sh <afile>
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
