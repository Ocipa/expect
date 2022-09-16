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
expect(value).isnt.number() -- errors if value is a number

local instance = Instance.new("Frame")
expect(instance).is.class("Frame") -- errors if instance is not a Frame


expect(value).equal(5) -- errors if value is not equal to 5
expect(value).unequal(5) -- errors of value is equal to 5


local object = {
    ["a"] = 4,
    ["b"] = true
}
expect(object).has.key("a") -- errors of object does not have key "a"
expect(object).hasnt.key("a") -- errors of object does have key "a"
```

## Progress
- [x] is
- [x] isnt
- [ ] equal -- might be changed to be a sub of `is` and `isnt`
- [ ] unequal -- might be changed to be a sub of `is` and `isnt`
- has
    - [ ] has.property
    - [ ] has.attribute
    - [ ] has.key
    - [ ] has.value
- hasnt
    - [ ] hasnt.property
    - [ ] hasnt.attribute
    - [ ] hasnt.key
    - [ ] hasnt.value