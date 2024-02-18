local function set_default_keymaps(client)
  local function try_map(provider, mode, lhs, rhs, opts)
    opts = opts or {}
    opts.buffer = true
    if client.server_capabilities[provider] then
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  end

  try_map("definitionProvider", "n", "gd", vim.lsp.buf.definition, { desc = "[lsp] goto definition" })
  try_map("typeDefinitionProvider", "n", "gT", vim.lsp.buf.type_definition, { desc = "[lsp] goto type definition" })
  try_map("declarationProvider", "n", "gD", vim.lsp.buf.declaration, { desc = "[lsp] goto declaration" })
  try_map("renameProvider", "n", "<leader>cr", vim.lsp.buf.rename, { desc = "[lsp] rename" })
  try_map("documentFormattingProvider", "n", "<leader>cf", vim.lsp.buf.format, { desc = "[lsp] code format" })
  try_map("signatureHelpProvider", "n", "<C-s>", vim.lsp.buf.signature_help, { desc = "[lsp] signature" })
  try_map("hoverProvider", "n", "K", vim.lsp.buf.hover, { desc = "[lsp] hover" })
  try_map("codeActionProvider", "n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[lsp] code action" })
end

local function enable_highligh_on_hold(client, bufnr)
  if not client.server_capabilities.documentHighlightProvider then
    return
  end

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

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", config = true },
    { "j-hui/fidget.nvim", config = true },
    { "williamboman/mason-lspconfig.nvim", config = true },
  },
  config = function()
    local lspcfg = require("lspconfig")
    local mason = require("mason-lspconfig")

    lspcfg.util.default_config = vim.tbl_extend("force", lspcfg.util.default_config, {
      autostart = true,
      default_capabilities = require("cmp_nvim_lsp").default_capabilities(),
      on_attach = function(client, bufnr)
        set_default_keymaps(client)
        enable_highligh_on_hold(client, bufnr)
      end,
    })

    local lsp_servers = mason.get_installed_servers()
    table.insert(lsp_servers, "rubocop")
    for _, server_name in ipairs(lsp_servers) do
      local ok, server_conf = pcall(function()
        return require("lsp." .. server_name)
      end)
      if not ok then
        server_conf = {}
      end
      lspcfg[server_name].setup(server_conf)
    end
  end,
}
