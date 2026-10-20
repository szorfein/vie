-- enable experimental Lua module loader
vim.loader.enable()

require('configs.options')
require('configs.lazy')

-- autocmds can be loaded lazily when not opening a file
local lazy_autocmds = vim.fn.argc(-1) == 0
if not lazy_autocmds then
    require('configs.autocmds')
end

vim.api.nvim_create_autocmd('User', {
    group = vim.api.nvim_create_augroup('LazyVie', { clear = true }),
    pattern = 'VeryLazy',
    callback = function()
        if lazy_autocmds then
            require('configs.autocmds')
        end
        require('configs.commands')
    end,
})

-- not named catppuccin
vim.cmd.colorscheme('catppuccin-nvim')
