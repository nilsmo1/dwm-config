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

" == encoding ==
set encoding=UTF-8

" == plugins ==
call plug#begin()
Plug 'https://github.com/vim-airline/vim-airline'           " airline
Plug 'https://github.com/preservim/nerdtree'                " nerdtree
Plug 'https://github.com/ryanoasis/vim-devicons'            " devicons
Plug 'https://github.com/PhilRunninger/nerdtree-buffer-ops' " nerdtree-buffer-ops
Plug 'https://github.com/tpope/vim-commentary'              " comment with gcc and gc
Plug 'https://github.com/rafi/awesome-vim-colorschemes'     " color schemes
call plug#end()

" == colorscheme ==
:colorscheme sonokai

" == keybinds ==
" nerdtree
nnoremap <C-f>  :NERDTreeFocus<CR>
nnoremap <C-t>  :NERDTreeToggle<CR>

" == autocmd ==
" latex live preview (https://github.com/nilsmo1/dwm-config/blob/main/sh/tex-live-preview.sh)
autocmd BufWritePost *.tex silent! !tex-live-preview.sh <afile> 
" fix tabs in makefiles
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
