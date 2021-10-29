let mapleader = " "

vnoremap <leader>d "+d

nnoremap <leader>So :so %<CR>
nnoremap <C-s> :w<CR>

"Copy current line
nnoremap <leader>y "+yy
vnoremap <leader>y "+yy
"Paste under current line
nnoremap <leader>p "+p
vnoremap <leader>p "+p
"Paste above current line
nnoremap <leader>P "+P
vnoremap <leader>P "+P

"Cut text to + clipboard
vnoremap <leader>d "+d

"Move Left From Actual Window
nnoremap <leader><Left> <C-w>h
vnoremap <leader><Left> <C-w>h
"Move Right From Actual Window
nnoremap <leader><Right> <C-w>l
vnoremap <leader><Right> <C-w>l
"Move Up From Actual Window
nnoremap <leader><Up> <C-w>k
vnoremap <leader><Up> <C-w>k
"Move Down From Actual Window
nnoremap <leader><Down> <C-w>j
vnoremap <leader><Down> <C-w>j

"Move To Next Tab
nnoremap <leader>t gt
"Move To Prev Tab
nnoremap <leader>T gT

nnoremap <leader>f :FZF<CR>

nnoremap <leader>tg :NERDTreeToggle<cr>
