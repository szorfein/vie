return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.opt.timeout = true
    end,
    opts = {
        preset = 'modern',
        notify = true,
        -- https://github.com/folke/which-key.nvim/issues/824
        -- triggers = {
        --   { "<auto>", mode = "nsot" },
        -- },
    },
    keys = {
        {
            '<C-h>b',
            function()
                --require('which-key').show({ global = false })
                require('which-key').show()
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
}
