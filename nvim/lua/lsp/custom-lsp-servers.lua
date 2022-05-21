local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

if not configs.zls then
    configs.zls = {
        default_config = {
            cmd = { 'zls' },
            filetypes = { 'zig' },
            root_dir = lspconfig.util.root_pattern('.git', 'build.zig'),
            settings = {}
        }
    }
end
