require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
auto_reload_on_write = true,
disable_netrw = false,
hijack_cursor = false,
hijack_netrw = true,
hijack_unnamed_buffer_when_opening = false,
ignore_buffer_on_setup = false,
open_on_setup = true,
open_on_setup_file = true,
open_on_tab = true,
sort_by = "name",
update_cwd = false,
reload_on_bufenter = false,
view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "right",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
        custom_only = false,
        list = {
            -- user mappings go here
        },
    },
},
hijack_directories = {
    enable = true,
    auto_open = true,
},
update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
},
ignore_ft_on_setup = {},
system_open = {
    cmd = "",
    args = {},
},
diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
    },
},
filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
},
git = {
    enable = true,
    ignore = true,
    timeout = 400,
},
renderer = {
    indent_markers= {
        enable = true,
    }
},
actions = {
    use_system_clipboard = true,
    change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
    },
    open_file = {
        quit_on_open = false,
        resize_window = true,
        window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
            },
        },
    },
},
trash = {
    cmd = "trash",
    require_confirm = true,
},
live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
},
log = {
    enable = false,
    truncate = false,
    types = {
        all = false,
        config = false,
        copy_paste = false,
        diagnostics = false,
        git = false,
        profile = false,
    },
},
} -- END_DEFAULT_OPTS
require("nvim-treesitter.configs").setup({
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "java", "javascript", "python", "json", "css", "markdown"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    -- ignore_install = { "javascript" },

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})
