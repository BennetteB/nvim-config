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
