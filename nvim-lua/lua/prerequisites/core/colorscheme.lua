-- set colorscheme using protected calls
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
    print("Colorscheme not found!") -- Print error if colorscheme not found/installed
    return
end
