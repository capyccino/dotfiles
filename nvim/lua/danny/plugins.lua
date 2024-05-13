local fn = vim.fn

-- automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "require packer failed..."
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- install plugins here
return packer.startup (function(use)
  -- my plugins here
  use "wbthomason/packer.nvim" -- have packer manage itself
  use "nvim-lua/popup.nvim"    -- an impl of the Popup API from vim in neovim
  use "nvim-lua/plenary.nvim"  -- useful lua functions used by lots of plugins

  -- colorscheme
  use { "catppuccin/nvim", as = "catppuccin" } -- catppuccin colorscheme

  -- completion plugins
  use "hrsh7th/nvim-cmp"                  -- The completion plugin
  use "hrsh7th/cmp-buffer"                -- buffer completions
  use "hrsh7th/cmp-path"                  -- path completions
  use "hrsh7th/cmp-cmdline"               -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"          -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"              -- lsp completions

  -- snippets
  use "L3MON4D3/LuaSnip"                  -- snippet engine
  use "rafamadriz/friendly-snippets"      -- a bunch of snippets to use

  -- lsp
  use "neovim/nvim-lspconfig"             -- enable lsp
  use "williamboman/mason.nvim"           -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim"   -- lsp diagnostics and code actions

  -- telescope
  use "nvim-telescope/telescope.nvim"     -- easier searching
  use "nvim-telescope/telescope-media-files.nvim"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",    -- syntax highlighting
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- autopair
  use "windwp/nvim-autopairs"             -- auto pair ({["' etc.

  -- comments
  use "numToStr/Comment.nvim"             -- easily comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- git
  use "lewis6991/gitsigns.nvim"           -- useful git info

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',            -- file explorer
    requires = {
      'nvim-tree/nvim-web-devicons',      -- file/directory icons
    },
  }

  -- buffers
  use "akinsho/bufferline.nvim"           -- show buffers on top
  use "moll/vim-bbye"

  -- toggleterm
  use "akinsho/toggleterm.nvim"

  -- automatically set up your config after cloning packer.nvim
  -- put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

