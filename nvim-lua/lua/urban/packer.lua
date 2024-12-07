local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
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

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Syntax Highlight
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

    -- File Tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icon
        },
    }

    use {
        'romgrk/barbar.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    --LSP Functionality
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    --Fuzzy Finder
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }

    --Web Dev
    use {
        'alvan/vim-closetag',
        'ap/vim-css-color'
    }

    -- LuaLine Pluggin
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
            opt = true
        }
    }

    --NVim Commentor
    use "terrortylor/nvim-comment"

    --NVim ColorSchemes.
    use {
        'morhetz/gruvbox',
        'sainnhe/edge',
        'NLKNguyen/papercolor-theme',
        'sainnhe/sonokai',
        'jaredgorski/SpaceCamp',
        'folke/tokyonight.nvim',
        "catppuccin/nvim", as = "catppuccin"
    }

    use "lukas-reineke/indent-blankline.nvim"

    -- Make Nvim Background Transparent
    use "xiyaowong/nvim-transparent"

    --HTML Integration With Emmet
    use "mattn/emmet-vim"
    if packer_bootstrap then
        require('packer').sync()
    end
end)
