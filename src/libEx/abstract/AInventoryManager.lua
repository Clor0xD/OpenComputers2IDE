local Class = require('libEx/Class')

---@class AInventoryManager : Class
---@field containerHandlerList AContainerHandler[]
---@field robotApi NativeRobotApi
local AInventoryManager = Class:extended({
    class = 'AbstractClass AInventoryManager'
})
local ContainerHandler = require("libEx/abstract/AContainerHandler")
local AContainer = require("libEx/abstract/AContainer")
local DependencyManager = require("libEx/DependencyManager")

function AInventoryManager:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

---@type fun(robotApi: NativeRobotApi)
function AInventoryManager:setRobotApi(robotApi)
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

-- iterator
---@type fun():function
function AInventoryManager:chargeGToolIterator()
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

---@type fun(slot:number, itemCount:number, container:AContainer):boolean, string @status, error
function AInventoryManager:pushToContainerSlot(slot, count, container)
    self:noImplError()
end

---@return table<string,number>@NativeStack.label, totalCount
function AInventoryManager:getInventoryList()
    self:noImplError()
end

---@param facing Facing
---@param count number
function AInventoryManager:pushToContainer(facing, count)
    if facing == AContainer.facingEnum.front then
        return self.robotApi.drop(count)
    elseif facing == AContainer.facingEnum.top then
        return self.robotApi.dropUp(count)
    elseif facing == AContainer.facingEnum.bottom then
        return self.robotApi.dropDown(count)
    end
end

---@param facing Facing
---@param count number
function AInventoryManager:pullToContainer(facing, count)
    if facing == AContainer.facingEnum.front then
        return self.robotApi.suck(count)
    elseif facing == AContainer.facingEnum.top then
        return self.robotApi.suckUp(count)
    elseif facing == AContainer.facingEnum.bottom then
        return self.robotApi.suckDown(count)
    end    
end

---@param sampleStack NativeStack @optional
---@return boolean @status
function AInventoryManager:selectStack(sampleStack)
    self:noImplError(':selectStack(sampleStack)')
end

---@protected
---@return AContainerHandler
---@param container AContainer
function AInventoryManager:getContainerHandler(container)
    self:createFieldIfMissing("containerHandlerList", {})
    for containerClass, handler in pairs(self.containerHandlerList) do
        if container.class == containerClass then
            return handler
        end
    end
    local result = DependencyManager:getHandler(container, ContainerHandler,
        self.class .. ":getContainerHandle(container) ")
    self.containerHandlerList[container.class] = result
    return result
end

return AInventoryManager
