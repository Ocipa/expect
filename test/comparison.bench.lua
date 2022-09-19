local expect = require(game.ReplicatedStorage.expect)

local n = 100

return {
	ParameterGenerator = function()
		return math.random(1000)/10
	end,

	Functions = {
		[("%i expects"):format(n)] = function(Profiler, RandomNumber)
			Profiler.Begin("a")
			for i=1, n do
				expect(RandomNumber).is.number()
			end
			Profiler.End()
		end,

		[("%i formatted asserts"):format(n)] = function(Profiler, RandomNumber)
			Profiler.Begin("a")
			for i=1, n do
				assert(typeof(RandomNumber) == "number", ("[ERROR]: expected number, got %s"):format(typeof(RandomNumber)))
			end
			Profiler.End()
		end,

		[("%i asserts"):format(n)] = function(Profiler, RandomNumber)
			Profiler.Begin("a")
			for i=1, n do
				assert(typeof(RandomNumber) == "number", "[ERROR]: expected number, got not number")
			end
			Profiler.End()
		end,

        -- I know this is basically just benchmarking an if statment
		[("%i errors"):format(n)] = function(Profiler, RandomNumber)
			Profiler.Begin("a")
			for i=1, n do
				if typeof(RandomNumber) ~= "number" then
					error("[ERROR]: expected number, got not number")
				end
			end
			Profiler.End()
		end,
	}
}
