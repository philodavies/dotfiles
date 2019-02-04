" This is Philippe Davies' vimrc
" Version 0.4



" Plugins ------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Visual Plugins
Plug 'itchyny/lightline.vim'

" Vim Tabs?
Plug 'ap/vim-buftabline'

" Code completion
Plug 'valloric/youcompleteme'

" Code commenting
Plug 'tpope/vim-commentary'

call plug#end()

" tabs and indenting ------------------------------------------------------
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4


" Show line numbers by default --------------------------------------------
set number

syntax on
color slate



" Set escape key to be noticed immediately
set ttimeoutlen=0

" Set lightline settings
set laststatus=2

let g:lightline = { 
      \ 'colorscheme': 'seoul256',
      \ }

" Folding settings
set foldmethod=indent
set foldenable
set foldnestmax=10
set foldlevel=1


" Buffer settings
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>


" Set comment strings
setglobal commentstring=#\ %s
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
