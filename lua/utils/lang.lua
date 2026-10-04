local M = {}

M.list_merge = function(...)
    local lists = {}
    for _, list in ipairs({ ... }) do
        vim.list_extend(lists, list)
    end
    return lists
end

M.remove_str_from_list = function(list, str)
    for i, value in ipairs(list) do
        if value == str then
            table.remove(list, i)
        end
    end
end

M.tbl_merge = function(...)
    return require('lazy.util').merge(...)
end

return M
