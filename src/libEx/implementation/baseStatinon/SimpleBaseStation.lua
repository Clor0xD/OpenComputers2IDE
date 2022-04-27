local Parent = require('libEx/abstract/ABaseStation')

---@class SimpleBaseStation : ABaseStation
local SimpleBaseStation = Parent:extended({class = 'Class SimpleBaseStation'})

---@type fun():SimpleBaseStation
---@return SimpleBaseStation
function SimpleBaseStation:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

function SimpleBaseStation:init(initTable)
    self.parkingPosition = initTable.parkingPosition
    self.containerList = initTable.containerList
    self.chargeStation = initTable.chargeStation
    return self
end  

function getContainerListAdjacent(robotPosition)
    return self.containerList
end

function getChargerAdjacent(robotPosition)
    return self.chargeStation
end

return SimpleBaseStation