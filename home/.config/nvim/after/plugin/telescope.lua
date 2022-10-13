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
    buffers = {
      attach_mappings = function(_, map)
        map("n", "d", actions.delete_buffer)
        return true
      end,
    },
  },
}

telescope.load_extension("dap")

local builtin = require("telescope.builtin")
local map = vim.keymap.set
map("n", "<space>ft", builtin.find_files, { desc = "find_files" })
map("n", "<space>fb", builtin.buffers, { desc = "buffers" })
map("n", "<space>fr", builtin.live_grep, { desc = "live grep" })
map("n", "<space>fg", builtin.git_status, { desc = "git status" })
map("n", "<space>fs", builtin.lsp_document_symbols, { desc = "document symbols" })
map("n", "<space>fd", builtin.diagnostics, { desc = "diagnostics" })
map("n", "<space>fo", builtin.oldfiles, { desc = "old files" })
map("n", "<space>ff", builtin.builtin, { desc = "all pickers" })
