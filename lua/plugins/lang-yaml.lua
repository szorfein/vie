return {
    {
        import = 'lazyvim.plugins.extras.lang.yaml',
    },
    {
        'nvim-treesitter/nvim-treesitter',
        optional = true,
        opts = {
            ensure_installed = {
                'yaml',
            },
        },
    },
    {
        'stevearc/conform.nvim',
        optional = true,
        dependencies = {
            {
                'mason-org/mason.nvim',
                optional = true,
                opts = {
                    ensure_installed = { 'prettierd' },
                },
            },
        },
        opts = {
            formatters_by_ft = {
                yaml = { 'prettierd' },
            },
        },
    },
}
