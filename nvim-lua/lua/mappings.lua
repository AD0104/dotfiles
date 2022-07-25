vim.cmd('noremap <C-b> :noh<cr>:call clearmatches()<cr>') -- clear matches Ctrl+b
vim.cmd('noremap <SPACE> <Nop>')

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end

-- don't jump when using *
-- nmap('*', '*<c-o>')

-- keep search matches in the middle of the window
nmap('n', 'nzzzv')
nmap('N', 'Nzzzv')

-- Same when jumping around
nmap('g;', 'g;zz')
--nmap('g', 'g,zz') -- for some reason doesn't work well

-- Open a Quickfix window for the last search.
nmap("<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Begining & End of line in Normal mode
nmap('H', '^')
nmap('L', 'g_')

-- more natural movement with wrap on
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')

-- Easy buffer navigation
nmap('<C-h>', '<C-w>h')
nmap('<C-j>', '<C-w>j')
nmap('<C-k>', '<C-w>k')
nmap('<C-l>', '<C-w>l')

-- Reselect visual block after indent/outdent
vmap('<', '<gv')
vmap('>', '>gv')

-- home and end line in command mode
cmap('<C-a>', '<Home>')
cmap('<C-e>', '<End>')

--Move between tabs
nmap('<leader>[', 'gT<CR>')
nmap('<leader>]', 'gt<CR>')

--Copy/Paste
vim.api.nvim_set_keymap("n", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<c-v>", '"+p', {noremap=true, silent=true})
vim.api.nvim_set_keymap("i", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("i", "<c-v>", '"+p', {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<c-c>", '"*y :let @+=@*<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<c-v>", '"+p', {noremap=true, silent=true})

-- VimComment
vim.api.nvim_set_keymap("n", "<c-/>", ":CommentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("i", "<c-/>", "<Esc>:CommentToggle<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("v", "<c-/>", ":CommentToggle<CR>", {noremap=true})

-- Terminal
-- ESC to go to normal mode in terminal
tmap('<C-s>', '<C-\\><C-n>')
tmap('<Esc><Esc>', '<C-\\><C-n>')

-- Easy window split; C-w v -> vv, C-w - s -> ss
nmap('vv', '<C-w>v')
nmap('ss', '<C-w>s')
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane

-- PLUGINS

--Fuzy Finder
nmap('<leader>f','<cmd>FZF<CR>')

-- LSP
nmap('K', '<cmd>Lspsaga hover_doc<cr>')
imap('<C-k>', '<cmd>Lspsaga hover_doc<cr>')
nmap('gh', '<cmd>Lspsaga lsp_finder<cr>')
nmap('<C-e>', '<cmd>Lspsaga show_line_diagnostics<CR>')

--NvimTree
nmap('<C-n>', '<cmd>NvimTreeToggle<CR>') --Open/Close Tree
nmap('<leader>r', '<cmd>NvimTreeRefresh<CR>') --Refresh the Tree
nmap('<C-f>', '<cmd>NvimTreeFindFile<CR>') --Find File in Tree
