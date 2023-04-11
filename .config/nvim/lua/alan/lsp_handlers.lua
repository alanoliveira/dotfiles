local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.virtual_lines_enabled = false;

M.on_attach = function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[lsp] goto definition" })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "[lsp] goto declaration" })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "[lsp] goto type definition" })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "[lsp] rename" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[lsp] code action" })
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = bufnr, desc = "[lsp] code format" })
  vim.keymap.set("n", "<leader>cl", function()
    M.virtual_lines_enabled = not M.virtual_lines_enabled
    vim.diagnostic.config({ virtual_lines = M.virtual_lines_enabled, virtual_text = not M.virtual_lines_enabled })
  end, { desc = "Toggle lsp_lines" })
  vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "[lsp] signature" })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "[lsp] hover" })

  if client.server_capabilities.documentHighlightProvider then
    local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

    vim.api.nvim_create_autocmd("CursorHold", {
      group = gid,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      group = gid,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end
end

return M
