<div align="center">⚠️Repo is in development, EVERYTHING is subject to change, until v1.0.0⚠️</div>
<br>

<p align="center" width="100%">
    <img src="./assets/logo.png">
</p>


## Example
```lua
local expect = require("path to expect")

local value = 5
expect(value).is.number() -- errors if value is not a number
expect(value).isNot.number() -- errors if value is a number

local instance = Instance.new("Frame")
expect(instance).is.class("Frame") -- errors if instance is not a Frame

local object = {
    ["a"] = 4,
    ["b"] = true
}
expect(object).has.key("a") -- errors of object does not have key "a"
expect(object).hasNot.key("a") -- errors of object does have key "a"
```

## License

Distributed under the MIT License. See [LICENSE](./LICENSE) for more information.
