-- https://docs.astro.build/en/editor-setup/
-- A fresh Astro project (in Oct.2026) generated would use Astro_lsp/ESLint/Prettier
-- Biome support is yet experimental

return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = { ensure_installed = { 'astro', 'css', 'javascript', 'typescript' } },
    },
    -- typescript
    { import = 'lazyvim.plugins.extras.lang.typescript.vtsls' },
    -- nodejs always need json
    { import = 'lazyvim.plugins.extras.lang.json' },
    -- LSP Servers
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                astro = {},
                -- loaded with mfussenegger/nvim-lint
                eslint = {
                    enabled = false,
                },
                tsserver = {
                    enabled = false,
                },
                ts_ls = {
                    enabled = false,
                },
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
                    ensure_installed = { 'prettierd', 'eslint_d' },
                },
            },
        },
        opts = {
            formatters_by_ft = {
                ['astro'] = { 'prettierd' },
            },
        },
    },
    {
        'mfussenegger/nvim-lint',
        opts = {
            linters_by_ft = {
                astro = { 'eslint_d' },
            },
        },
    },
}
