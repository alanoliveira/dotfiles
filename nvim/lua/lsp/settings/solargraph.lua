local cmd = { "solargraph", "stdio" }

if vim.env.SOLARGRAPH_USE_BUNDLE then
    cmd = { "bundle", "exec", "solargraph", "stdio" }
end

return {
    root_dir = require "lspconfig".util.root_pattern('.git'),
    cmd = cmd
}
