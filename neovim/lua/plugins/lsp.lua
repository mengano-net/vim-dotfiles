-- LSP, completion

vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}

local nvim_lsp = require 'lspconfig'
local opts = { noremap=true, silent=true }


nvim_lsp.pyright.setup {
    cmd = { '/usr/bin/pyright', '--stdio' },
    filetypes = { 'python' }
}
-- turning off until IO figure out how to disable all those error that pop up on yaml
-- nvim_lsp.yamlls.setup{}


local on_attach = function(client, bufnr)
    require'completion'.on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
end


-- Mappings
-- See `:help vim.lsp.*` for documentation on any of the below functions
-- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

-- local servers = {'pyright', 'yamlls', 'vimls'}
local servers = { 'pyright' }
    for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
    on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

