return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-symbols.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    telescope.setup {
      defaults = {
        file_ignore_patterns = { "%.git/" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.select_default,
          },
          n = {
            ["T"] = actions.toggle_all,
          },
        },
      },
      pickers = {
        find_files = {
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
          sort_lastused = true,
          attach_mappings = function(_, map)
            map("n", "d", actions.delete_buffer)
            map("i", "<C-d>", actions.delete_buffer)

            return true
          end,
        },
        git_status = {
          attach_mappings = function(_, map)
            map("n", "<Tab>", actions.toggle_selection + actions.move_selection_worse)

            return true
          end,
        },
        symbols = {
          sources = { "nerd", "math", "latex", "kaomoji", "julia", "gitmoji", "emoji" },
        },
      },
      extensions = {
        "harpoon",
        live_grep_args = {
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
            },
          },
        },
      },
    }

    local builtin = require("telescope.builtin")
    local map = vim.keymap.set
    map("n", "<leader>ft", builtin.find_files, { desc = "find_files" })
    map("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
    map("n", "<leader>fr", telescope.extensions.live_grep_args.live_grep_args, { desc = "live grep args" })
    map("n", "<leader>fg", builtin.git_status, { desc = "git status" })
    map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "document symbols" })
    map("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostics" })
    map("n", "<leader>fo", builtin.oldfiles, { desc = "old files" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
    map("n", "<leader>ff", builtin.builtin, { desc = "all pickers" })

    if pcall(require, "harpoon") then
      map("n", "<leader>fj", telescope.extensions.harpoon.marks, { desc = "harpoon marks" })
    end
  end,
}
