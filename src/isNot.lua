
local runService = game:GetService("RunService")

local types = require(script.Parent.types)
local is = require(script.Parent.is)

local checks: types.is
checks = {
    server = function(_, _)
        if runService:IsServer() then
            return "expected to not be server, is server"
        end

        return true
    end,

    client = function(_, _)
        if runService:IsClient() then
            return "expected to not be client, is client"
        end

        return true
    end,

    studio = function(_, _)
        if runService:IsStudio() then
            return "expected to not be in studio"
        end

        return true
    end,





    none = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "nil" then
            return "expected not nil, got nil"
        end

        return true
    end,

    string = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "string" then
            return "expected not string, got string"
        end

        return true
    end,

    number = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "number" then
            return "expected not number, got number"
        end

        return true
    end,

    boolean = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "boolean" then
            return "expected not boolean, got boolean"
        end

        return true
    end,

    table = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "table" then
            return "expected not table, got table"
        end

        return true
    end,

    func = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "function" then
            return "expected not function, got function"
        end

        return true
    end,

    thread = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "thread" then
            return "expected not thread, got thread"
        end

        return true
    end,





    instance = function(v1, _)
        local ofType = typeof(v1)

        if ofType == "Instance" then
            return "expected not instance, got instance"
        end

        return true
    end,

    class = function(v1, v2)
        is.instance(v1)

        if v1:IsA(v2) then
            return string.format("expected not %s, got %s", v2, v2)
        end

        return true
    end,





    equal = function(v1, v2)
        if v1 == v2 then
            local msg = "expected %s to not equal %s"
            return string.format(msg, tostring(v1), tostring(v2))
        end

        return true
    end
}

return checks