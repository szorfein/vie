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
        vim.fn.mkdir(vim.fn.fnamemodify(vim.uv.fs_realpath(file) or file, ':p:h'), 'p')
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
