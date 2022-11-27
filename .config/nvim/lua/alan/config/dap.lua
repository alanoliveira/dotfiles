local dap = require("dap")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  name = "lldb",
}

dap.configurations.zig = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
    cwd = "${workspaceFolder}",
  },
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
    cwd = "${workspaceFolder}",
    console = "internalConsole",
  },
}

local dap_widgets = require "dap.ui.widgets";
local map = vim.keymap.set
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "[dap] toggle breakpoint" })
map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "[dap] conditional breakpoint" })
map("n", "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<CR>", { desc = "[dap] hover" })
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", { desc = "[dap] toggle REPL" })
map("n", "<leader>dut", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "[dap] toggle dapui" })
map("n", "<leader>dus", function() dap_widgets.centered_float(dap_widgets.scopes) end, { desc = "[dap] ui scopes" })
map("n", "<leader>duf", function() dap_widgets.centered_float(dap_widgets.frames) end, { desc = "[dap] ui frames" })
map("n", "<leader>due", function() dap_widgets.centered_float(dap_widgets.expression) end,
  { desc = "[dap] ui expressions" })
map("n", "<leader>dut", function() dap_widgets.centered_float(dap_widgets.threads) end, { desc = "[dap] ui threads" })
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { desc = "[dap] continue" })
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "[dap] step over" })
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "[dap] step into" })
map("n", "<F12>", "<cmd> require'dap'.step_out()<CR>", { desc = "[dap] step out" })

local ok, telescope = pcall(require, "telescope")
if ok then
  telescope.load_extension("dap")
end
