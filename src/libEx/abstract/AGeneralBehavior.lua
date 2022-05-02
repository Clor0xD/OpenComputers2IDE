local Class = require('libEx/Class')

---@class AGeneralBehavior : Class, IRunable, IRobotServiceHandler
---@field public robotExApi RobotExtendedApi
---@field public baseStatinonHandlerList ABaseStationHandler[]
local AGeneralBehavior = Class:extended({
    class = 'AbstractClass AGeneralBehavior'
}):implements(require("libEx/interface/IRunable"), require("libEx/interface/IRobotServiceHandler"))

local DependencyManager = require("libEx/DependencyManager")
local BaseStationHandler = require("libEx/abstract/ABaseStationHandler")

---@return AGeneralBehavior
function AGeneralBehavior:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

---@param robotExApi RobotExtendedApi
---@return AGeneralBehavior
function AGeneralBehavior:setRobotExApi(robotExApi)
    -- self:assertInstance(":setRobotExApi(robotExApi) "..self:getClassName().." is not instanse")
    self.robotExApi = robotExApi    
    return self
end

---@protected
---@return ABaseStationHandler
---@param baseStation ABaseStation
function AGeneralBehavior:getBaseStationHandler(baseStation)
    self:createFieldIfMissing("baseStatinonHandlerList", {})   
    for baseStatinonClass, handler in pairs(self.baseStatinonHandlerList) do
        if baseStation.class == baseStatinonClass then
            return handler
        end
    end
    local result = DependencyManager:getHandler(baseStation, BaseStationHandler,
        self.class .. ":getBaseStationHandler(baseStation) ")
    self.baseStatinonHandlerList[baseStation.class] = result    
    return result
end

return AGeneralBehavior
