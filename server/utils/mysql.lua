MySQL = {
    Async = {},
    Sync = {},
}

local function safeParameters(params)
    if nil == params then
        return {}
    end

    assert(type(params) == "table", "A table is expected")

    if next(params) == nil then
        return {}
    end

    return params
end

function MySQL.Sync.execute(query, params)
    assert(type(query) == "string" or type(query) == "number", "The SQL Query must be a string")

    local res = nil
    local finishedQuery = false
    exports['leeds_911']:mysql_execute(query, safeParameters(params), function (results)
        res = results
        finishedQuery = true
    end)
    repeat Citizen.Wait(0) until finishedQuery == true
    return res
end

function MySQL.Async.execute(query, params, callbak)
    assert(type(query) == "string" or type(query) == "number", "The SQL Query must be a string")

    exports['leeds_911']:mysql_execute(query, safeParameters(params), callbak)
end
