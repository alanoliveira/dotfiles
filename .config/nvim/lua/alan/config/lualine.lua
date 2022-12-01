require("lualine").setup({
  options = {
    refresh = {
      statusline = 500,
    },
  },
  sections = {
    lualine_a = {
      "mode",
      {
        color = { bg = "red" },
        function()
          local regrec = vim.fn.reg_recording()
          if #regrec > 0 then
            -- local icon = (os.time() % 2 == 0) and "◉" or " "
            return "@" .. regrec
          end
          return ""
        end,
      },
    },
    lualine_c = {
      {
        "filename",
        path = 1,
      },
    },
  },
})
