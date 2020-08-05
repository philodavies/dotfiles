" This is Philippe Davies' vimrc
" Version 0.4

" Plugins ------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Visual Plugins
Plug 'itchyny/lightline.vim'

" Vim Tabs?
Plug 'ap/vim-buftabline'

" Code commenting
Plug 'tpope/vim-commentary'

" Golang plugin
Plug 'fatih/vim-go'

" Sensible vim defaults
Plug 'tpope/vim-sensible'

" Markdown things
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Things not needed at FB :(
" Code completion
" Plug 'valloric/youcompleteme'

" Python3 formatting (Black)
" Plug 'psf/black'

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
set spell
nnoremap <Leader>z mz[s1z=e`z

syntax on
color slate

hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad cterm=underline ctermfg=DarkRed gui=undercurl guisp=DarkRed
hi SpellCap cterm=underline ctermfg=DarkBlue gui=undercurl guisp=Blue
hi SpellRare cterm=underline ctermfg=DarkMagenta gui=undercurl guisp=Magenta
hi SpellLocal cterm=underline ctermfg=DarkCyan gui=undercurl guisp=Cyan
hi Pmenu ctermbg=LightGrey

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


" Set Golang options
let g:go_fmt_command = "goimports"
let g:go_null_module_warning = 0

" Set Python options
let g:black_skip_string_normalization = 1


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
function! ToggleNumbers()
    set invnumber invrelativenumber
endfunction



" Autocommands


" Write to file but remove all trailing whitespace before saving
autocmd BufWrite * :call TrimWhite()
" autocmd BufWrite *.py :Black


" Maps

inoremap {<CR> {<CR>}<Esc>ko
nnoremap n nzz
nnoremap N Nzz

noremap <silent> 0 g0
noremap <silent> $ g$

nnoremap <expr> j v:count == 0 ? 'gj' : "\<Esc>".v:count.'j'
nnoremap <expr> k v:count == 0 ? 'gk' : "\<Esc>".v:count.'k'
