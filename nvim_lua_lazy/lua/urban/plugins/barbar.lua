return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
		local kmp = vim.keymap
		kmp.set("n", "<leader>bn", "<cmd>BufferNext<CR>")
		kmp.set("n", "<leader>bp", "<cmd>BufferPrevious<CR>")
		kmp.set("n", "<leader>bc", "<cmd>BufferClose<CR>")
		vim.cmd([[ hi BufferTabpageFill ctermbg=black ]])
	end,
	opts = {
		animation = true,
		icons = {
			buffer_index = false,
			buffer_number = false,
			button = "",
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
				[vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = true },
			},
			filetype = {
				custom_colors = false,
				enabled = true,
			},
			separator = { left = "▎", right = " " },
			modified = { button = "●" },
			pinned = { button = " ", filename = true, separator = { right = "" } },
			alternate = { filetype = { enabled = false } },
			current = { buffer_index = true },
			inactive = { button = "󰒲" },
			visible = { modified = { buffer_number = false } },
		},
		maximum_padding = 2,
		minimum_padding = 1,
		maximum_length = 30,
		semantic_letters = true,
		sidebar_filetypes = {
			NvimTree = true,
			undotree = { text = "undotree" },
			["neo-tree"] = { event = "BufWipeout" },
			Outline = { event = "BufWinLeave", text = "symbols-outline" },
		},
		letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
		no_name_title = nil,
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
