nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tr <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>tb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>th <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>tch <cmd>lua require('telescope.builtin').command_history()<CR>
nnoremap <leader>jl <cmd>lua require('telescope.builtin').jumplist()<CR>

" Custom telescope find file to bring up nvim's configuration files.
nnoremap <leader>vrc <cmd>lua require('telescope.builtin').find_files({
    \ prompt_title          = "<Vim RC>",
    \ previewer             = false,
    \ cwd                   = "~/.config/nvim",
    \ file_ignore_patterns  = {
        \ "undodir/*",
        \ "plugged/*",
    \ },
    \ layout_config         = {
        \ width = 0.7,
    \ }
\})<CR>


lua << EOF
local actions = require('telescope.actions')
require('telescope').setup  {
    defaults = {
        prompt_prefix = "> ",
        initial_mode = "insert",
        layout_strategy = "vertical",
        --layout_strategy = "horizontal",
        previewer = false,
        -- User Telescope's defaults fuzzy file sorter(ships with it)
        file_sorter = require('telescope.sorters').get_fzy_sorter,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        winblend = 0,
        mappings = {
            n = {
                ["q"] = actions.close
            },
            i = {
                ["<C-q>"] = actions.send_to_qflist,
                ["<Esc>"] = actions.close,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
            },
        },
        path_display = {
            -- shorten pathnames with a number of characters speficied
            --shorten = 15,
            'absolute',
        },
    },
    extensions = {
        -- use the native fuzzy sorter that ships with Telescope
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
EOF
