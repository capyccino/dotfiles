-- colorscheme 

-- catppucccin setup
require("catppuccin").setup({
  flavour = "mocha",
  --[[ transparent_background = true, ]]
})

local colorscheme = "catppuccin"

-- set colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
 vim.notify("colorscheme " .. colorscheme .. " not found!")
 return
end

