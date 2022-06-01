HOME = os.getenv("HOME")

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- basic settings
vim.o.encoding = "utf-8"
vim.o.backspace = "indent,eol,start" -- backspace works on every char in insert mode
vim.o.completeopt = 'menuone,noselect'
vim.o.history = 1000
vim.o.dictionary = '/usr/share/dict/words'
vim.o.startofline = true

-- Mapping waiting time
vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 100

-- Display
vim.o.showmatch  = true -- show matching brackets
vim.o.scrolloff = 8 -- always show 3 rows from edge of the screen
vim.o.synmaxcol = 300 -- stop syntax highlight after x lines for performance
vim.o.laststatus = 2 -- always show status line

vim.o.list = false -- do not display white characters
vim.o.foldenable = false
vim.o.foldlevel = 4 -- limit folding to 4 levels
vim.o.foldmethod = 'syntax' -- use language syntax to generate folds
vim.o.wrap = false --do not wrap lines even if very long
vim.o.eol = false -- show if there's no eol char
vim.o.showbreak= '↪' -- character to show when line is broken

-- Sidebar
vim.o.number = true -- line number on the left
vim.o.relativenumber = true -- relative line number
vim.o.numberwidth = 3 -- always reserve 3 spaces for line number
vim.o.signcolumn = 'yes' -- keep 1 column for coc.vim  check
vim.o.modelines = 0
vim.o.showcmd = true -- display command in bottom bar

-- Search
vim.o.incsearch = true -- starts searching as soon as typing, without enter needed
vim.o.ignorecase = true -- ignore letter case when searching
vim.o.smartcase = true -- case insentive unless capitals used in search

vim.o.matchtime = 2 -- delay before showing matching paren
vim.o.mps = vim.o.mps .. ",<:>"

-- White characters
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4 -- 1 tab = 2 spaces
vim.o.shiftwidth = 4 -- indentation rule
vim.o.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
vim.o.expandtab = true -- expand tab to spaces

-- Backup files
vim.o.backup = true -- use backup files
vim.o.writebackup = false
vim.o.swapfile = false -- do not use swap file
vim.o.undodir = HOME .. '/.vim/tmp/undo//'     -- undo files
vim.o.backupdir = HOME .. '/.vim/tmp/backup//' -- backups
vim.o.directory = '/.vim/tmp/swap//'   -- swap files

vim.cmd([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
]])

-- Commands mode
vim.o.wildmenu = true -- on TAB, complete options for system command
vim.o.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'

-- Only show cursorline in the current window and in normal mode.
vim.cmd([[
  augroup cline
      au!
      au WinLeave * set nocursorline
      au WinEnter * set cursorline
      au InsertEnter * set nocursorline
      au InsertLeave * set cursorline
  augroup END
]])

-- Clipboard Settings
vim.opt.clipboard = 'unnamedplus'

--Git Gutter
vim.g.gitgutter_enabled=1
vim.g.gitgutter_signs=1
vim.g.gitgutter_highlight_lines=0
vim.g.gitgutter_highlight_linenrs=1
vim.g.gitgutter_async=1

--Git Gutter Signs
vim.g.gitgutter_sign_added="+>"
vim.g.gitgutter_sign_modified="~>"
vim.g.gitgutter_sign_removed="->"
vim.g.gitgutter_sign_removed_first_line="^^"
vim.g.gitgutter_sign_removed_above_and_below="{"
vim.g.gitgutter_sign_modified_removed="~~"

--Git Gutter Colors
vim.cmd([[
    highlight GitGutterAdd guifg=#0e5200
    highlight GitGutterChange guifg=#fdffb6
    highlight GitGutterDelete guifg=#f94144
]])

--VimScript Sets
vim.cmd([[
    set updatetime=50
    set nohlsearch
    set hidden
    set mouse=a
    
    set colorcolumn=100

    "Auto command to close
    autocmd! FileType fzf tnoremap <buffer> <leader>q <c-c>
]])

vim.o.background = 'dark'
vim.g.material_style = "palenight"
vim.cmd('colorscheme gruvbox')

vim.g.python3_host_prog = "/bin/python3"
