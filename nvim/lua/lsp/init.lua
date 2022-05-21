local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- vim.lsp.set_log_level("DEBUG")
require "lsp.custom-lsp-servers"
require "lsp.configs"
require "lsp.aux_plugins"
require("lsp.handlers").setup()
