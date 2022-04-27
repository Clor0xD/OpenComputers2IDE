local AContainer = require('libEx/abstract/AContainer')
---@class MeInterfaceContainer : AContainer
local MeInterfaceContainer = AContainer:extended({class = 'Class MeInterfaceContainer'})

---@type fun():MeInterfaceContainer
---@return MeInterfaceContainer
function MeInterfaceContainer:new(initTable)
    local instance = self.super:new(initTable)
    return self:extendedInstance(instance)
end

return MeInterfaceContainer