return {
  "zbirenbaum/copilot.lua",
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
    })

    vim.keymap.set({ "n", "i" }, "<F12>", function()
      if require("copilot.client").is_disabled() then
        require("copilot.command").enable()
      else
        require("copilot.command").disable()
      end
    end)
  end,
}
