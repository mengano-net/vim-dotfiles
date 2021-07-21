if !exists('g:loaded_telescope') | finish | endif

nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tr <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>tb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>th <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>tgf <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>tch <cmd>lua require('telescope.builtin').command_history()<CR>
nnoremap <leader>tjl <cmd>lua require('telescope.builtin').jumplist()<CR>

" Custom telescope find file to bring up nvim's configuration files.
" Once edits are done, I can call :Config and presto
nnoremap <leader>vrc <cmd>lua require('telescope.builtin').find_files({
    \prompt_title = "<Vim RC>",
    \ previewer = false,
    \cwd = "~/.config/nvim",
    \})<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup  {
    defaults = {
        prompt_prefix = "> ",
        initial_mode = "insert",
        layout_strategy = "vertical",
        previewer = false,
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
