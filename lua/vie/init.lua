-- enable experimental Lua module loader
vim.loader.enable()

require('configs.options')
require('configs.lazy')

vim.api.nvim_create_autocmd('User', {
    group = vim.api.nvim_create_augroup('vie_core', { clear = true }),
    pattern = 'VeryLazy',
    callback = function()
        require('configs.autocmds')
        require('configs.commands')
    end,
})

-- not named catppuccin
vim.cmd.colorscheme('catppuccin-nvim')
