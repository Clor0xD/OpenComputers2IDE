local Class = require('libEx/Class')

---@class AGeneralBehavior : Class
---@field protected robotExApi RobotExtendedApi
local AGeneralBehavior = Class:extended({class = 'AbstractClass AGeneralBehavior'})

---@return AGeneralBehavior
function AGeneralBehavior:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

---@param robotExApi RobotExtendedApi
---@return AGeneralBehavior
function AGeneralBehavior:init(robotExApi)
    self.robotExApi = robotExApi
    return self
end

---@return void @nil
function AGeneralBehavior:toolService()
    self:noImplError(':toolService()')
end

---@return boolean @status
function AGeneralBehavior:inventoryRefill()
    self:noImplError(':inventoryRefill()')
end

---@return void @nil
function AGeneralBehavior:recharge()
    self:noImplError(':recharge()')
end




return AGeneralBehavior 