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
-- vim.keymap.set({"n","v"}, '<leader>[', 'gT<CR>', opts)
-- vim.keymap.set({"n","v"}, '<leader>]', 'gt<CR>', opts)

--Copy/Paste
vim.keymap.set("n", "<c-c>", '"*y :let @+=@*<CR>', opts)
vim.keymap.set("n", "<c-v>", '"+p', opts)
vim.keymap.set("i", "<c-c>", '"*y :let @+=@*<CR>', opts)
vim.keymap.set("i", "<c-v>", '"+p', opts)
vim.keymap.set("v", "<c-c>", '"*y :let @+=@*<CR>', opts)
vim.keymap.set("v", "<c-v>", '"+p', opts)

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
-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
vim.keymap.set('i', '<C-k>', '<cmd>Lspsaga hover_doc<cr>')
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>')
vim.keymap.set('n', '<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

--NvimTree
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>') --Open/Close Tree
vim.keymap.set('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>') --Refresh the Tree
vim.keymap.set('n', '<C-f>', '<cmd>NvimTreeFindFile<CR>') --Find File in Tree


vim.keymap.set("n", "<A-t>", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<A-c>", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<A-o>", ":tabonly<CR>", { noremap = true })
vim.keymap.set("n", "<A-n>", ":tabn<CR>", { noremap = true })
vim.keymap.set("n", "<A-p>", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.keymap.set("n", "<A-left>", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<A-right>", ":+tabmove<CR>", { noremap = true })
