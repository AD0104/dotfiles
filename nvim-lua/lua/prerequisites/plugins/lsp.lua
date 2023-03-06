local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "lua_ls",
    "tsserver",
    "pyright",
    "clangd",
    "jdtls",
})

-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

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
