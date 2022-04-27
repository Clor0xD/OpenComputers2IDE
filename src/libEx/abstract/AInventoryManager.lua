local Class = require('libEx/Class')
local AInventoryManager = Class:extended({
    class = 'AbstractClass AInventoryManager'
})
local ContainerHandler = require("libEx/abstract/AContainerHandler")
local DependencyManager = require("libEx/DependencyManager")

function AInventoryManager:new()
    local instance = self.super:new()
    return self:extendedInstance(instance):init()
end

function AInventoryManager:init()
    self.containerHandlerList = {}
    return self
end

---@type fun():boolean
---@return boolean @service is done
function AInventoryManager:toolMaintenance()
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

function AInventoryManager:pullFromContainerStack(sampleStack, itemCount, container)
    self:noImplError()
end

function AInventoryManager:pullFromContainerSlot(slot, itemCount, container)
    self:noImplError()
end

function AInventoryManager:pushToContainer(count)
    self:noImplError()
end

function AInventoryManager:pushToContainerSlot(slot, count, container)
    self:noImplError()
end

---@protected
---@return AContainerHandler
---@param container AContainer
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