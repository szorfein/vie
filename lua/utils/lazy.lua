local vim = vim
local M = {}

-- https://lazy.folke.io/installation
M.install = function()
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
        local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
                { out, 'WarningMsg' },
                { '\nPress any key to exit...' },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)
end

M.find_local_nolazy_spec = function()
    local path = vim.uv.cwd()
    local LOCAL_SPEC = '.nolazy.lua'
    while path and path ~= '' do
        local file = path .. '/' .. LOCAL_SPEC
        if vim.fn.filereadable(file) == 1 then
            return {
                name = vim.fn.fnamemodify(file, ':~:.'),
                import = function()
                    local data = vim.secure.read(file)
                    if data then
                        return loadstring(data, LOCAL_SPEC)()
                    end
                    return {}
                end,
            }
        end
        local p = vim.fn.fnamemodify(path, ':h')
        if p == path then
            break
        end
        path = p
    end
end

M.on_load = function(...)
    require('lazyvim.util').on_load(...)
end

M.is_loaded = function(...)
    return require('lazyvim.util').is_loaded(...)
end

M.opts = function(...)
    return require('lazyvim.util').opts(...)
end

M.has = function(...)
    return require('lazyvim.util').has(...)
end

M.on_very_lazy = function(...)
    require('lazyvim.util').on_very_lazy(...)
end

return M
