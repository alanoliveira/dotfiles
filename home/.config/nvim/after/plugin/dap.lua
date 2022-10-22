local dap = require("dap")
local dapui = require("dapui")
require("dap-go").setup()
require("nvim-dap-virtual-text").setup({})
dapui.setup()

dap.listeners.before.event_initialized["dapui_config"] = function()
  dapui.open({})
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  name = "lldb",
  options = {
    detached = true,
  },
}

dap.configurations.zig = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ",
        vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"), "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

local augroup = vim.api.nvim_create_augroup("dap", {})
vim.api.nvim_create_autocmd("FileType", { group = augroup, pattern = "dap-repl", command = "set nobuflisted" })
vim.api.nvim_create_autocmd("FileType",
  { group = augroup, pattern = "dap-repl", command = "lua require('dap.ext.autocompl').attach()" })

local map = vim.keymap.set
map("n", "<space>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "[dap] toggle breakpoint" })
map("n", "<space>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "[dap] conditional breakpoint" })
map("n", "<space>dr", "<cmd>lua require'dap'.repl.open()<CR>", { desc = "[dap] toggle REPL" })
map("n", "<space>dtu", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "[dap] toggle UI" })
map("n", "<space>dtr", "<cmd>lua require'dap'.repl.toggle()<CR>", { desc = "[dap] toggle REPL" })
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { desc = "[dap] continue" })
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "[dap] step over" })
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "[dap] step into" })
map("n", "<F12>", "<cmd> require'dap'.step_out()<CR>", { desc = "[dap] step out" })
