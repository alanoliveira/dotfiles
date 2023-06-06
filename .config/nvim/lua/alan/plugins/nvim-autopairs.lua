-- auto close brackets, etc
return {
  "windwp/nvim-autopairs",
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup {
      disable_in_macro = true,
      disable_in_visualblock = true,
      disable_filetype = { "TelescopePrompt", "dap-repl" },
    }

    autopairs.disable_and_do = function(f)
      local was_disabled = autopairs.state.disabled
      autopairs.disable()
      f()
      if not was_disabled then autopairs.enable() end
    end
  end,
}
