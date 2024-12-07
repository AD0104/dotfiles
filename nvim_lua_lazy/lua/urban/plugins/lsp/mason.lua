return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
--		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		-- local mason = require("mason")
        local status_ok, mason = pcall(require, "mason")
        if not status_ok then
            return 
        end 
		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- import mason-lspconfig
		local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
		if not status_ok then
			return
		end
		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"jdtls",
				"pyright",
			},
		})
	end,
}
