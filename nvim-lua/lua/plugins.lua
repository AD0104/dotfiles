--AutoInstall Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Another Package Manager
    use "williamboman/mason.nvim"
    require("mason").setup()

    -- Syntax Highlight
    use 'nvim-treesitter/nvim-treesitter'

    -- File Tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    --LSP And Snippets Plugs.
    use{
        'williamboman/nvim-lsp-installer',
        {
            'neovim/nvim-lspconfig',
            config = function()
                require('nvim-lsp-installer').setup({
                    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
                    ui = {
                        icons = {
                            server_installed = "✓",
                            server_pending = "➜",
                            server_uninstalled = "✗"
                        }
                    }
                })
            end
        },
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        'L3MON4D3/LuaSnip', -- Snippets plugin
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline'
    }
    --Git Plug
    use 'airblade/vim-gitgutter'

    --Fuzzy Finder
    use 'junegunn/fzf'

    --Web Dev. Plugs.
    use {
        'alvan/vim-closetag',
        'ap/vim-css-color'
    }

    --NVim ColorSchemes.
    use {
        'morhetz/gruvbox',
        'sainnhe/edge',
        'NLKNguyen/papercolor-theme',
        'sainnhe/sonokai',
    }

    -- LuaLine Pluggin
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    --NVim Commentor
    use "terrortylor/nvim-comment"

    if packer_bootstrap then
        require('packer').sync()
    end
end)

