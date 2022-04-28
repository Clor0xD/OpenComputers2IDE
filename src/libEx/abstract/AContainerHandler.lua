--соглашение о именовании [ContainerName].."Handler" пример ChestHandler
--соглашение о пути lib/implementation/hendler/

local Class = require('libEx/Class')
local InventoryController = require("component").inventory_controller
---@class AContainerHandler : Class
local AContainerHandler = Class:extended({class = 'AbstractClass AContainerHandler'})

AContainerHandler.path = "libEx/implementation/handler/"
AContainerHandler.suffix = "Handler"

---@return AContainerHandler
function AContainerHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

---@param sampleStack NativeStack
---@param container AContainer
---@param offset number @optional
---@param size number @optional
---@return number @slot or nil
function AContainerHandler:searchStackSlot(sampleStack, container, offset, size)
    ---@type NativeStack    
    local stack, temp = nil,  InventoryController.getInventorySize(container.facing)
    if not offset then
        offset = 1
    end    
    if not size or size > temp then
        size = temp
    end
    for i = offset, size do
        stack = InventoryController.getStackInSlot(container.facind, i)
        if stack and stack.label == sampleStack.label then
            return i
        end
    end
    return nil
end

---@param sampleStack NativeStack
---@param itemCount number
---@param container AContainer
---@return boolean @true if at least one item was moved, false otherwise.
function AContainerHandler:pullToStack(sampleStack, itemCount, container)
    return InventoryController.suckFromSlot(container.facind, self:searchStackSlot(sampleStack,container), itemCount)
end

---@param slot number
---@param itemCount number
---@param container AContainer
---@return boolean @true if at least one item was moved, false otherwise.
function AContainerHandler:pullToSlot(slot, itemCount, container)
    return InventoryController.suckFromSlot(container.facind, slot, itemCount)
end

---@param slot number
---@param itemCount number
---@param container AContainer
---@return boolean, string @1:status, 2:error
function AContainerHandler:pushToContainerSlot(slot, itemCount, container)
    return InventoryController.dropIntoSlot(container.facing, slot, itemCount)
end

return AContainerHandler