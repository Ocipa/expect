

--[[

YES, I AM USING _G, THESE ARE JUST TEST VALUES FOR TESTING, THIS
CODE WILL NEVER RUN IN A GAME. FIGHT ME!

- Ocipa 9/17/2022

--]]




_G.strings = {
    "a",
    "test",
    tostring(500),
    "- - -",
    "....."
}

_G.numbers = {
    0,
    5,
    -8,
    0.333,
    5.0001,
    math.pi,
    tonumber("250"),
}

_G.booleans = {
    true,
    false,
}

_G.tables = {
    {},
    {{}, {}},
    {"a", "b"},
    {1, 2, 3},
    table.pack("a", "b", "c"),
}

_G.functions = {
    function() end,
}

_G.threads = {
    coroutine.create(function() end),
}

_G.instance = Instance.new("Part")
_G.instance:SetAttribute("number", 0)
_G.instance:SetAttribute("boolean", false)
_G.instance:SetAttribute("string", "test value")
_G.instance:SetAttribute("vector3", Vector3.zero)
_G.instance:SetAttribute("udim", UDim.new())

_G.validProperties = {
    "Size",
    "Position",
    "Name",
    "Color",
}

_G.invalidProperties = {
    "test",
    "a",
    ".....",
    tostring(50),
}

_G.validAttributes = {
    "number",
    "boolean",
    "string",
    "vector3",
    "udim",
}

_G.invalidAttributes = _G.invalidProperties

_G.tbl = {
    [1] = "a",
    ["2"] = 4,
    ["test"] = true,
    [_G.instance] = 44,
    [50] = _G.instance,
    [false] = 5,
}

_G.validKeys = {
    1, "2", "test", _G.instance, 50, false
}

_G.invalidKeys = {
    "a", "b", 4, true, 30
}

_G.validValues = {
    "a", 4, true, 44, _G.instance, 5
}

_G.invalidValues = {
    "c", 99, false
}

_G.nearValues = {
    {0, 5, 7},
    {-5, 5, 10},
    {Vector2.new(0, 0), Vector2.new(1, 1), 2},
    {Vector2.new(-5, 5), Vector2.new(3, 8), 25},
    {Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), 2},
    {Vector3.new(-5, 5, 3), Vector3.new(3, 8, 7), 25},
    {CFrame.new(Vector3.new(0, 0, 0)), CFrame.new(Vector3.new(1, 1, 1)), 2},
    {CFrame.new(Vector3.new(-5, 5, 3)), CFrame.new(Vector3.new(3, 8, 7)), 25},
    {Instance.new("Part"), Instance.new("Part"), 0},
}

_G.notNearValues = {
    {0, 5, 3},
    {-5, 5, 5},
    {Vector2.new(0, 0), Vector2.new(1, 1), 1},
    {Vector2.new(-5, 5), Vector2.new(3, 8), 2},
    {Vector3.new(0, 0, 0), Vector3.new(1, 1, 1), .5},
    {Vector3.new(-5, 5, 3), Vector3.new(3, 8, 7), 3},
    {CFrame.new(Vector3.new(0, 0, 0)), CFrame.new(Vector3.new(1, 1, 1)), .5},
    {CFrame.new(Vector3.new(-5, 5, 3)), CFrame.new(Vector3.new(3, 8, 7)), 3},
    {Instance.new("Part"), Instance.new("Part"), -1},
}

_G.nan = {
    0/0
}

_G.inf = {
    1/0,
    math.huge
}

return nil