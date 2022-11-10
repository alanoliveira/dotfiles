if vim.g.started_by_firenvim == true then
  require "alan.firenvim"
else
  require "alan.globals"
  require "alan.options"
  require "alan.plugins"
  require "alan.mappings"
  require "alan.commands"
end
