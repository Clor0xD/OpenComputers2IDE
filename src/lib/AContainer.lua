local Parent = require('lib/Class')
local Object = Parent:extended({class = 'AbstractClass AContainer'})

Object.usageType = {import = 'import', export = 'export', combo = 'combo'}

function Object:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

function Object:init(initTable)
    local error = ':init(initTable.'
    self.slotCount = initTable.slotCount
    self.firstSlotOffset = self:assertNumberSetDefault(initTable.firstSlotOffset, 0, error .. 'firstSlotOffset)')
    self.usage = initTable.usage
    self.patternFirstSlot = initTable.patternFirstSlot
    self.patternLastSlot = initTable.patternLastSlot    
end

function Object:getItem(stack, count)
    self:noImplError()
end

function Object:pushItem(slot, count)
    self:noImplError()
end

return Object