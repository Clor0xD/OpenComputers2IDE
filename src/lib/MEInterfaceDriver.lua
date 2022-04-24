local Parent = require('lib/Class')
local Object = Parent:extended({class = 'Class MEInterfaceDriver'})

function Object:new(ID)
    local instance = self.super:new()    
    return self:extendedInstance(instance):setID(ID)
end

function Object:setID(ID)
    self.ID = ID
    return self
end

function Object:getID()
    return self.ID
end

return Object