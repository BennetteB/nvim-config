local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map Leader
vim.cmd "nnoremap <SPACE> <Nop>"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlighting
map('n', '<Esc>', ':nohl<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Save file
map('n', '<leader>s', ':w<CR>')

-- Nvim Tree
map('n', '<leader>e', ':NvimTreeToggle<CR>') -- Toggle Open/Close

-- Bufferline
map('n', '<S-l>', ':BufferLineCycleNext<CR>')
map('n', '<S-h>', ':BufferLineCyclePrev<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- vim.cmd [[
--   noremap gc :lua vim.lsp.buf.code_action()<CR>
--   noremap gt :lua vim.lsp.buf.type_definition()<CR>
--   noremap gf :lua vim.lsp.buf.format()<CR>
-- ]]

local LSP_Keymaps = {
  declaration = "gD",
  definition = "gk",
  hover = "K",
  implementation = "gi",
  signature_help = "<C-k>",
  add_workspace_folder = "<leader>wa",
  remove_workspace_folder = "<leader>wr",
  list_workspace_folders = "<leader>wl",
  type_definition = "<leader>d",
  rename = "gn",
  code_action = "gd",
  references = "gr",
  format = "gf"
}

return LSP_Keymaps
