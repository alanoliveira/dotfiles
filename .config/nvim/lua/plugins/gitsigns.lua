return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gs = require("gitsigns")

    gs.setup({
      current_line_blame = true,
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
        map("n", "<leader>gS", gs.stage_buffer, { desc = "stage buffer" })
        map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
        map("n", "<leader>gR", gs.reset_buffer, { desc = "reset buffer" })
        map("n", "<leader>gp", gs.preview_hunk, { desc = "preview hunk" })
        map("n", "<leader>gb", function() gs.blame_line { full = true } end, { desc = "blame line" })
        map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "toggle blame line" })
        map("n", "<leader>gtd", gs.toggle_deleted, { desc = "toggle deleted" })
        map("n", "[g", gs.prev_hunk, { desc = "prev hunk" })
        map("n", "]g", gs.next_hunk, { desc = "next hunk" })
      end,
    })
  end,
}
