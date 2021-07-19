if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tr <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>tb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>th <cmd>lua require('telescope.builtin').help_tags()<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup  {
    defaults = {
        prompt_prefix = "Grep: ",
        initial_mode = "insert",
        layout_strategy = "vertical",
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
        path_display = {
            # 'shorten',
            'absolute',
        },
        winblend = 0,
    }
}
EOF
