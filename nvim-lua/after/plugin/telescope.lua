require('telescope').setup({
    pickers = {
        find_files = {
            follow = true
        }
    }
})
require('telescope').load_extension('fzf')
