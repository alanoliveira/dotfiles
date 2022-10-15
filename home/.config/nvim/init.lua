require "alan.globals"
require "alan.options"
require "alan.plugins"
require "alan.mappings"
require "alan.commands"

if vim.g.started_by_firenvim then
  require "alan.firenvim"
end
