-- auto close brackets, etc
return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {
      disable_in_macro = true,
      disable_filetype = { "TelescopePrompt", "dap-repl" },
    }
  end,
}

