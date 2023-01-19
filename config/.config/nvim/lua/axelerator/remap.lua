vim.g.mapleader = " " 

vim.keymap.set("n", "<leader>ve", "<cmd>e ~/dotfiles/config/.config/nvim/lua/axelerator<CR>");
vim.keymap.set("n", "<leader>vp", "<cmd>e ~/dotfiles/config/.config/nvim/lua/axelerator/packer.lua<CR>");

vim.keymap.set("n", "<C-g>", "<cmd>Telescope live_grep<CR>");
vim.keymap.set("n", "<leader>crf", "<cmd>silent exec \"!echo '%' | pbcopy\"<CR>");
vim.keymap.set("n", "<leader>rtl", "<cmd>silent lua exec_rails_test_line()<CR>");

function exec_rails_test_line()
  row = vim.api.nvim_win_get_cursor(0)[1];
  filename = vim.fn.expand('%');
  cmd = string.format("!tmux next-window && tmux send-keys rails' 't' '%s:%s Enter", filename, row);
  vim.cmd(cmd);
end
