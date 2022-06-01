source ~/.config/nvim/custom-settings/sets.vim
source ~/.config/nvim/custom-settings/maps.vim
source ~/.config/nvim/custom-settings/closetags-confs.vim
"source ~/.config/nvim/custom-settings/coc-settings.vim
source ~/.config/nvim/custom-settings/gitgutter-settings.vim
source ~/.config/nvim/custom-settings/indentguides-settings.vim

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'

Plug 'neovim/nvim-lspconfig'

Plug 'yggdroot/indentline'

" add this line to your .vimrc file
Plug 'mattn/emmet-vim'

Plug 'jacoborus/tender.vim'
Plug 'liuchengxu/space-vim-dark'

Plug 'fladson/vim-kitty'

call plug#end()

"Vim Airline Config Lines
let g:airline_theme='tender'
let g:python3_host_prog = '/bin/python3'

set termguicolors
set cursorline
autocmd vimenter * highlight CursorLine guibg=Black
autocmd vimenter * highlight Comment gui=italic

"colorscheme gruvbox
colorscheme space-vim-dark
"colorscheme tender
autocmd vimenter * NERDTree
