vim.language = "en_US.UTF-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.showmode = false
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true
vim.opt.updatetime = 300
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spelloptions:append({ "camel" })
vim.opt.spellcapcheck = ""
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = "»-", trail = "-", eol = "↴", extends = "»", precedes = "«", nbsp = "%", lead = "⋅" }
vim.opt.colorcolumn = "100"
vim.opt.mouse = ""
vim.opt.wildmode = "longest:full,full"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.showcmdloc = "statusline"
vim.g.mapleader = " "

if vim.env.WSLENV then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

local au_grp = vim.api.nvim_create_augroup("alan-au", {})
vim.api.nvim_create_autocmd("InsertEnter",
  { group = au_grp, command = "if (&number || &relativenumber) | set nornu | endif" })
vim.api.nvim_create_autocmd("InsertLeave",
  { group = au_grp, command = "if (&number || &relativenumber) | set rnu | endif" })
vim.api.nvim_create_autocmd("TextYankPost",
  { group = au_grp, pattern = "*", command = "lua require('vim.highlight').on_yank()" })

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local keys = { "n", "N", "*", "#", "<CR>", "/", "?" }
    local new_hlsearch = vim.tbl_contains(keys, vim.fn.keytrans(char))

    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace("alan-toggle-hlsearch"))

vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "" })
vim.diagnostic.config({ virtual_text = true, severity_sort = true })

local map = vim.keymap.set
map("x", "<leader>p", [["_dp]], { desc = "p using _" })
map("x", "<leader>P", [["_dP]], { desc = "P using _" })
map("i", "<C-g>u", "<Esc>g~iwgi", { desc = "Change case of word" })
