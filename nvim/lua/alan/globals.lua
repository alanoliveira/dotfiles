P = function(v)
  print(vim.inspect(v))
  return v
end

HasGem = function(gem_name)
  local ret = nil
  local jid = vim.fn.jobstart("bundle info " .. gem_name, { on_exit = function(_, data) ret = data end })
  vim.fn.jobwait({ jid }, 5000)
  return ret == 0
end
