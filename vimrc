" ----------------------------------------------------
"  Basic settings
" ----------------------------------------------------
syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set number


" ----------------------------------------------------
"  Plugins
" ----------------------------------------------------
call plug#begin('~/.vim/plugged')

" Low-contrast color scheme
Plug 'junegunn/seoul256.vim'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Alignment
Plug 'junegunn/vim-easy-align'

" Sample code snippets
Plug 'SirVer/ultisnips'

" Code searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

call plug#end()


" ----------------------------------------------------
"  Key bindings
" ----------------------------------------------------
nmap <C-N> :NERDTreeToggle<CR>

