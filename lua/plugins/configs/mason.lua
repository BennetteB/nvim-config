local servers = {
  "lua_ls",
  "jdtls"
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
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

for _, server in pairs(servers) do
  if server == "jdtls" then
    lspconfig[server].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git")
    })
  else
    lspconfig[server].setup({
      on_attach = on_attach,
      flags = lsp_flags,
    })
  end
end
