-- init.lua

------------    Loading other modules                   ------------------------------

require'plugins.telescope'                              -- my telescope options
require'plugins.lexima'                                 -- my lexima options
require'plugins.treesitter'                             -- my treesitter and LSP options
require'plugins.lsp'                                    -- my treesitter and LSP options
local utils = require'utils'                            -- my own utlities module

-- lualine plugin
require('lualine').setup {
  options = {
    -- theme = 'onedark',
    theme = 'gruvbox',
    icons_enabled = true,
    extensions = {'fugitive'},
    lualine_x = {
        {
            'diagnostics',
            sources = {"nvim_lsp"},
            symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
        },
        -- 'encoding',
        'filetype',
    },
  }
}

-- devicons
require'nvim-web-devicons'.setup {
    default = true;
}

------------    Variables, requires, options, helpers    ------------------------------

-- Variables
local cmd 		= vim.cmd                               -- to execute Vim commands e.g. cmd('pwd')
local fn 		= vim.fn                                -- to call Vim functions e.g. fn.bufnr()
local g 		= vim.g                                 -- a table to access global variables
local o 		= vim.opt                               -- to set options with a global scope
local wo 		= vim.wo                                -- to set options with a window scope
local bo 		= vim.bo                                -- to set options with a buffer scope


-- Global variables
-- g.gruvbox_flat_style = 'dark'
-- g.gruvbox_colors = { bg = "#1d2021" }				-- overwriting background color
g.mapleader = ' '

-- Global options; these apply to all buffers
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.termguicolors = true
o.background = 'dark'
o.ruler = true
o.backup = false
o.writebackup = false
o.swapfile = false

-- These make undo persistent by saving undo lists in a file, however it g=resented
-- problems whereby nvim would create a `~` on every directory I edited files in, thus removing
-- them for now
-- o.undofile = true
-- o.undodir = '~/.cache/nvim/undodir'

o.pastetoggle = '<F2>'
-- o.showtabline = 1                                    -- not needed since I'm running buftabline
o.backspace = 'indent,eol,start'
o.showcmd = false
o.showmode = false
o.wildoptions = 'pum'
o.wildignore = o.wildignore + { '*.swp,.git,.gitignore' }
o.path = o.path + { '.,**,' }
o.hidden = true
o.splitright = true
o.splitbelow = true
o.wildmenu = true
o.wildmode = 'full'
o.redrawtime = 250
o.softtabstop = 4
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent= true
o.textwidth = 99
o.updatetime = 100                                      -- refreshes buffers faster
-- o.list = true                                           -- show whitespaces

-- Options that are scoped to windows
wo.number = true
wo.wrap = false
wo.relativenumber = true
wo.wrap	= false
wo.cul = true
wo.cuc = true
wo.colorcolumn = '100'
wo.signcolumn = 'yes:1'

-- Options scoped to buffers


------------    Commands, autocommands                   ------------------------------

-- @TOLUA
cmd[[

syntax enable
set background=dark
" colorscheme gruvbox
" colorscheme gruvbox-flat
let g:onedark_style = 'deep'
" colorscheme onedark
colorscheme gruvbox8_hard

augroup highlight_on_yank
    autocmd!
    " au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
    au TextYankPost * silent! lua vim.highlight.on_yank {timeout=500}
augroup END

" Unset paste mode aboue on InsertLeave action, that is leaving insert mode
autocmd InsertLeave * silent! set nopaste

" Spelling mistakes will be colored up red
hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f

" LspDiagnostics highlights
highlight LspDiagnosticsDefaultError guifg=BrightRed
highlight LspDiagnosticsVirtualTextError guifg=Red
highlight LspDiagnosticsUnderlineError guifg=Red
highlight LspDiagnosticsVirtualTextWarning guifg=Yellow

let g:netrw_liststyle = 3
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'              " hide dotfiles on load
let g:netrw_banner = 0
let g:netrw_winsize = 30                                    " width in percent
let g:netrw_browser_split = 4                               " open in prior windoww
let g:netrw_altv = 1                                        " open splits to the right
let g:netrw_sort_sequence = '[\/]$,*'                       " sort directories first, files after
let g:netrw_keepdir = 0                                     " syn current and browsing directories

function! ToggleNetrw()
    let i = bufnr("$")
    let wasOpen = 0
    while (i >= 1)
        if (getbufvar(i, "&filetype") == "netrw")
            silent exe "bwipeout " . i
            let wasOpen = 1
        endif
        let i-=1
    endwhile
    if !wasOpen
        silent Lexplore
    endif
endfunction
" map <leader>f :call ToggleNetrw() <CR>

" Trailing whitespaces will be marked as errors, thus appear on red.
match errorMsg /\s\+$/
" match WarningMsg /\s\+$/
" match Whitespace /\s\+$/

" No lines on terminal window, also go stright into insert mode
au TermOpen * silent! setlocal nonumber norelativenumber
au TermOpen * silent! startinsert
]]


------------    Plugins     ------------------------------------------------

