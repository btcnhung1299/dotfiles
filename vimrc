" ----------------------------------------------------
"  Basic settings
" ----------------------------------------------------
syntax on
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent
set hlsearch
set foldmethod=indent foldnestmax=1
set number
set clipboard=unnamedplus


" ----------------------------------------------------
"  Plugins
" ----------------------------------------------------

call plug#begin('~/.vim/plugged')

" Xcode colorscheme
Plug 'arzg/vim-colors-xcode'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Alignment
Plug 'junegunn/vim-easy-align'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Sample code snippets
Plug 'SirVer/ultisnips'

" Code searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

call plug#end()


" ----------------------------------------------------
"  Key bindings
" ----------------------------------------------------
nmap <C-N> :NERDTreeToggle<CR>


" ----------------------------------------------------
"  Custom theme
" ----------------------------------------------------
colorscheme xcodedark
highlight Normal ctermbg=None
highlight Folded ctermbg=None
