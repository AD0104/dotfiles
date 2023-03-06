HOME = os.getenv("HOME")

local opt = vim.opt 

vim.g.mapleader = ' '

-- basic settings
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
opt.completeopt = 'menu,menuone,noselect'
opt.history = 1000
opt.dictionary = '/usr/share/dict/words'
opt.startofline = true

-- Mapping waiting time
opt.timeout = false
opt.ttimeout = true
opt.ttimeoutlen = 100

-- Display
opt.showmatch  = true -- show matching brackets
opt.scrolloff = 8 -- always show 3 rows from edge of the screen
opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance
opt.laststatus = 2 -- always show status line

opt.list = false -- do not display white characters
opt.foldenable = false
opt.foldlevel = 4 -- limit folding to 4 levels
opt.foldmethod = 'syntax' -- use language syntax to generate folds
opt.wrap = false --do not wrap lines even if very long
opt.eol = false -- show if there's no eol char
opt.showbreak= '↪' -- character to show when line is broken

-- Sidebar
opt.number = true -- line number on the left
opt.relativenumber = true -- relative line number
opt.numberwidth = 3 -- always reserve 3 spaces for line number
opt.signcolumn = 'yes' -- keep 1 column for coc.vim  check
opt.modelines = 0
opt.showcmd = true -- display command in bottom bar

-- Search
opt.incsearch = true -- starts searching as soon as typing, without enter needed
opt.ignorecase = true -- ignore letter case when searching
opt.smartcase = true -- case insentive unless capitals used in search

opt.matchtime = 2 -- delay before showing matching paren
opt.mps = vim.o.mps .. ",<:>"

-- White characters
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4 -- 1 tab = 2 spaces
opt.shiftwidth = 4 -- indentation rule
opt.formatoptions = 'qnj1' -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
opt.expandtab = true -- expand tab to spaces

-- Backup files
opt.backup = true -- use backup files
opt.writebackup = false
opt.swapfile = false -- do not use swap file
opt.undodir = HOME .. '/.vim/tmp/undo//'     -- undo files
opt.backupdir = HOME .. '/.vim/tmp/backup//' -- backups
opt.directory = '/.vim/tmp/swap//'   -- swap files

opt.cursorline = true
opt.termguicolors = true
opt.background = "dark" 
-- Specify when the line with tab page labels will be displayed.
opt.showtabline = 2

-- Split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

vim.g.python3_host_prog = "/bin/python3"


-- Commands mode
opt.wildmenu = true -- on TAB, complete options for system command
opt.wildignore = 'deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'


-- Clipboard Settings
opt.clipboard:append('unnamedplus')

--Git Gutter
vim.g.gitgutter_enabled=1
vim.g.gitgutter_signs=1
vim.g.gitgutter_highlight_lines=0
vim.g.gitgutter_highlight_linenrs=1
vim.g.gitgutter_async=1
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
    set clipboard=unnamedplus
    autocmd! FileType fzf tnoremap <buffer> <leader>q <c-c>
]])

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

vim.cmd([[
  au FileType python                  set ts=4 sw=4
  au BufRead,BufNewFile *.md          set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.ppmd        set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.markdown    set ft=mkd tw=80 syntax=markdown
  au BufRead,BufNewFile *.slimbars    set syntax=slim
]])
