local gs = require("gitsigns")

require("gitsigns").setup({
  current_line_blame = true,
  on_attach = function(bufnr)

    local function map(mode, l, r, opts)
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    map({ "n", "v" }, "<space>gs", "<cmd> :Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
    map({ "n", "v" }, "<space>gr", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
    map("n", "<space>gS", require("gitsigns").stage_buffer, { desc = "stage buffer" })
    map("n", "<space>gu", require("gitsigns").undo_stage_hunk, { desc = "undo stage hunk" })
    map("n", "<space>gR", require("gitsigns").reset_buffer, { desc = "reset buffer" })
    map("n", "<space>gp", require("gitsigns").preview_hunk, { desc = "preview hunk" })
    map("n", "<space>gb", function() require("gitsigns").blame_line { full = true } end, { desc = "blame line" })
    map("n", "<space>gtb", require("gitsigns").toggle_current_line_blame, { desc = "toggle blame line" })
    map("n", "<space>gd", require("gitsigns").diffthis, { desc = "diff hunk" })
    map("n", "<space>gD", function() require("gitsigns").diffthis("~") end, { desc = "diff file" })
    map("n", "<space>gtd", require("gitsigns").toggle_deleted, { desc = "toggle deleted" })
    map("n", "[g", gs.prev_hunk, { desc = "prev hunk" })
    map("n", "]g", gs.next_hunk, { desc = "next hunk" })
  end
})
