-- LSP, completion

vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
local nvim_lsp = require'lspconfig'
-- local protocol = require'vim.lsp.protocol'

local on_attach = function(client, bufnr)

    require'completion'.on_attach()
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- buf_set_keymap('n', '<leader>p', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- if filetype ~= "lua" then
    --     buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
    -- end

end

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    cmd = { '/usr/bin/pyright', '--stdio' },
    -- /usr/local/bin/pyright
    filetypes = { 'python' }
}

nvim_lsp.bashls.setup {
    on_attach = on_attach,
    filetypes = { 'sh', 'zsh' }
}

nvim_lsp.vimls.setup {
    on_attach = on_attach,
    init_options = { isNeovim = true },
}

-- turning off until IO figure out how to disable all those error that pop up on yaml
-- nvim_lsp.yamlls.setup{}
nvim_lsp.yamlls.setup{
    on_attach = on_attach,
    debounce_text_changes = 150,
    filetypes = { 'yaml', 'yml' },
    settings = {
        yaml = {
            hover = true,
            format = {
                enable = true,
                singleQuote = true,
            },
            completion = true,
            validate = true,
            customTags = {
                '!Ref',
                '!ImportValue',
                '!Sub',
                '!GetAtt',
                '!GetAZs',
                '!Join sequence',
                '!Equals sequence',
                '!FindInMap sequence',
                '!Select sequence',
                '!Split sequence',
            },
        },
    },
}


-- lua-language-server
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
USER = vim.fn.expand('$USER')

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
    sumneko_root_path = "/Users/" .. USER .. "/.local/lua-language-server"
    sumneko_binary = "/Users/" .. USER .. "/.local/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
    sumneko_root_path = "/home/" .. USER .. "/.local/lua-language-server"
    sumneko_binary = "/home/" .. USER .. "/.local/lua-language-server/bin/Linux/lua-language-server"
else
    print("Unsupported system for sumneko")
end

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    debounce_text_changes = 150,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    [vim.fn.expand('~/.config.nvim/lua')] = true,
                }
            }
        }
    }
}

return {
    on_attach = on_attach,
}
