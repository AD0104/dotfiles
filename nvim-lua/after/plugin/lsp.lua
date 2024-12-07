local lsp = require("lsp-zero").preset({})

lsp.preset("recommended")

lsp.ensure_installed({
    "lua_ls",
    "tsserver",
    "pyright",
    "clangd",
    "jdtls",
})

-- Fix Undefined global 'vim'

require('lspconfig').lua_ls.setup {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
            return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true), 
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  local map = vim.keymap
  local lsp = vim.lsp

  map.set("n", "gd", function() lsp.buf.definition() end, opts)
  map.set("n", "K", function() lsp.buf.hover() end, opts)
  map.set("n", "<leader>vws", function() lsp.buf.workspace_symbol() end, opts)
  map.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  map.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  map.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  map.set("n", "<leader>vca", function() lsp.buf.code_action() end, opts)
  map.set("n", "<leader>vrr", function() lsp.buf.references() end, opts)
  map.set("n", "<leader>vrn", function() lsp.buf.rename() end, opts)
  map.set("i", "<C-h>", function() lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local lspconfig = require('lspconfig')
local MY_FQBN = "arduino:avr:nano"
lspconfig.arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
        "-cli-config", "~/.local/bin/arduino-cli",
        "-fqbn",
        MY_FQBN
    }
}
