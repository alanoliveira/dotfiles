local M = {}

local lsp_format = require("lsp-format")

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.virtual_lines_enabled = false;

M.on_attach = function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[lsp] goto definition" })
  vim.keymap.set("n", "cD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "[lsp] goto declaration" })
  vim.keymap.set("n", "cT", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "[lsp] goto type definition" })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "[lsp] rename" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[lsp] code action" })
  vim.keymap.set("n", "<leader>cl", function()
    M.virtual_lines_enabled = not M.virtual_lines_enabled
    vim.diagnostic.config({ virtual_lines = M.virtual_lines_enabled, virtual_text = not M.virtual_lines_enabled })
  end, { desc = "Toggle lsp_lines" })
  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "[lsp] signature" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "[lsp] hover" })
  -- client.server_capabilities.documentFormattingProvider = false -- disable formatting
  lsp_format.on_attach(client)
end

return M
