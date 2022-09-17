


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
    math.huge,
    -math.huge,
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


return nil