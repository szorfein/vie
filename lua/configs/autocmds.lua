local vim = vim
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local augroup = function(name)
    return vim.api.nvim_create_augroup('custom_' .. name, { clear = true })
end

-- Remove whitespace on save
autocmd('BufWritePre', {
    pattern = '',
    command = ':%s/\\s\\+$//e',
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o',
})

-- Create directory when not exist on save
autocmd('BufWritePre', {
    callback = function(args)
        local file = args.match
        if file:match('^%w+:[\\/][\\/]') then
            return
        end
        vim.fn.mkdir(vim.fs.abspath(vim.fs.dirname(vim.uv.fs_realpath(file) or file)), 'p')
        require('conform').format({ async = true }) -- not related but it format fine :)
    end,
})

-- Resize splits if window got resized
autocmd('VimResized', {
    group = augroup('resize_splits'),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd('tabdo wincmd =')
        vim.cmd('tabnext ' .. current_tab)
    end,
})

-- Wrap text filetypes
autocmd('FileType', {
    group = augroup('wrap_text'),
    pattern = { 'gitcommit', 'gitrebase', 'markdown', 'tex', 'bib', 'typst', '' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

-- Disable Treesitter on Massive Files: on files > 100,000 lines
autocmd('BufEnter', {
    pattern = '*',
    callback = function()
        local lines = vim.api.nvim_buf_line_count(0)
        if lines > 100000 then
            vim.cmd('TSTeardown') -- Disable treesitter for this buffer
            vim.opt_local.syntax = 'OFF' -- Fallback to basic regex syntax or none
            vim.opt_local.cursorline = false
            vim.opt_local.matchparen = false
        end
    end,
})

-- Large File Optimizations, > 2MB or > 50,000 lines
autocmd('BufReadPre', {
    pattern = '*',
    callback = function()
        local file_size = vim.fn.getfsize(vim.fn.expand('<afile>'))
        -- If file is larger than 2MB (2000000 bytes)
        if file_size > 2000000 then
            vim.opt_local.syntax = 'OFF' -- Disable syntax highlighting
            vim.opt_local.foldmethod = 'manual' -- Disable expensive auto-folding
            vim.opt_local.cursorline = false -- Disable cursor line highlighting
            vim.opt_local.cursorcolumn = false
            vim.opt_local.matchparen = false -- Disable bracket matching
            vim.b.undofile = false -- Disable undo file for this buffer
        end
    end,
})
