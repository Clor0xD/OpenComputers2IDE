local AContainer = require('libEx/abstract/AContainer')
---@class ChargeStationContainer : AContainer
local ChargeStationContainer = AContainer:extended({class = 'Class ChargeStationContainer'})

---@type fun():ChargeStationContainer
---@return ChargeStationContainer
function ChargeStationContainer:new(initTable)
    local instance = self.super:new(initTable)
    return self:extendedInstance(instance)
end

return ChargeStationContainer