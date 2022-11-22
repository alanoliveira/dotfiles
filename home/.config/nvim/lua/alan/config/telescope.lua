local telescope = require("telescope")
local actions = require("telescope.actions")
local pickers = require "telescope.pickers"

telescope.setup {
  defaults = {
    file_ignore_patterns = { ".git/" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },

  pickers = {
    find_files = {
      previewer = false,
      hidden = true,
    },
    builtin = {
      include_extensions = true,
    },
    diagnostics = {
      previewer = false,
    },
    oldfiles = {
      only_cwd = true,
    },
    colorscheme = {
      enable_preview = true,
    },
    buffers = {
      attach_mappings = function(_, map)
        map("n", "d", actions.delete_buffer)
        return true
      end,
    },
  },
}

local builtin = require("telescope.builtin")
local map = vim.keymap.set
map("n", "<leader>ft", builtin.find_files, { desc = "find_files" })
map("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
map("n", "<leader>fr", builtin.live_grep, { desc = "live grep" })
map("n", "<leader>fg", builtin.git_status, { desc = "git status" })
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "document symbols" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "old files" })
map("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
map("n", "<leader>ff", builtin.builtin, { desc = "all pickers" })

if pcall(require, "harpoon") then
  telescope.load_extension("harpoon")
  map("n", "<leader>fj", telescope.extensions.harpoon.marks, { desc = "harpoon marks" })
end

if pcall(require, "dap") then
  telescope.load_extension("dap")
end
