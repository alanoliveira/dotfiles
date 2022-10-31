require "nvim-treesitter.configs".setup {
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "help" },
  },
  context_commentstring = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  playground = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
}
