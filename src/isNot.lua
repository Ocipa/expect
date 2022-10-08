
local runService = game:GetService("RunService")

local types = require(script.Parent.types)
local is = require(script.Parent.is)

local checks: types.is = {}

checks.server = function(_, _)
    if runService:IsServer() then
        return "expected to not be server, is server"
    end

    return true
end

checks.client = function(_, _)
    if runService:IsClient() then
        return "expected to not be client, is client"
    end

    return true
end

checks.studio = function(_, _)
    if runService:IsStudio() then
        return "expected to not be in studio"
    end

    return true
end





checks.none = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "nil" then
        return "expected not nil, got nil"
    end

    return true
end

checks.string = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "string" then
        return "expected not string, got string"
    end

    return true
end

checks.number = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "number" then
        return "expected not number, got number"
    end

    return true
end

checks.boolean = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "boolean" then
        return "expected not boolean, got boolean"
    end

    return true
end

checks.table = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "table" then
        return "expected not table, got table"
    end

    return true
end

checks.func = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "function" then
        return "expected not function, got function"
    end

    return true
end

checks.thread = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "thread" then
        return "expected not thread, got thread"
    end

    return true
end





checks.instance = function(v1, _)
    local ofType = typeof(v1)

    if ofType == "Instance" then
        return "expected not instance, got instance"
    end

    return true
end

checks.class = function(v1, v2)
    is.instance(v1)

    if v1:IsA(v2) then
        return string.format("expected not %s, got %s", v2, v2)
    end

    return true
end





checks.equal = function(v1, v2)
    if v1 == v2 then
        local msg = "expected %s to not equal %s"
        return string.format(msg, tostring(v1), tostring(v2))
    end

    return true
end





checks.near = function(v1, v2, dis)
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

    if distance <= dis then
        return string.format("expected to not be within %s studs", dis)
    end

    return true
end

return checks