vim.g.mapleader = " "

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.hidden = true

vim.g.clipboard = {
  name          = 'pbcopy',
  copy          = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
  paste         = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
  cache_enabled = 0,
}

vim.o.termguicolors = true 
vim.o.scrolloff = 8
vim.o.signcolumn = "yes:2"

vim.o.number = true
--vim.o.spell = true
vim.o.wildmode = "longest:full,full"
vim.o.wrap = false
vim.o.list = true
vim.o.splitright = true
vim.o.listchars = "tab:▸ ,trail:·"

vim.g.mapleader = " " 


-- Override vim's italic codes.
vim.cmd("set t_ZH=^[[3m")
vim.cmd("set t_ZR=^[[23m")

