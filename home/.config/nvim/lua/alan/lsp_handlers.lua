local M = {}

local lsp_format = require("lsp-format")

M.setup = function()
  vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
  vim.fn.sign_define("DiagnosticSignWarning", { texthl = "DiagnosticSignWarning", text = "", numhl = "" })
  vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "" })
  vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

M.on_attach = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[lsp] goto definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "[lsp] goto declaration" })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "[lsp] goto type definition" })
  vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "[lsp] rename" })
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[lsp] code action" })
  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "[lsp] signature" })
  if filetype ~= "lua" then
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "[lsp] hover" })
  end
  -- client.server_capabilities.documentFormattingProvider = false -- disable formatting
  lsp_format.on_attach(client)
end

return M
