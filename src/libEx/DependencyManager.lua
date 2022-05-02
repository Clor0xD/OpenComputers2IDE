local Class = require('libEx/Class')

---@class DependencyManager : Class
local DependencyManager = Class:extended({class = 'Class DependencyManager'})

---@type fun():DependencyManager
---@return DependencyManager
function DependencyManager:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

function DependencyManager:getHandler(descriptorInstance, AHandler, errorMessage) 
    local modName = AHandler.path .. string.gsub(descriptorInstance:getClassName(), descriptorInstance.suffix, AHandler.suffix)
    local status, result = xpcall(function() return require(modName) end, debug.traceback)
    if not status then
        local error = result.."\n"..errorMessage..modName.." not found"
        -- todo logger 
        _G.error(error)
        os.exit(error)
    end   
    return result
end


return DependencyManager