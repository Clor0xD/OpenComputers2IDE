local Class = require('libEx/Class')

---@class AInventoryManager : Class
local AInventoryManager = Class:extended({
    class = 'AbstractClass AInventoryManager'
})
local ContainerHandler = require("libEx/abstract/AContainerHandler")
local DependencyManager = require("libEx/DependencyManager")

function AInventoryManager:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

---@type fun(robotApi: NativeRobotApi)
function AInventoryManager:init(robotApi)
    self.containerHandlerList = {}
    ---@type NativeRobotApi
    self.robotApi = robotApi
    return self
end

---@type fun():boolean
---@return boolean @service is done
function AInventoryManager:checkSelectedTool()
    self:noImplError()
end

-- iterator
---@type fun():function
function AInventoryManager:nextToolToRemoveBlockIterator()
    self:noImplError()
    return function()
        self:noImplError()
    end
end

function AInventoryManager:selectDefaultTool()
    self:noImplError()
end

---@type fun(sampleStack:NativeStack, itemCount:number, container:AContainer):boolean
function AInventoryManager:pullFromContainerStack(sampleStack, itemCount, container)
    self:noImplError()
end

---@type fun(slot:number, itemCount:number, container:AContainer):boolean
function AInventoryManager:pullFromContainerSlot(slot, itemCount, container)
    self:noImplError()
end

---@type fun(count:number):boolean
function AInventoryManager:pushToContainer(count)
    return self.robotApi.drop(count)
end

---@type fun(count:number):boolean
function AInventoryManager:pullToContainer(count)
    return self.robotApi.suck(count)
end

---@type fun(slot:number, itemCount:number, container:AContainer):boolean, string @status, error
function AInventoryManager:pushToContainerSlot(slot, count, container)
    self:noImplError()
end

---@protected
---@return AContainerHandler
---@param container AContainer
---@type fun(container:AContainer):AContainerHandler
function AInventoryManager:getContainerHandler(container)
    for containerClass, handler in pairs(self.containerHandlerList) do
        if container.class == containerClass then
            return handler
        end
    end
    local result = DependencyManager:getHandler(container,ContainerHandler, ":getContainerHandle(container) ")
    self.containerHandlerList[container.class] = result
    return result
end

return AInventoryManager