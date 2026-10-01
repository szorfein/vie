-- Should we use rufo or another formatter on conform?
-- Rubocop is not the more fast
-- Mix Rubocop and another formater is really painful...

if vim.fn.executable('ruby') == 0 then
    return {}
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        optional = true,
        opts = { ensure_installed = { 'ruby' } },
    },
    {
        'neovim/nvim-lspconfig',
        optional = true,
        opts = {
            servers = {
                ruby_lsp = { enabled = false },
                rubocop = {},
            },
        },
    },
    {
        'mason-org/mason.nvim',
        opts = { ensure_installed = { 'erb-formatter' } },
    },
    {
        'stevearc/conform.nvim',
        optional = true,
        opts = {
            formatters_by_ft = {
                ruby = { 'rubocop' },
                eruby = { 'erb_format' },
            },
        },
    },
}
