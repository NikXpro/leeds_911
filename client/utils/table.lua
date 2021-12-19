LEEDS.Table = {};
local Table = LEEDS.Table;
function Table:empty()
    for _ in pairs(self) do
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