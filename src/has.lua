
local types = require(script.Parent.types)
local is = require(script.Parent.is)
local isNot = require(script.Parent.isNot)


local checks: types.has
checks = {
    property = function(instance, propertyName)
        local result = is.instance(instance)
        if result ~= true then return result end

        local result = is.string(propertyName)
        if result ~= true then return result end

        local success, _ = pcall(function()
            return instance[propertyName]
        end)

        if success == false then
            local msg = "expected %s, to have '%s' property"

            return string.format(msg, instance.ClassName, propertyName)
        end

        return true
    end,

    properties = function(instance, propertyNames)
        local result = is.table(propertyNames)
        if result ~= true then return result end

        for _, propertyName in propertyNames do
            local result = checks.property(instance, propertyName)
            if result ~= true then return result end
        end

        return true
    end,

    attribute = function(instance, attributeName)
        local result = is.instance(instance)
        if result ~= true then return result end

        local result = is.string(attributeName)
        if result ~= true then return result end

        if instance:GetAttribute(attributeName) == nil then
            local msg = "expected %s, to have '%s' attribute"

            return string.format(msg, instance.ClassName, attributeName)
        end

        return true
    end,

    attributes = function(instance, attributeNames)
        local result = is.table(attributeNames)
        if result ~= true then return result end

        for _, attributeName in attributeNames do
            local result = checks.attribute(instance, attributeName)
            if result ~= true then return result end
        end

        return true
    end,

    key = function(tbl, key)
        local result = is.table(tbl)
        if result ~= true then return result end

        local result = isNot.none(key)
        if result ~= true then return result end

        if tbl[key] == nil then
            return string.format("expected table to kave '%s' key", key)
        end

        return true
    end,

    keys = function(tbl, keys)
        local result = is.table(keys)
        if result ~= true then return result end

        for _, key in keys do
            local result = checks.key(tbl, key)
            if result ~= true then return result end
        end

        return true
    end,

    value = function(tbl, value)
        local result = is.table(tbl)
        if result ~= true then return result end

        local result = isNot.none(value)
        if result ~= true then return result end

        for _, v in tbl do
            if v == value then
                return true
            end
        end

        local msg = "expected table to kave '%s' value"
        return string.format(msg, tostring(value))
    end,

    values = function(tbl, values)
        local result = is.table(values)
        if result ~= true then return result end

        for _, value in values do
            local result = checks.value(tbl, value)
            if result ~= true then return result end
        end

        return true
    end,
}

return checks