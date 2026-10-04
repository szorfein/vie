local lang_utils = require('utils.lang')

if vim.fn.executable('go') == 0 then
    return {}
end

return {
    {
        import = 'lazyvim.plugins.extras.lang.go',
    },
    {
        'neovim/nvim-lspconfig',
        optional = true,
        opts = {
            servers = {
                gopls = {},
            },
        },
    },
    -- undo none-ls
    {
        'nvimtools/none-ls.nvim',
        enabled = false,
    },
    {
        'mason-org/mason.nvim',
        optional = true,
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            lang_utils.remove_str_from_list(opts.ensure_installed, 'gomodifytags')
            lang_utils.remove_str_from_list(opts.ensure_installed, 'impl')
        end,
    },
    {
        'stevearc/conform.nvim',
        optional = true,
        opts = {
            formatters_by_ft = {
                go = { 'goimports', 'gofumpt' },
            },
        },
    },
}
