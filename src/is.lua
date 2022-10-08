
local runService = game:GetService("RunService")

local types = require(script.Parent.types)

local checks: types.is = {}

checks.server = function(_, _)
    if not runService:IsServer() then
        return "expected to be server, is client"
    end

    return true
end

checks.client = function(_, _)
    if not runService:IsClient() then
        return "expected to be client, is server"
    end

    return true
end

checks.studio = function(_, _)
    if not runService:IsStudio() then
        return "expected to be in studio"
    end

    return true
end





checks.none = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "nil" then
        return string.format("expected nil, got %s", ofType)
    end

    return true
end

checks.string = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "string" then
        return string.format("expected string, got %s", ofType)
    end

    return true
end

checks.number = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "number" then
        return string.format("expected number, got %s", ofType)
    end

    return true
end

checks.boolean = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "boolean" then
        return string.format("expected boolean, got %s", ofType)
    end

    return true
end

checks.table = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "table" then
        return string.format("expected table, got %s", ofType)
    end

    return true
end

checks.func = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "function" then
        return string.format("expected function, got %s", ofType)
    end

    return true
end

checks.thread = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "thread" then
        return string.format("expected thread, got %s", ofType)
    end

    return true
end





checks.instance = function(v1, _)
    local ofType = typeof(v1)

    if ofType ~= "Instance" then
        return string.format("expected instance, got %s", ofType)
    end

    return true
end

checks.class = function(v1, v2)
    checks.instance(v1)

    if not v1:IsA(v2) then
        local msg = "expected %s to be of class %s, got %s"
        return string.format(msg, v1.Name, v2, v1.ClassName)
    end

    return true
end





checks.equal = function(v1, v2)
    if v1 ~= v2 then
        local msg = "expected %s to equal %s"
        return string.format(msg, tostring(v1), tostring(v2))
    end

    return true
end





local nearChecks: {[string]: <T>(v1: T, v2: T) -> number | string} = {
    number = function(v1, v2)
        return math.abs(v2 - v1)
    end,

    Vector2 = function(v1, v2)
        return math.sqrt(math.pow(v1.X - v2.X, 2) + math.pow(v1.Y - v2.Y, 2))
    end,

    Vector3 = function(v1, v2)
        return (v2 - v1).Magnitude
    end,

    CFrame = function(v1, v2)
        return (v2.Position - v1.Position).Magnitude
    end,

    Instance = function(v1, v2)
        local success, result = pcall(function()
            local p1, p2 = v1.Position, v2.Position
            local posType = typeof(p1)

            if posType ~= "Vector3" then
                return string.format("expected Instance to have a Vector3 Position, got %s", posType)
            end

            return (p2 - p1).Magnitude
        end)

        if success then
            return result

        else
            return string.format("expected a Instance with a position property, got %s", v1.ClassName)
        end
    end,
}

checks.near = function(v1, v2, dis)
    dis = if dis == nil then 0.001 else dis
    checks.number(dis)

    local v1Type = typeof(v1)
    local v2Type = typeof(v2)

    if v1Type ~= v2Type then
        return string.format("expected both values to be of the same type, got %s and %s", v1Type, v2Type)
    end

    if nearChecks[v1Type] == nil then
        local availableTypes = ""

        for i, _ in nearChecks do
            availableTypes = availableTypes .. string.format("%s, ", i)
        end

        return string.format("expected to be of type %sgot %s", availableTypes, v1Type)
    end

    local distance = nearChecks[v1Type](v1, v2)

    if typeof(distance) == "string" then
        -- near check can return an error string
        return distance
    end

    if distance > dis then
        return string.format("expected to be within %s studs", dis)
    end

    return true
end

return checks