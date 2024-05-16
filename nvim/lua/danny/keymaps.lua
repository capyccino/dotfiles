local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- write / quit / source faster
keymap("n", "<leader>w", ":w <cr>", opts)
keymap("n", "<leader>wq", ":wq <cr>", opts)
keymap("n", "<leader>so", ":so <cr>", opts)

-- better vertical screen navigation
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- no highlights
keymap("n", "<leader>/", ":noh <cr>", opts)

-- window split
keymap("n", "<leader>v", ":vsplit <cr>", opts)
keymap("n", "<leader>h", ":split <cr>", opts)
-- window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- window resizing
keymap("n", "+", ":vertical res +4 <cr>", opts)
keymap("n", "_", ":vertical res -4 <cr>", opts)
keymap("n", "<leader>+", ":res +4 <cr>", opts)
keymap("n", "<leader>_", ":res -4 <cr>", opts)

-- buffers
keymap("n", "Q", ":Bdelete <cr>", opts)
keymap("n", "L", ":bnext <cr>", opts)
keymap("n", "H", ":bprevious <cr>", opts)

-- make opt backspace delete a whole word
keymap("i", "<A-bs>", "<ESC>ldba", opts)

-- better horizontal movement
keymap("i", "<S-Left>", "<ESC>bi", opts)
keymap("i", "<S-Right>", "<ESC>wi", opts)

-- press jk fast to escape
keymap("i", "jk", "<ESC>", opts)
keymap("v", "jk", "<ESC>", opts)

-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- don't yank what you printed over
keymap("v", "p", '"_dP', opts)

-- move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- better terminal navigations
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files <cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep <cr>", opts)

-- null-ls formatting
keymap("n", "<leader>l", ":Format <cr>", opts)

-- modes
--  normal_mode        "n",
--  insert_mode        "i",
--  visual_mode        "v",
--  visual_block_mode  "x",
--  term_mode          "t",
--  command_mode       "c",

