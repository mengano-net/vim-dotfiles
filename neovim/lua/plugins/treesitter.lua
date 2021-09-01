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
        },
    },
}

