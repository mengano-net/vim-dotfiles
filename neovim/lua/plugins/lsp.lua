-- LSP, completion

vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
local nvim_lsp = require'lspconfig'
-- local protocol = require'vim.lsp.protocol'

local custom_lsp_attach = function(client, bufnr)
    require'completion'.on_attach()

    local opts = { noremap=true, silent=true }

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.declaration()<CR>', opts)
end

nvim_lsp.pyright.setup {
    cmd = { '/usr/bin/pyright', '--stdio' },
    filetypes = { 'python' }
}

nvim_lsp.bashls.setup {
    filetypes = { 'sh', 'zsh' }
}

nvim_lsp.vimls.setup {}

-- turning off until IO figure out how to disable all those error that pop up on yaml
-- nvim_lsp.yamlls.setup{}
nvim_lsp.yamlls.setup{
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
        },
    }
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
                globals = {'vim'}
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


-- local servers = {'pyright', 'yamlls', 'vimls'}
local servers = { 'pyright', 'vimls', 'bashls', 'yamlls' }
    for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
    on_attach = custom_lsp_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

