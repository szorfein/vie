-- https://main.cmp.saghen.dev/installation
-- in this case.
vim.g.lazyvim_blink_main = true

return {
    'saghen/blink.cmp',
    version = not vim.g.lazyvim_blink_main and '*',
    build = vim.g.lazyvim_blink_main and 'cargo build --release',
    --enabled = false,
    opts_extend = {
        'sources.completion.enabled_providers',
        'sources.compat',
        'sources.default',
    },
    dependencies = {
        'saghen/blink.lib',
        'rafamadriz/friendly-snippets',
        -- add blink.compat to dependencies
        {
            'saghen/blink.compat',
            optional = true, -- make optional so it's only enabled if any extras need it
            opts = {},
            version = not vim.g.lazyvim_blink_main and '*',
        },
    },
    event = { 'InsertEnter', 'CmdlineEnter' },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = {
            preset = 'default',
        },

        appearance = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = false,
            -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },

        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                draw = {
                    treesitter = { 'lsp' },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
            ghost_text = {
                enabled = vim.g.ai_cmp,
            },
        },

        -- experimental signature help support
        signature = {
            enabled = true,
            trigger = {
                -- buggy
                show_on_insert = false,
            },
        },

        sources = {
            -- adding any nvim-cmp sources here will enable them
            -- with blink.compat
            compat = {},
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- the rust implementation is super long to compile and very bugged...
        fuzzy = { implementation = 'lua' },

        cmdline = {
            enabled = true,
            keymap = {
                preset = 'cmdline',
                ['<Right>'] = false,
                ['<Left>'] = false,
            },
            completion = {
                list = { selection = { preselect = false } },
                menu = {
                    auto_show = function(_)
                        return vim.fn.getcmdtype() == ':'
                    end,
                },
                ghost_text = { enabled = true },
            },
        },

        keymap = {
            preset = 'enter',
            ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-J>'] = { 'select_next', 'fallback' },
            ['<C-K>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = {
                'select_next',
                'snippet_forward',
                function(cmp)
                    if vim.api.nvim_get_mode().mode == 'c' then
                        return cmp.show()
                    end
                end,
                'fallback',
            },
            ['<S-Tab>'] = {
                'select_prev',
                'snippet_backward',
                function(cmp)
                    if vim.api.nvim_get_mode().mode == 'c' then
                        return cmp.show()
                    end
                end,
                'fallback',
            },
            ['<C-y>'] = { 'select_and_accept' },
        },
    },
    config = function(_, opts)
        if opts.snippets and opts.snippets.preset == 'default' then
            opts.snippets.expand = LazyVim.cmp.expand
        end
        -- setup compat sources
        local enabled = opts.sources.default
        for _, source in ipairs(opts.sources.compat or {}) do
            opts.sources.providers[source] = vim.tbl_deep_extend(
                'force',
                { name = source, module = 'blink.compat.source' },
                opts.sources.providers[source] or {}
            )
            if type(enabled) == 'table' and not vim.tbl_contains(enabled, source) then
                table.insert(enabled, source)
            end
        end

        -- Unset custom prop to pass blink.cmp validation
        opts.sources.compat = nil

        -- check if we need to override symbol kinds
        for _, provider in pairs(opts.sources.providers or {}) do
            ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
            if provider.kind then
                local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
                local kind_idx = #CompletionItemKind + 1

                CompletionItemKind[kind_idx] = provider.kind
                ---@diagnostic disable-next-line: no-unknown
                CompletionItemKind[provider.kind] = kind_idx

                ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
                local transform_items = provider.transform_items
                ---@param ctx blink.cmp.Context
                ---@param items blink.cmp.CompletionItem[]
                provider.transform_items = function(ctx, items)
                    items = transform_items and transform_items(ctx, items) or items
                    for _, item in ipairs(items) do
                        item.kind = kind_idx or item.kind
                        item.kind_icon = LazyVim.config.icons.kinds[item.kind_name] or item.kind_icon or nil
                    end
                    return items
                end

                -- Unset custom prop to pass blink.cmp validation
                provider.kind = nil
            end
        end

        require('blink.cmp').setup(opts)
    end,
}
