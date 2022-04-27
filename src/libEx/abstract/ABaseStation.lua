local Class = require('libEx/Class')

---@class ABaseStation : Class
local ABaseStation = Class:extended({class = 'AbstractClass ABaseStation'})

---@type fun():ABaseStation
---@return ABaseStation
function ABaseStation:new(initTable)
    local instance = self.super:new(initTable)
    return self:extendedInstance(instance)
end

function ABaseStation:getParkingPosition()
    return self.parkingPosition
end

---@type fun(usageType:AContainer.usageType, stackSamle:NativeStack):ListOf_AContainer @stackSamle optional
function ABaseStation:getContainerByUsageType(usageType, stackSample)
    local list = {}
    for _,container in pairs(self.containerList) do
        if container:filter(usageType, stackSample) then
            table.insert(list, container)
        end
    end
    if #list == 0 then
        return nil
    end
    return list
end

function getContainerListAdjacent(robotPosition)
    self:noImplError()
end

function getChargerAdjacent(robotPosition)
    self:noImplError()
end

return ABaseStation