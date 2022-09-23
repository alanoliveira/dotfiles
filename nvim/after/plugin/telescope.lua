local telescope = require("telescope")
local actions = require("telescope.actions")

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
      hidden = true
    },
    diagnostics = {
      previewer = false,
    },
  },

  extensions = {
    'dap'
  },
}

local map = vim.keymap.set
map("n", "<space>ft", "<cmd> :Telescope find_files<CR>", { desc = "find_files" })
map("n", "<space>fb", "<cmd> :Telescope buffers<CR>", { desc = "buffers" })
map("n", "<space>fr", "<cmd> :Telescope live_grep<CR>", { desc = "live grep" })
map("n", "<space>fg", "<cmd> :Telescope git_status<CR>", { desc = "git status" })
map("n", "<space>fs", "<cmd> :Telescope lsp_document_symbols<CR>", { desc = "document symbols" })
map("n", "<space>fd", "<cmd> :Telescope diagnostics<CR>", { desc = "document symbols" })
map("n", "<space>fo", "<cmd> :Telescope oldfiles<CR>", { desc = "telescope" })
map("n", "<space>ff", "<cmd> :Telescope<CR>", { desc = "telescope" })
