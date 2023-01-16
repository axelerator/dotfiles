vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>ve", "<cmd>e ~/dotfiles/config/.config/nvim/lua/axelerator<CR>");
vim.keymap.set("n", "<leader>vp", "<cmd>e ~/dotfiles/config/.config/nvim/lua/axelerator/packer.lua<CR>");

vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>");

