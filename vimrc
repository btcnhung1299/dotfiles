syntax on
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent
set hlsearch
set foldmethod=indent foldnestmax=1
set number
set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')

Plug 'arzg/vim-colors-xcode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
Plug 'Valloric/YouCompleteMe', { 'commit':'d98f896', 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

call plug#end()

nmap <C-N> :NERDTreeToggle<CR>

colorscheme xcodedark
let g:airline_theme='bubblegum'
highlight Normal ctermbg=None
highlight Folded ctermbg=None
