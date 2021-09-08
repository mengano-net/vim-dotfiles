-- lspsaga.lua

local saga = require'lspsaga'
local utils = require'utils'                            -- my own utlities module

saga.init_lsp_saga {
    border_style = 'round',
}


-- Mappings
utils.map('n', '<leader>K', ':Lspsaga hover_doc<cr>')


