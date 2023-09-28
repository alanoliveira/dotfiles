return {
  "windwp/nvim-projectconfig",
  priority = 100,
  config = function()
    require("nvim-projectconfig").setup({
      project_dir = require("alan.dirs").projects_config .. "/",
    })
  end,
}
