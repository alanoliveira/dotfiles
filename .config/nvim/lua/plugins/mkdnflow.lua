return {
  "jakewvincent/mkdnflow.nvim",
  config = function()
    require("mkdnflow").setup({
      links = {
        transform_explicit = function(input)
          return input:lower():gsub(" ", "_")
        end,
      },
    })
  end,
}
