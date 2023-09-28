local gid = vim.api.nvim_create_augroup("mkdn-toggle-conceal", {})
local conceal_timer = nil
vim.opt_local.concealcursor = "n"
vim.opt_local.conceallevel = 2

vim.api.nvim_create_user_command(
  "MdPreview",
  "silent !firefox --new-window file://" .. vim.fn.expand("%:p"),
  { }
)

vim.api.nvim_create_autocmd("InsertEnter", {
  group = gid,
  buffer = 0,
  callback = function()
    if conceal_timer ~= nil and conceal_timer:is_active() then
      conceal_timer:stop();
    end
    vim.opt_local.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = gid,
  buffer = 0,
  callback = function()
    conceal_timer = vim.defer_fn(function() vim.opt_local.conceallevel = 2 end, 5000)
  end,
})
