local Parent = require('lib/Class')
local Object = Parent:extended({class = 'AbstractClass ABaseStation'})

function Object:new()
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

function Object:init(initTable)
    self.shape = initTable.shape
    self.sliceBuilder =  initTable.sliceBuilder
    return self
end   

return Object  