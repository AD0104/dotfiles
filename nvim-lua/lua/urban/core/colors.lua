-- Using Protected Call
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
    print("Color Scheme Not Found!")
    return
end
