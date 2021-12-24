LEEDS.Table = {};
local Table = LEEDS.Table;
function Table.empty(table)
    for _ in pairs(table) do
        return false
    end
    return true
end

function Table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end