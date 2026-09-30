return {
    {
        'nvim-treesitter/nvim-treesitter',
        optional = true,
        opts = {
            ensure_installed = { 'bash' },
        },
    },
    {
        'neovim/nvim-lspconfig',
        optional = true,
        opts = {
            servers = {
                bashls = {},
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
                    ensure_installed = { 'shfmt' },
                },
            },
        },
        opts = {
            formatters_by_ft = {
                sh = { 'shfmt' },
                zsh = { 'shfmt' },
            },
        },
    },
    {
        'mfussenegger/nvim-lint',
        optional = true,
        dependencies = {
            {
                'mason-org/mason.nvim',
                optional = true,
                opts = {
                    ensure_installed = { 'shellcheck' },
                },
            },
        },
        opts = {
            -- shellcheck don't support zsh
            linters_by_ft = { sh = { 'shellcheck' }, bash = { 'shellcheck' } },
        },
    },
}
