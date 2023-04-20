local opts = {noremap=true, silent=true}
local kmp = vim.keymap

vim.g.mapleader = ' '

-- Keep Search Matches In The Middle Of The Screen
kmp.set('n', 'n', 'nzzzv')
kmp.set('n', 'N', 'Nzzzv')
kmp.set('n', 'g;', 'g;zz')
kmp.set('n', "<leader>?", ":execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>")

-- Jump To Beggining & End Of Line
kmp.set('n', 'H', '^')
kmp.set('n', 'L', 'g_')
kmp.set('v', 'H', '^')
kmp.set('v', 'L', 'g_')

-- Moving With Wrap On
kmp.set('n', 'j', 'gj')
kmp.set('n', 'k', 'gk')
kmp.set('v', 'j', 'gj')
kmp.set('v', 'k', 'gk')

-- Split Window Navigation
kmp.set('n', '<C-h>', '<C-w>h')
kmp.set('n', '<C-j>', '<C-w>j')
kmp.set('n', '<C-k>', '<C-w>k')
kmp.set('n', '<C-l>', '<C-w>l')

-- Keep Visual Select While Doing indent/outdent
kmp.set('v', '<', '<gv')
kmp.set('v', '>', '>gv')

-- Home And End In Command Mode
kmp.set('c', '<C-a>', '<Home>')
kmp.set('c', '<C-e>', '<End>')


--Copy/Paste
kmp.set("n", "<C-c>", '"*y :let @+=@*<CR>', opts)
kmp.set("n", "<C-p>", '"+p', opts)
kmp.set("i", "<C-c>", '"*y :let @+=@*<CR>', opts)
kmp.set("i", "<C-p>", '"+p', opts)
kmp.set("v", "<C-c>", '"*y :let @+=@*<CR>', opts)
kmp.set("v", "<C-p>", '"+p', opts)

-- Easy window split; C-w v -> vv, C-w - s -> ss
kmp.set('n', 'vv', '<C-w>v')
kmp.set('n', 'ss', '<C-w>s')

-- Nvim Commentor
kmp.set('n', "<leader>cl", ":CommentToggle<CR>")
kmp.set('v', "<leader>cl", ":CommentToggle<CR>")

-- Nvim Tree
kmp.set('n', '<C-b>', '<cmd>NvimTreeToggle<CR>')      --Open/Close Tree
kmp.set('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>') --Refresh the Tree
kmp.set('n', '<C-f>', '<cmd>NvimTreeFindFile<CR>')    --Find File in Tree

-- Telescope
local tlcp = require("telescope.builtin")
kmp.set('n', '<leader>ff', tlcp.find_files, opts)
kmp.set('n', '<leader>fg', tlcp.live_grep, opts)
kmp.set('n', '<leader>fb', tlcp.buffers, opts)
kmp.set('n', '<leader>fh', tlcp.help_tags, opts)

-- Tabs
-- Move to previous/next
kmp.set('n', '<leader>[', '<Cmd>BufferPrevious<CR>', opts)
kmp.set('n', '<leader>]', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
kmp.set('n', '<leader>mp', '<Cmd>BufferMovePrevious<CR>', opts)
kmp.set('n', '<leader>mn', '<Cmd>BufferMoveNext<CR>', opts)

-- Pin/unpin buffer
kmp.set('n', '<leader>bp', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
kmp.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
kmp.set('n', '<leader>bco', '<Cmd>BufferCloseAllButCurrentOrPinned', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
