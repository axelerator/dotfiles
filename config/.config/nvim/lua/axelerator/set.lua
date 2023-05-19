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
vim.opt.clipboard = 'unnamedplus'

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



-- Override vim's italic codes.
vim.cmd("set t_ZH=^[[3m")
vim.cmd("set t_ZR=^[[23m")

-- Default to tree mode
vim.g.netrw_liststyle = 3

-- Keep the current directory and the browsing directory synced
-- . This helps you avoid the move files error.
vim.g.netrw_keepdir = 0

-- 30% split
vim.g.netrw_winsize = 30

-- Hide the banner. To show it temporarily you can use I inside Netrw.
vim.g.netrw_banner = 0

-- Change the copy command. Mostly to enable recursive copy of directories.
vim.g.netrw_localcopydircmd = 'cp -r'
