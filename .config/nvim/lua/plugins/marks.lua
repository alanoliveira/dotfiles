return {
  "chentoast/marks.nvim",
  config = function()
    require "marks".setup {
      bookmark_0 = {
        sign = "⚑",
        annotate = true,
      },
    }
  end,
}
