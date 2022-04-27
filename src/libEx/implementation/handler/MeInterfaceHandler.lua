local AContainerHandler = require('libEx/abstract/AContainerHandler')

---@class MeInterfaceHandler : AContainerHandler
local MeInterfaceHandler = AContainerHandler:extended({class = 'Class MeInterfaceHandler'})
local InventoryController = require("component").inventory_controller

---@type fun():MeInterfaceHandler
---@return MeInterfaceHandler
function MeInterfaceHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

return MeInterfaceHandler