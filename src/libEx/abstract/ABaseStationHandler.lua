local Class = require('libEx/Class')

---@class ABaseStationHandler : Class, IRobotServiceHandler
local ABaseStationHandler = Class:extended({class = 'AbstractClass ABaseStationHandler'}):implements(require("libEx/interface/IRobotServiceHandler"))
ABaseStationHandler.path = "libEx/implementation/handler/"
ABaseStationHandler.suffix = "BaseStationHandler"

---@type fun():ABaseStationHandler
---@return ABaseStationHandler
function ABaseStationHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

return ABaseStationHandler