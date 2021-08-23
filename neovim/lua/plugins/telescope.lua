-- telescope.lua

local M = {}                                            -- The module to export


-- Telescope setup
local actions = require('telescope.actions')
require('telescope').setup  {
    defaults = {
        prompt_prefix = "> ",
        initial_mode = "insert",
        layout_strategy = "vertical",
        layout_config = {
            horizontal = {
                width_padding = 0.04,
                height_padding = 0.1,
                preview_width = 0.6,
                width = 0.9,
            },
            vertical = {
                width_padding = 0.05,
                height_padding = 1,
                preview_width = 0.5,
            },
        },
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
            shorten = 15,
            --'absolute',
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


-- A default set of options for telescope pickers
local telescope_picker_opts_default = {
    layout_config = {
        width = 0.9,
    },
    path_display = {
        -- shorten pathnames with a number of characters speficied
        shorten = 15,
        --'absolute',
    },
}

function M.neovim_config()
    -- local cwd_neovim_config = ''
    -- local USER = vim.fn.expand('$USER')
    -- if vim.fn.has('unix') == 1 then
    --     cwd_neovim_config = '/home/' .. USER .. '/.config/nvim'
    -- elseif vim.fn.has('mac') == 1 then
    --     cwd_neovim_config = '/Users/' .. USER .. '/.config/nvim'
    -- else
    --     print('Cannot detect your OS')
    --     cwd = '~/.config/nvim'
    -- end
    local opts = {
        prompt_title = '\\ NVim Config /',
        previewer = false,
        cwd = '~/.config/nvim',
        -- cwd = cwd_neovim_config,
        layout_config = {
            width = 0.5,
        },
    }
    require'telescope.builtin'.find_files(opts)
end

function M.find_files()
    local opts = {
        prompt_title = "\\ Find Files /",
        follow = 'true',
        hidden = 'false',
        layout_config = {
            width = 0.9,
        },
        -- cwd = '~/',
    }
    require'telescope.builtin'.find_files(opts)
    -- require'telescope.builtin'.file_browser(opts)
end

function M.file_browser()
    local opts = {
        prompt_title = "\\ Files Browser/",
        follow = 'true',
        hidden = 'false',
        layout_strategy = "vertical",
        layout_config = {
            width = 0.9,
        },
        cwd = '~/',
    }
    require'telescope.builtin'.file_browser(opts)
end

function M.grep_string()
    local opts = {
        layout_config = {
            width = 0.9,
        },
        search = vim.fn.input('Rg> '),
    }
    require'telescope.builtin'.grep_string(opts)
end

function M.live_grep()
    local opts = {
        prompt_title = "\\ Live Grep /",
        layout_config = {
            width = 0.9,
        },
    }
    require'telescope.builtin'.live_grep(opts)
end

function M.git_files()
    local opts = {
        prompt_title = "\\ Git /",
        layout_config = {
            width = 0.9,
        },
        -- dir_icon = '',
    }
    require'telescope.builtin'.git_files(telescope_picker_opts_default)
end

function M.git_branches()
    require'telescope.builtin'.git_branches(telescope_picker_opts_default)
end

function M.git_commits()
    require'telescope.builtin'.git_commits(telescope_picker_opts_default)
end

function M.command_history()
    local opts = {
        layout_config = {
            width = 0.5,
        },
    }
    require'telescope.builtin'.command_history(opts)
end

function M.jumplist()
    local opts = {
        layout_config = {
            width = 0.9,
        },
        -- previewer = true,
    }
    require'telescope.builtin'.jumplist(opts)
end

function M.notes()
    local opts = {
        prompt_title = "\\ Notes - IT /",
        follow = 'true',
        layout_strategy = "vertical",
        -- layout_strategy = "horizontal",
        layout_config = {
            width = 0.7,
        },
        cwd = '~/bitbucket.org/mine/it',
    }
    require'telescope.builtin'.file_browser(opts)
end


-- We want to be able to access utils in all our configuration files
-- so we add the module to the _G global variable.
_G.utils = M
return M                                                -- Export the module
