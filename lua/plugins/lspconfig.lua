local vim = vim
local icon = require('utils.icon')

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'mason-org/mason-lspconfig.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        -- 'trace', 'debug', 'info', 'warn', 'error'
        vim.lsp.log.set_level('error')

        -- keybind shortcuts
        -- Global on_attach via autocmd (replaces per-server on_attach)
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local function buf_set_option(o, v)
                    vim.api.nvim_set_option_value(o, v, { buf = args.buf })
                end
                local cap = client.server_capabilities
                buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                if cap.definitionProvider then
                    vim.keymap.set(
                        'n',
                        '<C-h>dp',
                        vim.lsp.buf.definition,
                        { desc = 'definition provider', buffer = args.buf }
                    )
                end
            end,
        })

        -- config diagnostic
        -- https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts
        vim.diagnostic.config({
            virtual_text = {
                -- source = "always",  -- Or "if_many"
                prefix = '●', -- Could be '■', '▎', 'x'
            },
            severity_sort = true,
            float = {
                source = 'always', -- Or "if_many"
                border = 'rounded',
                --border = 'shadow',
                focused = false,
                focus = false,
                style = 'minimal',
                header = '',
                prefix = '',
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = icon.get('DiagnosticError'),
                    [vim.diagnostic.severity.HINT] = icon.get('DiagnosticHint'),
                    [vim.diagnostic.severity.WARN] = icon.get('DiagnosticWarn'),
                    [vim.diagnostic.severity.INFO] = icon.get('DiagnosticInfo'),
                },
            },
        })

        local border = { border = 'shadow' }
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.buf.hover(border)
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.buf.hover(border)

        -- Global LSP defaults (replaces lspconfig.util.default_config merge)
        vim.lsp.config('*', {
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            flags = {
                debounce_text_changes = 200,
                allow_incremental_sync = true,
            },
        })

        --astro = require('lsp.astro')(on_attach),
        --biome = require('lsp.biome')(on_attach),
        --codebook = require('lsp.codebook')(on_attach),
        --cssls = require('lsp.cssls')(on_attach),
        --harper_ls = require('lsp.harper_ls')(on_attach),
        --ts_ls = require('lsp.tsls')(on_attach),
        --standardrb = require('lsp.standardrb')(on_attach),

        -- servers with custom config
        require('lsp.bashls')

        -- simple server with default config
        vim.lsp.enable({
            'lua_ls',
            'rubocop',
            'tailwindcss',
        })

        -- check mason
        local mason_ok, mason = pcall(require, 'mason')
        local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')

        -- lua_ls is available on Arch, Gentoo and Void, don't need mason
        if mason_ok and mason_lspconfig_ok then
            mason.setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    'bashls',
                    'biome',
                    'cssls',
                    'rubocop',
                    'tailwindcss',
                },
                automatic_enable = true,
            })
        end
    end,
}
