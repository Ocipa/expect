

local strings = _G.strings
local numbers = _G.numbers
local booleans = _G.booleans
local tables = _G.tables
local functions = _G.functions
local threads = _G.threads


return function()
    local module = require(script.Parent)

    describe("none", function()
        it("valid none", function()
            expect(module().isNot.none).to.throw()
        end)

        it("invalid none", function()
            for _, v in {strings, numbers, booleans, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).isNot.none).never.to.throw()
                end
            end
        end)
    end)

    describe("strings", function()
        it("valid strings", function()
            for _, v in strings do
                expect(module(v).isNot.string).to.throw()
            end
        end)

        it("invalid strings", function()
            for _, v in {numbers, booleans, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).isNot.string).never.to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().isNot.string).never.to.throw()
        end)
    end)

    describe("numbers", function()
        it("valid numbers", function()
            for _, v in numbers do
                expect(module(v).isNot.number).to.throw()
            end
        end)

        it("invalid numbers", function()
            for _, v in {strings, booleans, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).isNot.number).never.to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().isNot.number).never.to.throw()
        end)
    end)

    describe("booleans", function()
        it("valid booleans", function()
            for _, v in booleans do
                expect(module(v).isNot.boolean).to.throw()
            end
        end)

        it("invalid booleans", function()
            for _, v in {strings, numbers, tables, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).isNot.boolean).never.to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().isNot.boolean).never.to.throw()
        end)
    end)

    describe("tables", function()
        it("valid tables", function()
            for _, v in tables do
                expect(module(v).isNot.table).to.throw()
            end
        end)

        it("invalid tables", function()
            for _, v in {strings, numbers, booleans, functions, threads} do
                for _, v2 in v do
                    expect(module(v2).isNot.table).never.to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().isNot.table).never.to.throw()
        end)
    end)

    describe("functions", function()
        it("valid functions", function()
            for _, v in functions do
                expect(module(v).isNot.func).to.throw()
            end
        end)

        it("invalid functions", function()
            for _, v in {strings, numbers, booleans, tables, threads} do
                for _, v2 in v do
                    expect(module(v2).isNot.func).never.to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().isNot.func).never.to.throw()
        end)
    end)

    describe("threads", function()
        it("valid threads", function()
            for _, v in threads do
                expect(module(v).isNot.thread).to.throw()
            end
        end)

        it("invalid threads", function()
            for _, v in {strings, numbers, booleans, tables, functions} do
                for _, v2 in v do
                    expect(module(v2).isNot.thread).never.to.throw()
                end
            end
        end)

        it("passed none", function()
            expect(module().isNot.thread).never.to.throw()
        end)
    end)
end

