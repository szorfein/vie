local lazy_utils = require('utils.lazy')
local lang_utils = require('utils.lang')

local M = {}

M.format = function(opts, cb)
    opts = vim.tbl_deep_extend(
        'force',
        {},
        opts or {},
        lazy_utils.opts('nvim-lspconfig').default_format_opts or {},
        lazy_utils.opts('conform.nvim').default_format_opts or {}
    )
    local has_conform, conform = pcall(require, 'conform')
    -- use conform for formatting with LSP when available,
    -- since it has better format diffing
    if has_conform then
        opts.formatters = {}
        conform.format(opts, cb)
    else
        vim.lsp.buf.format(opts)
    end
end

M.formatter = function(opts)
    opts = opts or {}
    local filter = opts.filter or {}
    filter = type(filter) == 'string' and { name = filter } or filter
    ---@cast filter vim.lsp.get_clients.Filter
    ---@type LazyFormatter
    local ret = {
        name = 'LSP',
        primary = true,
        priority = 1,
        format = function(buf, format_opts, cb)
            local _opts = lang_utils.tbl_merge({}, format_opts, filter, { bufnr = buf })
            M.format(_opts, cb)
        end,
        sources = function(buf)
            local clients = vim.lsp.get_clients(lang_utils.tbl_merge({}, filter, { bufnr = buf }))
            ---@param client vim.lsp.Client
            local ret = vim.tbl_filter(function(client)
                return client:supports_method('textDocument/formatting')
                    or client:supports_method('textDocument/rangeFormatting')
            end, clients)
            ---@param client vim.lsp.Client
            return vim.tbl_map(function(client)
                return client.name
            end, ret)
        end,
    }
    return lang_utils.tbl_merge(ret, opts) --[[@as LazyFormatter]]
end

return M
