
local replicatedStorage = game:GetService("ReplicatedStorage")

local testEz = require(replicatedStorage.devPackages.testez)


-- create test values
require(script.Parent.testValues)


local result = testEz.TestBootstrap:run(
    {replicatedStorage.expect},
    testEz.Reporters.TextReporter
)