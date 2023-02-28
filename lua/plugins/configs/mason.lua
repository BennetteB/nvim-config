local servers = {
  "lua_ls",
}

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig = require "lspconfig"

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local keymaps = require("core.keymaps")

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  -- local bufopts = { noremap = false, silent = false, buffer = bufnr }
  -- vim.keymap.set('n', keymaps.declaration, vim.lsp.buf.declaration, bufopts)
  -- vim.keymap.set('n', keymaps.definition, vim.lsp.buf.definition, bufopts)
  -- vim.keymap.set('n', keymaps.hover, vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', keymaps.implementation, vim.lsp.buf.implementation, bufopts)
  -- --vim.keymap.set('n', keymaps.signature_help, vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', keymaps.add_workspace_folder, vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', keymaps.remove_workspace_folder, vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', keymaps.list_workspace_folders, function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  -- --vim.keymap.set('n', keymaps.type_definition, vim.lsp.buf.type_definition, bufopts)
  -- --vim.keymap.set('n', keymaps.rename, vim.lsp.buf.rename, bufopts)
  -- vim.keymap.set('n', "gy", function() vim.lsp.buf.code_action() end, bufopts)
  -- vim.keymap.set('n', keymaps.references, vim.lsp.buf.references, bufopts)
  -- vim.keymap.set('n', keymaps.format, function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

for _, server in pairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    flags = lsp_flags,
  })
end
