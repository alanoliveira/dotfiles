-- Code completion
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "ray-x/lsp_signature.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.setup {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      sorting = {
        comparators = {
          cmp.config.compare.score,
          cmp.config.compare.exact,
          cmp.config.compare.offset,
        },
      },

      -- preselect = cmp.PreselectMode.None,

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-e>"] = cmp.mapping.abort(),
      }),

      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 3 },
        { name = "path" },
      }),

      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            ["vim-dadbod-completion"] = "[DB]",
            ["nvim_lsp"] = "[LSP]",
            ["buffer"] = "[BUF]",
            ["path"] = "[PATH]",
            ["luasnip"] = "[SNIP]",
          },
        },
      },

      experimental = {
        ghost_text = true,
      },
    }
  end,
}
