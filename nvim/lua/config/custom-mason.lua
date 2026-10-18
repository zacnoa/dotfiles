local registry = require("mason-registry")
  local servers = {}

  for _, package in ipairs(registry.get_installed_packages()) do
    local lspconfig = package.spec.neovim
      and package.spec.neovim.lspconfig

    if type(lspconfig) == "string" then
      table.insert(servers, lspconfig)
    end
  end

  vim.lsp.enable(servers)
  vim.lsp.enable("rust_analyzer")
