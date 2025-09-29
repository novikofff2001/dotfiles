" Enable filetype detection, plugins and indent rules
filetype plugin indent on

" Encoding & basic UI
set encoding=utf-8
set nocompatible
syntax enable
set number
set termguicolors

" Highlight trailing whitespace (red)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Indentation
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Disable audible/visual bells
set noerrorbells
set novisualbell

" Cursor and key timeout
set cursorline
set ttimeoutlen=10
let &t_SI.="\e[5 q" " insert mode cursor
let &t_SR.="\e[3 q" " replace mode cursor
let &t_EI.="\e[1 q" " normal mode cursor
set backspace=indent,eol,start

" Mouse support
set mouse=a

" Search behavior
set ignorecase
set smartcase
set hlsearch
set incsearch

" ---- Plugins ----
call plug#begin('~/.vim/bundle')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joom/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ayu-theme/ayu-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ntk148v/vim-horizon'
Plug '42Paris/42header'
Plug 'yggdroot/indentline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Airline status/tab line
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="ayu_dark"

" Theme (ayu, dark variant)
let ayucolor="dark"
colorscheme ayu

" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Guide column
set colorcolumn=100

" indentLine settings
set list lcs=tab:<->
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_fileType = ['c', 'cpp']
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '-'

""" Mappings
" NERDTree
nnoremap <C-n> :NERDTree<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>

" fzf
map <Leader>f :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>l :Lines<CR>
map <Leader>m :Marks<CR>
map <Leader>r :Tags<CR>
map <Leader>w :Windows<CR>
map <Leader>a :Ag<CR>

" Clear search highlight on ESC
nnoremap <esc> :nohlsearch<CR><esc>

