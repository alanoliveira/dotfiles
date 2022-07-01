P = function(v)
  print(vim.inspect(v))
  return v
end

AutoFormat = function()
  if vim.lsp.buf.server_ready()
  then
    vim.lsp.buf.format()
  else
    require("formatter.format").format(
      "",
      "",
      1,
      vim.api.nvim_buf_line_count(0)
    )
  end
end
