local ABaseStation = require('libEx/abstract/ABaseStation')

---@class SimpleBaseStation : ABaseStation
local SimpleBaseStation = ABaseStation:extended({class = 'Class SimpleBaseStation'})

---@type fun():SimpleBaseStation
---@return SimpleBaseStation
function SimpleBaseStation:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

function SimpleBaseStation:getContainerListAdjacent(robotPosition)
    return self.containerList
end

function SimpleBaseStation:getChargerAdjacent(robotPosition)
    return self.chargeStation
end

return SimpleBaseStation