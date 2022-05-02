local Class = require("libEx/Class")

---@class Test : Class, IRunable 
local test = Class:extended({class = "Test"})
test:implements(require"libEx/interface/IRunable")
test:new():run()