
local types = require(script.types)


local value1: any = nil

local modifierKeys = {
    is = require(script.is),
    isNot = require(script.isNot),

    has = require(script.has),
    hasNot = require(script.hasNot)
}

for i, v in modifierKeys do
    local assertKeys = {}

    for i2, v2 in v do
        assertKeys[i2] = function(...)
            local val1 = value1
            value1 = nil

            local result = v2(val1, ...)

            if result ~= true then
                error("[ERROR]: "..result, 2)
            end

            return result
        end
    end

    modifierKeys[i] = assertKeys
end


return function(value: any): types.expect
    value1 = value

    return modifierKeys
end
