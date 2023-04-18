HOME = os.getenv("HOME")

local opt = vim.opt
local gbl = vim.g

-- vim.g.mapleader = ' '

-- Basic Settings
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start"
opt.completeopt="menu,menuone,noselect"
opt.history = 1000
opt.startofline = true
opt.termguicolors = true
opt.background = "dark"
opt.wildmenu = true
opt.wildignore = "deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc'"
opt.iskeyword:append("-")
opt.clipboard:append("unnamedplus")
opt.cursorline = true
opt.cursorlineopt = "line"


-- Key Map Time Out
opt.timeout = false
opt.ttimeout = true
opt.ttimeoutlen = 100

-- Visual Settings
opt.showmatch = true -- Matching Brackets
opt.scrolloff = 8   -- Always Show 8 Rows From Edge
opt.laststatus = 2  -- Always Show Status Line
opt.list = false    -- Don't display white characters
opt.foldenable = true
opt.foldlevel = 4
opt.foldmethod = "syntax"
opt.wrap = false    -- Don't Wrap Lines, Even If They're Long
opt.eol = false     -- Show If There's No EOL Char
opt.showbreak = "↪" -- Character To Show When Line Is Brokenopt.wildmenu = true

-- Sidebar
opt.number = true   -- Show Line Number
opt.relativenumber = true  -- Show Relative Line Number
opt.numberwidth = 3 -- Reserve 3 Spaces For Line Number
opt.signcolumn = "yes:2"
opt.modelines = 0
opt.showcmd = true  -- Show Command Line In Bottom Bar

-- Text Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.matchtime = 2

-- Tabs And Indents Settings
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.formatoptions = "qnj1"
opt.expandtab = true

-- Pages Settings
opt.showtabline = 2
opt.splitright = true
opt.splitbelow = true

-- Backup Files
opt.backup = true
opt.writebackup = false
opt.swapfile = false
opt.undodir = HOME .. "/.vim/tmp/undo//"
opt.backupdir = HOME .. "/.vim/tmp/backup//"
opt.directory = "/.vim/tmp/swap//"

-- Other Settings
gbl.python3_host_prog = "/bin/python3"

-- VimScript Settings
vim.cmd([[
    set updatetime=50
    set nohlsearch
    set hidden
    set mouse=a
    set colorcolumn=120
]])
