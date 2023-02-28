local opts = { noremap = true, silent = true }
vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b
vim.cmd('noremap <SPACE> <Nop>')

-- keep search matches in the middle of the window
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Same when jumping around
vim.keymap.set('n', 'g;', 'g;zz')
--vim.keymap.set('n', 'g', 'g,zz') -- for some reason doesn't work well

-- Open a Quickfix window for the last search.
vim.keymap.set('n', "<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Begining & End of line in Normal mode
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', 'g_')

-- more natural movement with wrap on
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')

-- Easy buffer navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Reselect visual block after indent/outdent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- home and end line in command mode
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-e>', '<End>')

--Move between tabs
vim.keymap.set({"n","v"}, '<C-[>', 'gT<CR>', { silent=true })
vim.keymap.set({"n","v"}, '<C-]>', 'gt<CR>')

--Copy/Paste
vim.keymap.set("n", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.keymap.set("n", "<c-v>", '"+p', {noremap=true, silent=true})
vim.keymap.set("i", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.keymap.set("i", "<c-v>", '"+p', {noremap=true, silent=true})
vim.keymap.set("v", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.keymap.set("v", "<c-v>", '"+p', {noremap=true, silent=true})

-- VimComment
vim.keymap.set("n", "<c-/>", ":CommentToggle<CR>", {noremap=true})
vim.keymap.set("i", "<c-/>", "<Esc>:CommentToggle<CR>", {noremap=true, silent=true})
vim.keymap.set("v", "<c-/>", ":CommentToggle<CR>", {noremap=true})

-- Terminal
-- ESC to go to normal mode in terminal
vim.keymap.set('t', '<C-s>', '<C-\\><C-n>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Easy window split; C-w v -> vv, C-w - s -> ss
vim.keymap.set('n', 'vv', '<C-w>v')
vim.keymap.set('n', 'ss', '<C-w>s')
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane

-- PLUGINS

--Fuzy Finder
vim.keymap.set('n', '<leader>f','<cmd>FZF<CR>')

-- LSP
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
vim.keymap.set('i', '<C-k>', '<cmd>Lspsaga hover_doc<cr>')
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>')
vim.keymap.set('n', '<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

--NvimTree
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>') --Open/Close Tree
vim.keymap.set('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>') --Refresh the Tree
vim.keymap.set('n', '<C-f>', '<cmd>NvimTreeFindFile<CR>') --Find File in Tree

-- Move to previous/next buffer
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next buffer
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
