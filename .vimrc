" This is Philippe Davies' vimrc
" Version 0.4



" Plugins ------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Visual Plugins
Plug 'itchyny/lightline.vim'

" Vim Tabs?
Plug 'ap/vim-buftabline'

" Code completion
" Plug 'valloric/youcompleteme'

" Smart auto-completer
Plug 'zxqfl/tabnine-vim'

" Code commenting
Plug 'tpope/vim-commentary'

" Golang plugin
Plug 'fatih/vim-go'

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


" Set Golang auto options
let g:go_fmt_command = "goimports"
let g:go_null_module_warning = 0



" Functions


" Function to strip trailing whitespace and return to cursor location
function! TrimWhite()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction




" Autocommands


" Write to file but remove all trailing whitespace before saving
autocmd BufWrite * :call TrimWhite()


" inoremaps go here
inoremap {<CR> {<CR>}<Esc>ko
