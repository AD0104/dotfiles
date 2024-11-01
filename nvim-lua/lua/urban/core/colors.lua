-- Using Protected Call
local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
if not status then
    print("Color Scheme Not Found!")
    return
end
