local configs = require("nvim-treesitter.configs")

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,         -- false will disable the whole extension
    disable = { "" },      -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}

local status_ok, commentstring = pcall(require, "ts_context_commentstring")
if not status_ok then
  return
end

commentstring.setup {
  enable = true,
  enable_autocmd = false,
}
