local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
require('spellsitter').setup()

treesitter.setup {
  auto_install = true,
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}
