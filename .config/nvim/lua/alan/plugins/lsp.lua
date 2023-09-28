return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/neodev.nvim",
      dependencies = { "windwp/nvim-projectconfig", optional = true },
      config = function()
        require("neodev").setup({
          override = function(root_dir, library)
            if root_dir:find(require("alan.dirs").projects_config, 1, true) then
              library.enabled = true
              library.plugins = true
              library.runtime = true
              library.types = true
            end
          end,
        })
      end
    }, -- makes lua_ls recognize neovim lua api functions
    { "ray-x/lsp_signature.nvim", config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })
      end,
    },
    {
      "j-hui/fidget.nvim",
      tag = "legacy",
      config = function()
        require("fidget").setup({
          text = { spinner = "dots" },
          fmt = { task = false },
          timer = { fidget_decay = 2000, task_decay = 500 },
        })
      end,
    },
  },
  config = function()
    local lspcfg = require("lspconfig")
    local lsp_servers = {
      "solargraph",
      "zls",
      "gopls",
      "rust_analyzer",
      "lua_ls",
      "jsonls",
      "clangd",
    }

    for _, lsp in ipairs(lsp_servers) do
      lspcfg[lsp].setup {
        on_attach = require("alan.lsp_handlers").on_attach,
        capabilities = require("alan.lsp_handlers").capabilities,
      }
    end
  end,
}
