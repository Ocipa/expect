

local instance = _G.instance

local validProperties = _G.validProperties
local invalidProperties = _G.invalidProperties

local validAttributes = _G.validAttributes
local invalidAttributes = _G.invalidAttributes

local tbl = _G.tbl

local validKeys = _G.validKeys
local invalidKeys = _G.invalidKeys

local validValues = _G.validValues
local invalidValues = _G.invalidValues

return function()
    local module = require(script.Parent)

    describe("property", function()
        it("valid property", function()
            for _, v in validProperties do
                expect(function()
                    module(instance).has.property(v)
                end).never.to.throw()
            end
        end)

        it("invalid property", function()
            for _, v in invalidProperties do
                expect(function()
                    module(instance).has.property(v)
                end).to.throw()
            end
        end)
    end)

    describe("properties", function()
        it("valid properties", function()
            expect(function()
                module(instance).has.properties(validProperties)
            end).never.to.throw()
        end)

        it("invalid properties", function()
            expect(function()
                module(instance).has.properties(invalidProperties)
            end).to.throw()
        end)
    end)

    describe("attribute", function()
        it("valid attribute", function()
            for _, v in validAttributes do
                expect(function()
                    module(instance).has.attribute(v)
                end).never.to.throw()
            end
        end)

        it("invalid attribute", function()
            for _, v in invalidAttributes do
                expect(function()
                    module(instance).has.attribute(v)
                end).to.throw()
            end
        end)
    end)

    describe("attributes", function()
        it("valid attributes", function()
            expect(function()
                module(instance).has.attributes(validAttributes)
            end).never.to.throw()
        end)

        it("invalid attributes", function()
            expect(function()
                module(instance).has.attributes(invalidAttributes)
            end).to.throw()
        end)
    end)

    describe("key", function()
        it("valid key", function()
            for _, v in validKeys do
                expect(function()
                    module(tbl).has.key(v)
                end).never.to.throw()
            end
        end)

        it("invalid key", function()
            for _, v in invalidKeys do
                expect(function()
                    module(tbl).has.key(v)
                end).to.throw()
            end
        end)
    end)

    describe("keys", function()
        it("valid keys", function()
            expect(function()
                module(tbl).has.keys(validKeys)
            end).never.to.throw()
        end)

        it("invalid keys", function()
            expect(function()
                module(tbl).has.keys(invalidKeys)
            end).to.throw()
        end)
    end)


    describe("value", function()
        it("valid value", function()
            for _, v in validValues do
                expect(function()
                    module(tbl).has.value(v)
                end).never.to.throw()
            end
        end)

        it("invalid value", function()
            for _, v in invalidValues do
                expect(function()
                    module(tbl).has.value(v)
                end).to.throw()
            end
        end)
    end)

    describe("values", function()
        it("valid values", function()
            expect(function()
                module(tbl).has.values(validValues)
            end).never.to.throw()
        end)

        it("invalid values", function()
            expect(function()
                module(tbl).has.values(invalidValues)
            end).to.throw()
        end)
    end)
end

