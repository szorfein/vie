local vim = vim
local lazy_utils = require('utils.lazy')
local icon = require('utils.icon')

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'mason-org/mason.nvim',
        'mason-org/mason-lspconfig.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    --event = { 'LazyFile', 'VeryLazy' },
    opts = {
        servers = {
            tailwindcss = {
                flags = {
                    debounce_text_change = 250,
                },
            },
        },
    },
    config = vim.schedule_wrap(function(_, opts)
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

        -- setup folds
        Snacks.util.lsp.on({ method = 'textDocument/foldingRange' }, function()
            vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
        end)

        -- Global LSP defaults (replaces lspconfig.util.default_config merge)
        if opts.servers['*'] then
            vim.lsp.config('*', opts.servers['*'])
        else
            vim.lsp.config('*', {
                capabilities = vim.lsp.protocol.make_client_capabilities(),
                flags = {
                    debounce_text_changes = 200,
                    allow_incremental_sync = true,
                },
            })
        end

        --astro = require('lsp.astro')(on_attach),
        --biome = require('lsp.biome')(on_attach),
        --codebook = require('lsp.codebook')(on_attach),
        --cssls = require('lsp.cssls')(on_attach),
        --harper_ls = require('lsp.harper_ls')(on_attach),
        --ts_ls = require('lsp.tsls')(on_attach),
        --standardrb = require('lsp.standardrb')(on_attach),

        -- servers with custom config
        --require('lsp.bashls')

        -- simple server with default config
        vim.lsp.enable({
            'oxlint',
            'tailwindcss',
        })

        -- setup opts.servers and opts.setup
        -- code from https://github.com/wochap/nvim/blob/main/lua/custom/plugins/lsp.lua
        local have_mason = lazy_utils.has('mason-lspconfig.nvim')
        local mason_all = have_mason
                and vim.tbl_keys(require('mason-lspconfig.mappings').get_mason_map().lspconfig_to_package)
            or {} --[[ @as string[] ]]
        local mason_exclude = {} ---@type string[]
        ---@return boolean? exclude automatic setup
        local function configure(server)
            if server == '*' then
                return false
            end
            local sopts = opts.servers[server]
            sopts = sopts == true and {} or (not sopts) and { enabled = false } or sopts
            if sopts.enabled == false then
                mason_exclude[#mason_exclude + 1] = server
                return
            end
            -- NOTE: condition isn't part of LazyVim
            if sopts.condition and sopts.condition() == false then
                mason_exclude[#mason_exclude + 1] = server
                return
            end
            local use_mason = sopts.mason ~= false and vim.tbl_contains(mason_all, server)
            local setup = opts.setup[server] or opts.setup['*']
            if setup and setup(server, sopts) then
                mason_exclude[#mason_exclude + 1] = server
            else
                vim.lsp.config(server, sopts) -- configure the server
                if not use_mason then
                    vim.lsp.enable(server)
                end
            end
            return use_mason
        end

        local install = vim.tbl_filter(configure, vim.tbl_keys(opts.servers))

        -- check mason
        local mason_ok, mason = pcall(require, 'mason')
        local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')

        -- lua_ls is available on Arch, Gentoo and Void, don't need mason
        if mason and mason_ok and mason_lspconfig_ok then
            mason_lspconfig.setup({
                --ensure_installed = {
                --  'biome',
                --  'cssls',
                --  'oxlint',
                --  'tailwindcss',
                --},
                --automatic_enable = true,
                ensure_installed = vim.list_extend(
                    install,
                    LazyVim.opts('mason-lspconfig.nvim').ensure_installed or {}
                ),
                automatic_enable = { exclude = mason_exclude },
            })
        end
    end),
}
