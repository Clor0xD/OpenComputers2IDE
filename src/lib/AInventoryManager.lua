local Parent = require('lib/Class')
local Object = Parent:extended({class = 'AbstractClass AInventoryManager'})

function Object:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

---@type fun():boolean
---@return boolean @service is done
function Object:toolMaintenance()
    self:noImplError()
end

--iterator
function Object:nextToolToRemoveBlock()
    self:noImplError()
end

function Object:selectDefaultTool()
    self:noImplError()
end


return Object