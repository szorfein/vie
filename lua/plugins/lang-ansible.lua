if vim.fn.executable('ansible') == 0 then
    return {}
end

return {
    {
        import = 'lazyvim.plugins.extras.lang.ansible',
    },
}
