local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

formatter.setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    javascript = { require("formatter.filetypes.javascript").prettier },
    css = { require("formatter.filetypes.javascript").prettier },
    scss = { require("formatter.filetypes.javascript").prettier },
  }
}
