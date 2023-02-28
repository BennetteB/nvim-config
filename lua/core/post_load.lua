local keymaps = require "core.keymaps"
local registry = require "mason-registry"

registry:on(
    "package:install:success",
    vim.schedule_wrap(function(pkg, handle)
        print(string.format("Successfully installed %s", pkg.name))
        vim.defer_fn(function()
          vim.api.nvim_command('LspStart')
          print("LSP Started")
        end, 1000)
    end
  )
)

vim.notify = require("notify")


local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map Leader
vim.g.mapleader = keymaps.leader

-- Clear search highlighting
map('n', keymaps.clear_search_highlighting , ':nohl<CR>')

-- Move around splits using Ctrl + {h,j,k,l}
map('n', keymaps.move_to_left_window, '<C-w>h')
map('n', keymaps.move_to_down_window, '<C-w>j')
map('n', keymaps.move_to_up_window, '<C-w>k')
map('n', keymaps.move_to_right_window, '<C-w>l')

-- Save file
map('n', keymaps.save_file, ':w<CR>')

-- Nvim Tree
map('n', keymaps.open_explorer, ':NvimTreeToggle<CR>') -- Toggle Open/Close

-- Bufferline
map('n', keymaps.next_buffer, ':BufferLineCycleNext<CR>')
map('n',keymaps.previous_buffer, ':BufferLineCyclePrev<CR>')

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n',keymaps.telescope_find_files, builtin.find_files, {})
vim.keymap.set('n',keymaps.telescope_live_grep, builtin.live_grep, {})
vim.keymap.set('n',keymaps.telescope_buffers, builtin.buffers, {})
vim.keymap.set('n',keymaps.telescope_help_tags, builtin.help_tags, {})

-- Trouble
map("n", keymaps.trouble_toggle, ':TroubleToggle<CR>')
map("n", keymaps.trouble_quick_fix, ':TroubleToggle quickfix<CR>')


