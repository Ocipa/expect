
local runService = game:GetService("RunService")

local types = require(script.Parent.types)
local is = require(script.Parent.is)

local checks: types.is
checks = {
    server = function(_, _)
        if runService:IsServer() then
            error("[ERROR]: expected to not be server, is server", 3)
        end

        return true
    end,

    client = function(_, _)
        if runService:IsClient() then
            error("[ERROR]: expected to not be client, is client", 3)
        end

        return true
    end,





    none = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "nil" then
            error("[ERROR]: expected not nil, got nil", 3)
        end

        return true
    end,

    string = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "string" then
            error("[ERROR]: expected not string, got string", 3)
        end

        return true
    end,

    number = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "number" then
            error("[ERROR]: expected not number, got number", 3)
        end

        return true
    end,

    boolean = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "boolean" then
            error("[ERROR]: expected not boolean, got boolean", 3)
        end

        return true
    end,

    table = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "table" then
            error("[ERROR]: expected not table, got table", 3)
        end

        return true
    end,

    func = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "function" then
            error("[ERROR]: expected not function, got function", 3)
        end

        return true
    end,

    thread = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "thread" then
            error("[ERROR]: expected not thread, got thread", 3)
        end

        return true
    end,





    instance = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "Instance" then
            error("[ERROR]: expected not instance, got instance", 3)
        end

        return true
    end,

    class = function(v1, v2)
        is.instance(v1)

        if v1:IsA(v2) then
            error(string.format("[ERROR]: expected not %s, got %s", v2, v2), 3)
        end

        return true
    end,
}

return checks