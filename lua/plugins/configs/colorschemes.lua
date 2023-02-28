-- require('onedark').setup {
--     style = 'darker'
-- }
-- require('onedark').load()

local colorscheme = "codedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " ..
    colorscheme ..
    " not found! Make sure the plugin is installed first. Restart if this is the first time launching Neovim")
    return
end
