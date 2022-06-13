---@class IRobotServiceHandler
local IRobotServiceHandler

IRobotServiceHandler = {
    class = 'Interface IRobotServiceHandler'
}

---@param robotExApi RobotExtendedApi
---@return boolean @status
function IRobotServiceHandler:toolService(robotExApi)
    self:noImplError(':toolService()')
end

---@param robotExApi RobotExtendedApi
---@param blockList table<NativeStack|StackStorageData,number>@Stack, totalCount
---@return boolean @status
function IRobotServiceHandler:inventoryRefill(robotExApi, blockList)
    self:noImplError(':inventoryRefill()')
end

---@param robotExApi RobotExtendedApi
---@return boolean @status
function IRobotServiceHandler:recharge(robotExApi)
    self:noImplError(':recharge()')
end

---@param robotExApi RobotExtendedApi
---@param blockList table<NativeStack|StackStorageData,number>@Stack, totalCount
---@return boolean @status
function IRobotServiceHandler:fullService(robotExApi, blockList)
    self:noImplError(':fullService()')
end

return IRobotServiceHandler
