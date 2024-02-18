local telescope = require('telescope')

return telescope.register_extension({
    exports = {
        taglist = require("telescope.custom.taglist"),
        bundle_gems = require("telescope.custom.bundle-gems"),
        rails_routes = require("telescope.custom.rails-routes"),
    },
})

