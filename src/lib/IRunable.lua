local Class = require("lib/Class")
local IRunable = Class:extended({class = "Interface IRunable"})

function IRunable:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

function IRunable:run(...) 
    self:noImplError("run(...)")
end

return IRunable