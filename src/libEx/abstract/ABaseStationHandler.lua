local Class = require('libEx/Class')

---@class ABaseStationHandler : Class
local ABaseStationHandler = Class:extended({class = 'AbstractClass ABaseStationHandler'})

ABaseStation.path = "libEx/implementation/handler/"
ABaseStation.suffix = "BaseStatinonHandler"

---@type fun():ABaseStationHandler
---@return ABaseStationHandler
function ABaseStationHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

return ABaseStationHandler