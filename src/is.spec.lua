
local runService = game:GetService("RunService")

local strings = _G.strings
local numbers = _G.numbers
local booleans = _G.booleans
local tables = _G.tables
local functions = _G.functions
local threads = _G.threads


return function()
    local module = require(script.Parent)

    describe("environment type", function()
        it("is server", function()
            if runService:IsServer() then
                expect(module().is.server).never.to.throw()

            else
                expect(module().is.server).to.throw()
            end
        end)

        it("is client", function()
            if runService:IsClient() then
                expect(module().is.client).never.to.throw()

            else
                expect(module().is.client).to.throw()
            end
        end)

        it("is studio", function()
            if runService:IsStudio() then
                expect(module().is.studio).never.to.throw()

            else
                expect(module().is.studio).to.throw()
            end
        end)
    end)

    describe("none", function()
        it("valid none", function()
            expect(module().is.none).never.to.throw()
        end)

        it("invalid none", function()
            for _, v in {strings, numbers, booleans, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).is.none).to.throw()
                end
            end
        end)
    end)

    describe("strings", function()
        it("valid strings", function()
            for _, v in strings do
                expect(module(v).is.string).never.to.throw()
            end
        end)

        it("invalid strings", function()
            for _, v in {numbers, booleans, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).is.string).to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().is.strings).to.throw()
        end)
    end)

    describe("numbers", function()
        it("valid numbers", function()
            for _, v in numbers do
                expect(module(v).is.number).never.to.throw()
            end
        end)

        it("invalid numbers", function()
            for _, v in {strings, booleans, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).is.number).to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().is.numbers).to.throw()
        end)
    end)

    describe("booleans", function()
        it("valid booleans", function()
            for _, v in booleans do
                expect(module(v).is.boolean).never.to.throw()
            end
        end)

        it("invalid booleans", function()
            for _, v in {strings, numbers, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).is.boolean).to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().is.boolean).to.throw()
        end)
    end)

    describe("tables", function()
        it("valid tables", function()
            for _, v in tables do
                expect(module(v).is.table).never.to.throw()
            end
        end)

        it("invalid tables", function()
            for _, v in {strings, numbers, booleans, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).is.table).to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().is.table).to.throw()
        end)
    end)

    describe("functions", function()
        it("valid functions", function()
            for _, v in functions do
                expect(module(v).is.func).never.to.throw()
            end
        end)

        it("invalid functions", function()
            for _, v in {strings, numbers, booleans, tables, threads} do
                for _, v2 in v do
                    expect(module(v2).is.func).to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().is.func).to.throw()
        end)
    end)

    describe("threads", function()
        it("valid threads", function()
            for _, v in threads do
                expect(module(v).is.thread).never.to.throw()
            end
        end)

        it("invalid threads", function()
            for _, v in {strings, numbers, booleans, tables, functions} do
                for _, v2 in v do
                    expect(module(v2).is.thread).to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().is.thread).to.throw()
        end)
    end)
end

