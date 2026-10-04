-- A fresh vue.js project (Oct.2026):
-- use oxl instead of prettier
-- eslint

return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = { ensure_installed = { 'vue', 'css', 'html' } },
    },
    -- oxl
    { import = 'lazyvim.plugins.extras.lang.typescript.oxc' },
    -- Add LSP servers
    {
        'neovim/nvim-lspconfig',
        opts = {
            servers = {
                vue_ls = {},
                vtsls = {},
            },
        },
    },
    { -- without this, vue_ls check the presence of vtsls without success
        'neovim/nvim-lspconfig',
        opts = function(_, opts)
            table.insert(opts.servers.vtsls.filetypes, 'vue')
            require('lazyvim.util').extend(opts.servers.vtsls, 'settings.vtsls.tsserver.globalPlugins', {
                {
                    name = '@vue/typescript-plugin',
                    location = require('lazyvim.util').get_pkg_path(
                        'vue-language-server',
                        '/node_modules/@vue/language-server'
                    ),
                    languages = { 'vue' },
                    configNamespace = 'typescript',
                    enableForWorkspaceTypeScriptVersions = true,
                },
            })
        end,
    },
    {
        'mfussenegger/nvim-lint',
        opts = {
            linters_by_ft = {
                vue = { 'eslint_d' },
            },
        },
    },
}
