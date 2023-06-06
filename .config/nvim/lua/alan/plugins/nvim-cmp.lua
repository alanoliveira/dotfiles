-- Code completion
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
    { "onsails/lspkind.nvim" },
  },
  config = function()
    local cmp = require("cmp")

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

      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-e>"] = cmp.mapping.abort(),
      }),

      sources = cmp.config.sources({
        { name = "vim-dadbod-completion" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer",               keyword_length = 3 },
        { name = "path" },
      }),

      formatting = {
        format = require("lspkind").cmp_format {
          menu = {
            ["vim-dadbod-completion"] = "[DB]",
            ["nvim_lsp"] = "[LSP]",
            ["buffer"] = "[BUF]",
            ["path"] = "[PATH]",
            ["luasnip"] = "[SNIP]",
            ["copilot"] = "[COP]",
          },
        },
      },

      experimental = {
        ghost_text = true,
      },
    }
  end,
}
