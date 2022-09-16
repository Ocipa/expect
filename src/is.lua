
local runService = game:GetService("RunService")

local checks
checks = {
    server = function(_, _)
        if not runService:IsServer() then
            error("[ERROR]: expected to be server, is client", 3)
        end

        return true
    end,

    client = function(_, _)
        if not runService:IsClient() then
            error("[ERROR]: expected to be client, is server", 3)
        end

        return true
    end,





    none = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "nil" then
            error(string.format("[ERROR]: expected nil, got %s", ofType), 3)
        end

        return true
    end,

    string = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "string" then
            error(string.format("[ERROR]: expected string, got %s", ofType), 3)
        end

        return true
    end,

    number = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "number" then
            error(string.format("[ERROR]: expected number, got %s", ofType), 3)
        end

        return true
    end,

    boolean = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "boolean" then
            error(string.format("[ERROR]: expected boolean, got %s", ofType), 3)
        end

        return true
    end,

    table = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "table" then
            error(string.format("[ERROR]: expected table, got %s", ofType), 3)
        end

        return true
    end,

    func = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "function" then
            error(string.format("[ERROR]: expected function, got %s", ofType), 3)
        end

        return true
    end,

    thread = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "thread" then
            error(string.format("[ERROR]: expected thread, got %s", ofType), 3)
        end

        return true
    end,





    instance = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "Instance" then
            error(string.format("[ERROR]: expected instance, got %s", ofType), 3)
        end

        return true
    end,

    class = function(v1, v2)
        checks.instance(v1)

        if not v1:IsA(v2) then
            error(string.format("[ERROR]: expected %s to be of class %s, got %s", v1.Name, v2, v1.ClassName), 3)
        end

        return true
    end,
}

return checks