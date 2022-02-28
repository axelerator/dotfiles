
-- ------------------------------------------------------------------------
-- General settings
-- --------------------------------------------------------------------------

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.hidden = true
vim.o.clipboard = "unnamedplus"
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

function nmap(key, binding)
  vim.api.nvim_set_keymap(
    "n",
    key,
    binding,
    { noremap = true }
   ) 
end

function vmap(key, binding)
  vim.api.nvim_set_keymap(
    "v",
    key,
    binding,
    { noremap = true }
   ) 
end

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

nmap("<leader>ve", ":tabe ~/.config/nvim/init.lua<CR>")
nmap("<leader>vr", ":source ~/.config/nvim/init.lua<CR>")


nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("<leader> ", "<cmd>lua vim.lsp.buf.hover()<CR>")
nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nmap("<leader><CR>", "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>")
nmap("<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>")
-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vmap("y", "myy`y")
vmap("Y", "myY`y")

nmap("<C-P>", "<cmd>Telescope find_files<CR>")
nmap("<C-G>", "<cmd>Telescope live_grep<CR>")

vim.cmd([[
  function! Rubocop()
    let save_pos = getpos(".")
    %!rubocop -A --stderr --stdin % 2> /dev/null
    call setpos(".", save_pos)
  endfunction
]])

-- auto-format
vim.api.nvim_command("autocmd BufWritePre *.elm lua vim.lsp.buf.formatting_sync(nil, 5000)")
vim.api.nvim_command("autocmd BufWritePre *.rb silent call Rubocop()")
-- --------------------------------------------------------------------------
-- Plugins
-- --------------------------------------------------------------------------

-- Automatically install paq-nvim
local paq_home = "/Users/at/.local/share/nvim/site/pack/paqs/start/paq-nvim"
if not file_exists(paq_home .. "/README.md") then
  os.execute("git clone --depth=1 https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/start/paq-nvim")
  --autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
end


require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself
    'drewtempelmeyer/palenight.vim';
    'vim-airline/vim-airline';
    'vim-airline/vim-airline-themes';
    'tpope/vim-fugitive';
    'neovim/nvim-lspconfig';

    -- LSP stuff
    'hrsh7th/cmp-nvim-lsp';
    'hrsh7th/cmp-buffer';
    'hrsh7th/nvim-cmp';
    'L3MON4D3/LuaSnip';
    'saadparwaiz1/cmp_luasnip';

    'nvim-treesitter/nvim-treesitter';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';

    -- projectionist to define 'pairs' of files
    'ngmy/vim-rubocop'

}

vim.cmd("PaqInstall")
vim.cmd("let g:palenight_terminal_italics=1")
vim.cmd("colorscheme palenight")
vim.cmd("let g:airline_theme = \"palenight\"")

require'lspconfig'.elmls.setup{}
 -- See `:help vim.lsp.*` for documentation on any of the below functions
local cmp = require'cmp'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<TAB>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer', keyword_length = 3 },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['elmls'].setup {
    capabilities = capabilities
  }

  require'lspconfig'.solargraph.setup{}
