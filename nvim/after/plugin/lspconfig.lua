local status_ok, lspcfg = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("nvim-lsp-installer").setup({ ensure_installed = { "sumneko_lua", "efm" } })
require('toggle_lsp_diagnostics').init({ virtual_text = false })
require "lsp_signature".setup({ floating_window = false, hint_prefix = "" })
require("lsp-format").setup {}

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local on_attach = function(client, bufnr)
  require "lsp-format".on_attach(client)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, bufopts)
end

lspcfg.solargraph.setup {
  on_attach = on_attach,
  init_options = {
    formatting = false
  },
  settings = {
    solargraph = {
      diagnostics = false
    },
  },
}
lspcfg.zls.setup {
  on_attach = on_attach
}
lspcfg.gopls.setup {
  on_attach = on_attach
}

local prettier = {
  formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:vim.o.tabstop}]],
  formatStdin = true,
}

lspcfg.efm.setup {
  on_attach = on_attach,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      javascript = { prettier },
      html = { prettier },
      css = { prettier },
      json = { prettier },
      zsh = {
        {
          formatStdin = true,
          lintSource = "shellcheck",
          lintCommand = [[shellcheck -f gcc -x]],
          lintFormats = { '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m' },
          formatCommand = [[shfmt -ci -s -i 4 -bn]]
        }
      },
      ruby = {
        {
          lintCommand = "bundle exec rubocop --format emacs --force-exclusion --stdin ${INPUT}",
          lintIgnoreExitCode = true,
          lintStdin = true,
          lintFormats = { '%f:%l:%c: %t: %m' },
          rootMarkers = { 'Gemfile', '.rubocop.yml', "Rakefile" },
          formatStdin = true,
          formatCommand = "bundle exec rubocop --auto-correct --stdin ${INPUT} 2>/dev/null | sed '1,/^====================$/d'"
        }
      }
    },
  },
}

lspcfg.sumneko_lua.setup {
  on_attach = on_attach,
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