require "paq" {
    'savq/paq-nvim';                            -- Let Paq manage itself

    -- Color Schemes
    -- 'morhetz/gruvbox';                          -- gruxbox colorscheme
    -- 'eddyekofo94/gruvbox-flat.nvim';            -- An nvim colorscheme base on gruvbox
    -- 'navarasu/onedark.nvim';
    'lifepillar/vim-gruvbox8';

    'ap/vim-buftabline';                        -- show buffers on tabline
    'tpope/vim-fugitive';                       -- A Git wrapper
    'cohama/lexima.vim';                        -- Automated closing of parenthesis, etc
    'haya14busa/is.vim';                        -- Clear highlights when cursor moves
    'tpope/vim-commentary';                     -- use 'gcc', 'gc1j' to toggle comments
    'kyazdani42/nvim-web-devicons';             -- devicons
    'hoob3rt/lualine.nvim';                     -- light-weight lua status line
    'airblade/vim-gitgutter';                   -- Git gutter
    '9mm/vim-closer';                           -- better automatic closing of parenths, etc

    -- Telescope
    'nvim-lua/popup.nvim';
    'nvim-lua/plenary.nvim';
    'nvim-telescope/telescope.nvim';
    'nvim-telescope/telescope-fzf-native.nvim';

    -- Built into neovim now, LSP client
    'neovim/nvim-lspconfig';
    'nvim-lua/completion-nvim';
    'kabouzeid/nvim-lspinstall';
    'glepnir/lspsaga.nvim';                     --  lightweigth LSP, based on nvim's LSP

    'nvim-treesitter/nvim-treesitter';          -- treesitter
}

------------	maps			---------------------------------------
-- utils.map('n', '', '<cr>')
utils.map('n', '<Tab>', ':bnext<cr>')				    -- TAB in normal mode will go to next buffer
utils.map('n', '<S-Tab>', ':bprevious<cr>')			    -- SHIFT-TAB will go to previous buffer
utils.map('n', '<leader>sh', ':split term://zsh<cr>')	-- Terminal on a split
utils.map('t', '<Esc>', '<C-\\><C-n>')			        -- better escape from termina's insert mode
utils.map('i', 'jk', '<Esc>')					        -- Better way to exit insert mode
utils.map('n', 'nh', ':nohl<cr>')                       -- no highhlights
utils.map('n', '<leader>p', '"0p')              -- paste last thing yanked (not system copied, not deleted)

-- <Tab> to navigate the completion menu
utils.map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
utils.map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- Use alt + hjkl to resize windows
utils.map('n', '<A-j>', ':resize -5<cr>')
utils.map('n', '<A-k>', ':resize +5<cr>')
utils.map('n', '<A-h>', ':vertical resize -5<cr>')
utils.map('n', '<A-l>', ':vertical resize +5<cr>')

-- better navigating splits
utils.map('n', '<C-h>', '<C-w><C-h>')
utils.map('n', '<C-j>', '<C-w><C-j>')
utils.map('n', '<C-k>', '<C-w><C-k>')
utils.map('n', '<C-l>', '<C-w><C-l>')

-- Better tabbing, allows slection to remain selected for hitting more/less tabs
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')
utils.map('n', '<leader>qf', ':copen 20<cr>')				-- open quick fix window
utils.map('n', '<leader>qc', ':cclose<cr>')				-- close quick fix window

-- "Y" will select remainder of the line, start at cursor,
-- similar to "D" and "C" for deleting and replacing respectively
utils.map('n', 'Y', 'y$')

-- Moving text up/down
utils.map('v', 'J', ':m \'>+1<cr>gv=gv')
utils.map('v', 'K', ':m \'<-2<cr>gv=gv')
-- utils.map('i', '<c-j>', '<esc>:m .+1<cr>')
-- utils.map('i', '<c-k>', '<esc>:m .-2<cr>')

-- Keeping it centered when hitting `n` or `N` after a search
utils.map('n', 'n', 'nzzzv')
utils.map('n', 'N', 'Nzzzv')
utils.map('n', 'J', 'mzJ`z')

-- Undo breakpoints
utils.map('i', ',', ',<c-g>u')
utils.map('i', '.', '.<c-g>u')
utils.map('i', '!', '!<c-g>u')
utils.map('i', '?', '?<c-g>u')

-- Press * to search word under cursor, then hit map below for search/replace.
utils.map('n', '<leader>r', ':%s///g<left><left>')
utils.map('n', '<leader>rc', ':%s///gc<left><left><left>')		-- same but with confirmation for each change

-- Search/replace on a visual block. You can do that by pressing *, then visual select
utils.map('x', '<leader>r', ':%s///g<left><left>')
utils.map('x', '<leader>rc', ':%s///gc<left><left><left>')		-- same but with confirmation for each change

-- Telescope maps, see lua/plugins/telescope.lua
-- utils.map('n', '<leader>tf', ':lua require(\'plugins.telescope\').find_files()<cr>')
utils.map('n', '<leader>f', ':lua require(\'plugins.telescope\').file_browser()<cr>')
utils.map('n', '<leader>gs', ':lua require(\'plugins.telescope\').grep_string()<cr>')
utils.map('n', '<leader>jl', ':lua require(\'plugins.telescope\').jumplist()<cr>')
utils.map('n', '<leader>lg', ':lua require(\'plugins.telescope\').live_grep()<cr>')
utils.map('n', '<leader>nc', ':lua require(\'plugins.telescope\').neovim_config()<cr>')
utils.map('n', '<leader>gb', ':lua require(\'plugins.telescope\').git_branches()<cr>')
utils.map('n', '<leader>gc', ':lua require(\'plugins.telescope\').git_commits()<cr>')
utils.map('n', '<leader>ch', ':lua require(\'plugins.telescope\').command_history()<cr>')
utils.map('n', '<leader>cl', ':lua require\'telescope.builtin\'.commands()<cr>')
utils.map('n', '<leader>no', ':lua require\'plugins.telescope\'.notes()<cr>')
utils.map('n', '<leader>ht', ':lua require\'plugins.telescope\'.help_tags()<cr>')
