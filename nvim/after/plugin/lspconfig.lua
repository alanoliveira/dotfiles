-- IMPORTANT: make sure to setup lua-dev BEFORE lspconfig
require("lua-dev").setup({})

local lspcfg = require("lspconfig")
local lsp_format = require("lsp-format")
local null_ls = require("null-ls")
require("nvim-lsp-installer").setup({ ensure_installed = { "sumneko_lua" } })
require "lsp_signature".setup({ floating_window = false, hint_prefix = "" })
lsp_format.setup({})

vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarning", { texthl = "DiagnosticSignWarning", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "" })

-- vim.diagnostic.config({ virtual_text = false })

local on_attach = function(client, bufnr)
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
  lsp_format.on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspcfg.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspcfg.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspcfg.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspcfg.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspcfg.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

null_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  sources = {
    -- null_ls.builtins.code_actions.eslint_d,
    -- null_ls.builtins.formatting.eslint_d,
    -- null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.shfmt,
  },
})
