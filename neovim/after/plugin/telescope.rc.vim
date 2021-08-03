nnoremap <leader>tf <cmd>lua require('telescope.builtin').find_files({
    \ layout_config         = {
        \ width = 0.9,
    \ },
    \ cwd           = '~/',
\})<CR>
nnoremap <leader>tr <cmd>lua require('telescope.builtin').live_grep({
    \ layout_config         = {
        \ width = 0.9,
    \ },
    \ path_display = shorten,
\})<CR>
" Similar to previous map but it allows to filter the search to only
" those relating to the string you first set on "Rg> " prompt
" Thus, it's a grep, within a grep
nnoremap <leader>tg <cmd>lua require('telescope.builtin').grep_string({
    \ layout_config         = {
        \ width = 0.9,
    \ },
    \ path_display = shorten,
    \ search = vim.fn.input('Rg> '),
\})<CR>
nnoremap <leader>tb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>th <cmd>lua require('telescope.builtin').help_tags({
    \ layout_config         = {
        \ width = 0.9,
    \ }
\})<CR>
nnoremap <leader>tc <cmd>lua require('telescope.builtin').commands({
    \ layout_config         = {
        \ width = 0.9,
    \ }
\})<CR>
nnoremap <leader>tk <cmd>lua require('telescope.builtin').keymaps({
    \ layout_config         = {
        \ width = 0.9,
    \ }
\})<CR>

nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>ch <cmd>lua require('telescope.builtin').command_history()<CR>
nnoremap <leader>jl <cmd>lua require('telescope.builtin').jumplist()<CR>

" Custom telescope find file to bring up nvim's configuration files.
nnoremap <leader>nc <cmd>lua require('telescope.builtin').find_files({
    \ prompt_title          = "<NVim Config>",
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
