local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        "angular", "bash", "c", "cpp", "css",
        "html", "java", "javascript", "json", "kotlin",
        "lua", "properties", "python", "scss", "sql",
        "tmux", "vim", "vimdoc", "xml", "yaml",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages.
    sync_install = false, -- Install languages synchronously
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { 
        enable = true,
        disable = { "yaml" },
    },
}
