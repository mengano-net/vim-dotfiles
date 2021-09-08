-- treesitter.lua

local ts = require 'nvim-treesitter.configs'
ts.setup{
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
        ensure_installed = {
            'yaml',
            'lua',
            'shell',
            'vim',
            'python',
        },
    },
}

-- Found this on youtube, not sure if I will use it yet.
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
