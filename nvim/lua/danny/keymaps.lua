local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- modes
--  normal_mode        "n",
--  insert_mode        "i",
--  visual_mode        "v",
--  visual_block_mode  "x",
--  term_mode          "t",
--  command_mode       "c",

-- NORMAL --

-- write / quit / source faster
keymap("n", "<leader>w", ":w <cr>", opts)
keymap("n", "<leader>wq", ":wq <cr>", opts)
keymap("n", "<leader>so", ":so <cr>", opts)

-- better vertical screen navigation
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- better horizontal movement
keymap("n", "<S-Left>", "b", opts)
keymap("n", "<S-Right>", "w", opts)

-- no highlights
keymap("n", "<leader>/", ":noh <cr>", opts)

-- better split
keymap("n", "<C-A-h>", ":vsplit <cr>", opts) -- split to the right
keymap("n", "<C-A-v>", ":split <cr>", opts) -- split to the bottom

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize with arrows
keymap("n", "<A-Up>", ":resize -2<cr>", opts)
keymap("n", "<A-Down>", ":resize +2<cr>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<cr>", opts)

-- buffers
keymap("n", "Q", ":Bdelete <cr>", opts)
keymap("n", "L", ":bnext <cr>", opts)
keymap("n", "H", ":bprevious <cr>", opts)

-- NORMAL --

-- INSERT --

-- press jk fast to escape
keymap("i", "jk", "<ESC>", opts)

-- make opt backspace delete a whole word
keymap("i", "<A-bs>", "<ESC>ldba", opts)

-- better horizontal movement
keymap("i", "<S-Left>", "<ESC>bi", opts)
keymap("i", "<S-Right>", "<ESC>wi", opts)

-- INSERT --

-- VISUAL --

-- press jk fast to escape
keymap("v", "jk", "<ESC>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- don't yank what you printed over
keymap("v", "p", '"_dP', opts)

-- VISUAL --

-- VISUAL BLOCK --

-- move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- VISUAL BLOCK --

-- TERMINAL --

-- better terminal navigations
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- TERMINAL --

-- TELESCOPE
keymap("n", "<leader>f", "<cmd>Telescope find_files <cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep <cr>", opts)

-- null-ls formatting
keymap("n", "<leader>l", ":Format <cr>", opts)
