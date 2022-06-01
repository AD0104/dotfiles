--AutoInstall Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

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
                local lspconfig = require('lspconfig')
                lspconfig.sumneko_lua.setup{}
            end
        },
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
        'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
        'L3MON4D3/LuaSnip' -- Snippets plugin
    } 
    use {
        'nvim-treesitter/nvim-treesitter', 
        run = ':TSUpdate' 
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
        'morhetz/gruvbox'
    }
    if packer_bootstrap then
        require('packer').sync()
    end
end)

