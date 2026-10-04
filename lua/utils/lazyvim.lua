local M = {}

M.install = function()
    local lazyvim_path = vim.fn.stdpath('data') .. '/lazy/LazyVim'
    if not vim.uv.fs_stat(lazyvim_path) then
        local lazyvim_repo = 'https://github.com/LazyVim/LazyVim.git'
        vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=main', lazyvim_repo, lazyvim_path })
    end
    vim.opt.rtp:prepend(lazyvim_path)
    M.setup()
end

M.setup = function()
    _G.lazyvim_docs = false

    -- required by lazyvim extras using `LazyVim.extras.wants`
    _G.LazyVim = require('lazyvim.util')

    -- LazyVim root dir detection
    vim.g.root_spec = { 'lsp', { '.git', 'lua' }, 'cwd' }

    -- Add LazyFile event
    -- Properly load file based plugins without blocking the UI
    M.setup_lazy_file()

    -- Override LazyVim lsp utils
    local lazyVimLspUtil = require('lazyvim.util.lsp')
    lazyVimLspUtil.format = require('utils.lsp').format
    lazyVimLspUtil.formatter = require('utils.lsp').formatter
end

M.root = function(...)
    return require('lazyvim.util.root').get(...)
end

M.root_git = function(...)
    return require('lazyvim.util.root').git(...)
end

M.setup_lazy_file = function(...)
    return require('lazyvim.util.plugin').lazy_file(...)
end

return M
