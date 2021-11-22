let mapleader = " "

"Cut text to + clipboard
vnoremap <leader>d "+d

nnoremap <leader>So :so %<CR>
nnoremap <C-s> :w<CR>

"Copy current line
nnoremap <leader>y "+yy
vnoremap <leader>y "+yy

"Copy to end of file
nnoremap <leader>yG "+yG
"Copy current line to general clipboard.
vnoremap <leader>y "+yy
nnoremap <leader>y "+yy
"Paste under current line
nnoremap <leader>p "+p
vnoremap <leader>p "+p
"Paste above current line
nnoremap <leader>P "+P
vnoremap <leader>P "+P

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

"Removes content from a range, can be (, [,"
nnoremap <C-c> ci

"Move To Next Tab
nnoremap <leader>] gt
"Move To Prev Tab
nnoremap <leader>[ gT

"Open FuzzyFinder
nnoremap <leader>f :FZF<CR>

"Toggle NERDTree visibility
nnoremap <leader>t :NERDTreeToggle<CR>
"Refresh NERDTree tree
nnoremap <leader>tr :NERDTreeRefreshRoot<CR>

" Search and replace word under cursor using F4
nnoremap <F4> :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i
