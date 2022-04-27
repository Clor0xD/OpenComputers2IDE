local AContainerHandler = require('libEx/abstract/AContainerHandler')

---@class ChargeStationHandler : AContainerHandler
local ChargeStationHandler = AContainerHandler:extended({class = 'Class ChargeStationHandler'})

---@type fun():ChargeStationHandler
---@return ChargeStationHandler
function ChargeStationHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end



return ChargeStationHandler