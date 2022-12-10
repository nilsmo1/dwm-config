" == line numbers ==
set number relativenumber

" == hlsearch ==
set hlsearch 

" == indentation ==
set autoindent expandtab smarttab tabstop=4 softtabstop=4 shiftwidth=4

" == undo ==
set undofile undodir=~/.config/nvim/.undodir

" == enable mouse ==
set mouse=a

" == plugins ==
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline' " airline
call plug#end()

" == autocmd ==
" latex live preview (https://github.com/nilsmo1/dwm-config/blob/main/sh/tex-live-preview.sh)
autocmd BufWritePost *.tex silent! !tex-live-preview.sh <afile> 
" fix tabs in makefiles
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
