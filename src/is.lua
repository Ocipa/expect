
local runService = game:GetService("RunService")

local types = require(script.Parent.types)

local checks: types.is
checks = {
    server = function(_, _)
        if not runService:IsServer() then
            return "expected to be server, is client"
        end

        return true
    end,

    client = function(_, _)
        if not runService:IsClient() then
            return "expected to be client, is server"
        end

        return true
    end,

    studio = function(_, _)
        if not runService:IsStudio() then
            return "expected to be in studio"
        end

        return true
    end,





    none = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "nil" then
            return string.format("expected nil, got %s", ofType)
        end

        return true
    end,

    string = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "string" then
            return string.format("expected string, got %s", ofType)
        end

        return true
    end,

    number = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "number" then
            return string.format("expected number, got %s", ofType)
        end

        return true
    end,

    boolean = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "boolean" then
            return string.format("expected boolean, got %s", ofType)
        end

        return true
    end,

    table = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "table" then
            return string.format("expected table, got %s", ofType)
        end

        return true
    end,

    func = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "function" then
            return string.format("expected function, got %s", ofType)
        end

        return true
    end,

    thread = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "thread" then
            return string.format("expected thread, got %s", ofType)
        end

        return true
    end,





    instance = function(v1, _)
        local ofType = typeof(v1)

        if ofType ~= "Instance" then
            return string.format("expected instance, got %s", ofType)
        end

        return true
    end,

    class = function(v1, v2)
        checks.instance(v1)

        if not v1:IsA(v2) then
            local msg = "expected %s to be of class %s, got %s"
            return string.format(msg, v1.Name, v2, v1.ClassName)
        end

        return true
    end,





    equal = function(v1, v2)
        if v1 ~= v2 then
            local msg = "expected %s to equal %s"
            return string.format(msg, tostring(v1), tostring(v2))
        end

        return true
    end,





    near = function(v1, v2, dis)
        dis = if dis == nil then 0.001 else dis
        checks.number(dis)

        local v1Type = typeof(v1)
        local v2Type = typeof(v2)

        if v1Type ~= v2Type then
            return string.format("expected both values to be of the same type, got %s and %s", v1Type, v2Type)
        end

        local distance: number

        if v1Type == "number" then
            distance = math.abs(v2 - v1)

        elseif v1Type == "Vector2" then
            distance = math.sqrt(math.pow(v1.X - v2.X, 2) + math.pow(v1.Y - v2.Y, 2))

        elseif v1Type == "Vector3" then
            distance = (v2 - v1).Magnitude

        elseif v1Type == "CFrame" then
            distance = (v2.Position - v1.Position).Magnitude
        end

        if not distance then
            return string.format("expected to be of type number, Vector2, Vector3 or CFrame, got %s", v1Type)
        end

        if distance > dis then
            return string.format("expected to be within %s studs", dis)
        end

        return true
    end
}

return checks