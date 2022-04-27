local ABaseStationHandler = require('libEx/abstract/ABaseStationHandler')

---@class SimpleBaseStationHandler : ABaseStationHandler
local SimpleBaseStationHandler = ABaseStationHandler:extended({class = 'Class SimpleBaseStationHandler'})

---@type fun():SimpleBaseStationHandler
---@return SimpleBaseStationHandler
function SimpleBaseStationHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

return SimpleBaseStationHandler 