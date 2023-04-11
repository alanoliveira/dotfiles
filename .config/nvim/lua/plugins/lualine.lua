return {
  "nvim-lualine/lualine.nvim",
  config = function()
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
        lualine_x = { "%S", "encoding", "fileformat", "filetype" },
      },
    })
  end,
}
