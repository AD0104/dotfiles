-- All the following configurations are the default, so they are not
-- necessary
require('telescope').setup({
    pickers = {
        find_files = {
            follow = true
        }
    }
})
require('telescope').load_extension('fzf')
