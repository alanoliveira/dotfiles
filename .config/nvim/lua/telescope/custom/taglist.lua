local action_state = require "telescope.actions.state"
local action_set = require "telescope.actions.set"
local previewers = require "telescope.previewers"
local conf = require("telescope.config").values
local finders = require "telescope.finders"
local entry_display = require "telescope.pickers.entry_display"
local pickers = require "telescope.pickers"
local utils = require "telescope.utils"

local displayer_lsp = entry_display.create {
  separator = " ",
  items = {
    { width = 35 },
    { width = 1 },
    { remaining = true },
  },
}

local function display_lsp(item, opts)
  local transformed, _ = utils.transform_path(opts, item.value.filename)
  return displayer_lsp {
    { item.value.name },
    { item.value.kind },
    { transformed },
  }
end

local displayer_std = entry_display.create {
  separator = " ",
  items = {
    { width = 1 },
    { width = 20 },
    { width = 30 },
    { remaining = true },
  },
}

local function display_std(item, opts)
  local transformed, _ = utils.transform_path(opts, item.value.filename)
  local scope = item.class or
      item.value.module or
      item.value.namespace or
      item.value.method or
      item.value.singletonMethod or
      item.value.mixin or ""
  return displayer_std {
    { item.value.kind },
    { item.value.name },
    { scope },
    { transformed },
  }
end

return function(opts)
  opts = opts or {}

  opts.search = opts.search or ".*"
  opts.path_display = opts.path_display or { truncate = true, filename_first = { reverse_directories = true } }
  opts.layout_strategy = opts.layout_strategy or "vertical"

  local scode_re = opts.use_regex and "^/(.*)\\%.*" or "/^(.*)$?/"
  local display_fn = vim.o.tagfunc == "v:lua.vim.lsp.tagfunc" and
      function(item, _) return display_lsp(item, opts) end or
      function(item, _) return display_std(item, opts) end
  local taglist = vim.fn.taglist(opts.search)

  pickers
      .new(opts, {
        prompt_title = "taglist",
        finder = finders.new_table {
          results = taglist,
          entry_maker = function(item)
            return {
              value = item,
              ordinal = item.name,
              filename = item.filename,
              scode = item.cmd:match(scode_re),
              display = display_fn,
            }
          end,
        },
        previewer = opts.previewer or previewers.ctags.new(opts),
        sorter = conf.generic_sorter(opts),
        on_complete = {
          function(picker)
            -- remove this on_complete callback
            picker:clear_completion_callbacks()
            -- if we have exactly one match, select it
            if picker.manager.linked_states.size == 1 then
              require("telescope.actions").select_default(picker.prompt_bufnr)
            end
          end,
        },
        attach_mappings = function(prompt_bufnr)
          action_set.select:enhance {
            post = function()
              local selection = action_state.get_selected_entry()
              if not selection then
                return
              end

              -- escape special characters
              local scode = selection.scode:gsub("[%]~*]", function(ch)
                return "\\" .. ch
              end)

              vim.cmd "keepjumps norm! gg"
              vim.fn.search(scode)
              vim.cmd "norm! zz"
            end,
          }
          return true
        end,
      })
      :find()
end
