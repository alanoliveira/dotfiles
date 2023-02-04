return {
  "mfussenegger/nvim-dap",
  keys = "<leader>d",
  dependencies = {
    "nvim-telescope/telescope-dap.nvim", -- telescope integration
    "theHamsta/nvim-dap-virtual-text", -- show current variable values
    "rcarriga/nvim-dap-ui", -- debugger ui
  },
  config = function()
    local dap = require("dap")
    require("nvim-dap-virtual-text").setup()

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.zig = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        console = "internalConsole",
      },
    }

    dap.configurations.c = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/a.out",
        cwd = "${workspaceFolder}",
        console = "internalConsole",
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        console = "internalConsole",
      },
    }

    local dap_widgets = require "dap.ui.widgets";
    local map = vim.keymap.set
    map("n", "<leader>db", dap.toggle_breakpoint, { desc = "[dap] toggle breakpoint" })
    map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
      { desc = "[dap] conditional breakpoint" })
    map("n", "<leader>dh", dap_widgets.hover, { desc = "[dap] hover" })
    map("n", "<leader>dr", dap.repl.toggle, { desc = "[dap] toggle REPL" })
    map("n", "<leader>dus", function() dap_widgets.centered_float(dap_widgets.scopes) end, { desc = "[dap] ui scopes" })
    map("n", "<leader>duf", function() dap_widgets.centered_float(dap_widgets.frames) end, { desc = "[dap] ui frames" })
    map("n", "<leader>due", function() dap_widgets.centered_float(dap_widgets.expression) end,
      { desc = "[dap] ui expressions" })
    map("n", "<leader>dut", function() dap_widgets.centered_float(dap_widgets.threads) end, { desc = "[dap] ui threads" })
    map("n", "<leader>duu", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "[dap] dapui toggle" })
    map("n", "<leader>dc", function() dap.continue(); dap.repl.open() end, { desc = "[dap] continue" })

    local ok, telescope = pcall(require, "telescope")
    if ok then
      telescope.load_extension("dap")
    end
  end,
}
