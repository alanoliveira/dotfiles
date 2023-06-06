return {
  "windwp/nvim-projectconfig",
  config = function()
    require("nvim-projectconfig").setup({
      project_dir = vim.env.CLOUD_DIR .. "/projects-config/",
    })
  end,
}
