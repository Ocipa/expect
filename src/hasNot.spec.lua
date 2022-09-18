

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
                    module(instance).hasNot.property(v)
                end).to.throw()
            end
        end)

        it("invalid property", function()
            for _, v in invalidProperties do
                expect(function()
                    module(instance).hasNot.property(v)
                end).never.to.throw()
            end
        end)
    end)

    describe("properties", function()
        it("valid properties", function()
            expect(function()
                module(instance).hasNot.properties(validProperties)
            end).to.throw()
        end)

        it("invalid properties", function()
            expect(function()
                module(instance).hasNot.properties(invalidProperties)
            end).never.to.throw()
        end)
    end)

    describe("attribute", function()
        it("valid attribute", function()
            for _, v in validAttributes do
                expect(function()
                    module(instance).hasNot.attribute(v)
                end).to.throw()
            end
        end)

        it("invalid attribute", function()
            for _, v in invalidAttributes do
                expect(function()
                    module(instance).hasNot.attribute(v)
                end).never.to.throw()
            end
        end)
    end)

    describe("attributes", function()
        it("valid attributes", function()
            expect(function()
                module(instance).hasNot.attributes(validAttributes)
            end).to.throw()
        end)

        it("invalid attributes", function()
            expect(function()
                module(instance).hasNot.attributes(invalidAttributes)
            end).never.to.throw()
        end)
    end)

    describe("key", function()
        it("valid key", function()
            for _, v in validKeys do
                expect(function()
                    module(tbl).hasNot.key(v)
                end).to.throw()
            end
        end)

        it("invalid key", function()
            for _, v in invalidKeys do
                expect(function()
                    module(tbl).hasNot.key(v)
                end).never.to.throw()
            end
        end)
    end)

    describe("keys", function()
        it("valid keys", function()
            expect(function()
                module(tbl).hasNot.keys(validKeys)
            end).to.throw()
        end)

        it("invalid keys", function()
            expect(function()
                module(tbl).hasNot.keys(invalidKeys)
            end).never.to.throw()
        end)
    end)


    describe("value", function()
        it("valid value", function()
            for _, v in validValues do
                expect(function()
                    module(tbl).hasNot.value(v)
                end).to.throw()
            end
        end)

        it("invalid value", function()
            for _, v in invalidValues do
                expect(function()
                    module(tbl).hasNot.value(v)
                end).never.to.throw()
            end
        end)
    end)

    describe("values", function()
        it("valid values", function()
            expect(function()
                module(tbl).hasNot.values(validValues)
            end).to.throw()
        end)

        it("invalid values", function()
            expect(function()
                module(tbl).hasNot.values(invalidValues)
            end).never.to.throw()
        end)
    end)
end

