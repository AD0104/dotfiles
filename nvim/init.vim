source ~/.config/nvim/custom-settings/sets.vim
source ~/.config/nvim/custom-settings/maps.vim
source ~/.config/nvim/custom-settings/closetags-confs.vim
source ~/.config/nvim/custom-settings/coc-settings.vim
source ~/.config/nvim/custom-settings/gitgutter-settings.vim
source ~/.config/nvim/custom-settings/indentguides-settings.vim

" Directorio de plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   
Plug 'junegunn/fzf'
Plug 'alvan/vim-closetag'

Plug 'neovim/nvim-lspconfig'

Plug 'yggdroot/indentline'

" add this line to your .vimrc file
Plug 'mattn/emmet-vim'

call plug#end()

"Vim Airline Config Lines
let g:airline_theme='ayu_dark'

colorscheme gruvbox
autocmd vimenter * NERDTree
