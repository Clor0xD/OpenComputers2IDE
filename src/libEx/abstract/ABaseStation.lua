local Class = require('libEx/Class')

---@class ABaseStation : Class
local ABaseStation = Class:extended({class = 'AbstractClass ABaseStation'})

ABaseStation.path = "libEx/implementation/baseStatinon/"
ABaseStation.suffix = "BaseStatinon"

---@type fun():ABaseStation
---@return ABaseStation
function ABaseStation:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

function ABaseStation:init(initTable)
    ---@type Position
    self.parkingPosition = initTable.parkingPosition
    ---@type AContainer[]
    self.containerList = initTable.containerList
    ---@type AContainer
    self.chargeStation = initTable.chargeStation
    return self
end  

function ABaseStation:getContainerListAdjacent(robotPosition)
    self:noImplError()
end

function ABaseStation:getChargerAdjacent(robotPosition)
    self:noImplError()
end

function ABaseStation:getParkingPosition()
    return self.parkingPosition
end


---@type fun(usageType:UsageType, stackSamle:NativeStack):table ListOf_AContainer @stackSamle optional
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

return ABaseStation