local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        file_ignore_patterns = { ".git/" },
    },

    pickers = {
        find_files = {
            previewer = false,
            hidden = true
        },
    },

    extensions = {},
}

vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })
