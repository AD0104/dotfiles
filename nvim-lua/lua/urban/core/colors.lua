-- Using Protected Call
local status, _ = pcall(vim.cmd, "colorscheme edge")
if not status then
    print("Color Scheme Not Found!")
    return
end
