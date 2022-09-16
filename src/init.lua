
local types = require(script.types)

local module = {}

function module:__call(value: any): types.expect
    local v1 = module._value
    local v2 = value

    local modifierKey = module._modifierKey
    local lastKey = module._lastKey

    if module._modifierKey and module._lastKey then
        module._modifierKey = nil
        module._lastKey = nil
        module._value = nil

        return require(script:FindFirstChild(modifierKey))[lastKey](v1, v2)

    else
        module._value = value
    end

    return self
end

function module:__index(key)
    module._modifierKey = module._lastKey
    module._lastKey = key

    return self
end

return setmetatable({} :: types.expect, module)


