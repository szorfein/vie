local lang_utils = require('utils.lang')

return {
    {
        import = 'lazyvim.plugins.extras.lang.go',
    },
    {
        'neovim/nvim-lspconfig',
        --optional = true,
        opts = {
            servers = {
                gopls = {},
            },
        },
    },
    {
        'mason-org/mason.nvim',
        --optional = true,
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            lang_utils.remove_str_from_list(opts.ensure_installed, 'gomodifytags')
            lang_utils.remove_str_from_list(opts.ensure_installed, 'impl')
        end,
    },
}
