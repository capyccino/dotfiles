local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("danny.lsp.mason")
require("danny.lsp.handlers").setup()
require("danny.lsp.null-ls")


-- cool note about lua:
--
-- on .config/nvim/init.lua we require "danny.lsp" - which is a directory
-- if we require a directory, lua automatically looks for danny.lsp.init.lua 
-- a.k.a. this file!
