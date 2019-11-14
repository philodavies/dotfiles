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

" Python3 formatting (Black)
Plug 'psf/black'

" Sensible vim defaults
Plug 'tpope/vim-sensible'

" Markdown things
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

" tabs and indenting ------------------------------------------------------
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set list


" Show line numbers by default --------------------------------------------
set number relativenumber

set scrolloff=5

" Spelling
" autocmd FileType markdown setlocal spell
set spell
nnoremap <Leader>z mz[s1z=e`z

syntax on
color slate

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

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


" Set SQL options
let g:omni_sql_no_default_maps = 1


" Functions


" Function to strip trailing whitespace and return to cursor location
function! TrimWhite()
  if &ft =~ 'ruby\|javascript\|perl\|markdown'
        return
  endif
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

" Function to enable/disable linenumbers
function! ToggleNumbers(toggle)
    if a:toggle == 1
        set number relativenumber
    elseif a:toggle == 0
        set nonumber norelativenumber
    else
        echom "Not a valid input!"
    endif
endfunction



" Autocommands


" Write to file but remove all trailing whitespace before saving
autocmd BufWrite * :call TrimWhite()
autocmd BufWrite *.py :Black


" Maps

inoremap {<CR> {<CR>}<Esc>ko
nnoremap n nzz
nnoremap N Nzz

" noremap <silent> k gk
" noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
