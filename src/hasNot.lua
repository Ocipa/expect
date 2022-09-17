
local types = require(script.Parent.types)
local is = require(script.Parent.is)
local isnt = require(script.Parent.isnt)


local checks: types.has
checks = {
    property = function(instance, propertyName)
        is.instance(instance)
        is.string(propertyName)

        local success, _ = pcall(function()
            return instance[propertyName]
        end)

        if success == true then
            local class = instance.ClassName
            local msg = "[ERROR]: expected %s, to not have '%s' property"

            error(string.format(msg, class, propertyName), 3)
        end

        return true
    end,

    properties = function(instance, propertyNames)
        is.instance(instance)
        is.table(propertyNames)

        for _, propertyName in propertyNames do
            checks.property(instance, propertyName)
        end

        return true
    end,

    attribute = function(instance, attributeName)
        is.instance(instance)
        is.string(attributeName)

        if instance:GetAttribute(attributeName) ~= nil then
            local class = instance.ClassName
            local msg = "[ERROR]: expected %s, to not have '%s' attribute"

            error(string.format(msg, class, attributeName), 3)
        end

        return true
    end,

    attributes = function(instance, attributeNames)
        is.instance(instance)
        is.table(attributeNames)

        for _, attributeName in attributeNames do
            checks.attribute(instance, attributeName)
        end

        return true
    end,

    key = function(tbl, key)
        is.table(tbl)
        isnt.none(key)

        if tbl[key] ~= nil then
            error(string.format("[ERROR]: expected table to not kave '%s' key", key), 3)
        end

        return true
    end,

    keys = function(tbl, keys)
        is.table(tbl)
        is.table(keys)

        for _, key in keys do
            checks.key(tbl, key)
        end

        return true
    end,

    value = function(tbl, value)
        is.table(tbl)
        isnt.none(value)

        for _, v in tbl do
            if v == value then
                error(string.format("[ERROR]: expected table to not kave '%s' value", tostring(value)), 3)
            end
        end

        return true
    end,

    values = function(tbl, values)
        is.table(tbl)
        is.table(values)

        for _, value in values do
            checks.value(tbl, value)
        end

        return true
    end,
}

return checks