local AInventoryManager = require('libEx/abstract/AInventoryManager')
local InventoryController = require("component").inventory_controller

---@class ExtendedInventoryManager : AInventoryManager
local ExtendedInventoryManager = AInventoryManager:extended({
    class = 'Class ExtendedInventoryManager'
})

---@type fun():ExtendedInventoryManager
---@return ExtendedInventoryManager
function ExtendedInventoryManager:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

function ExtendedInventoryManager:init(robotApi)
    self.super:init(robotApi)
    self.isGtDrillEquip = true
    self.toolIndex = 0
    return self
end

function ExtendedInventoryManager:checkSelectedTool()
    local result = true
    if self.isGtDrillEquip then
        InventoryController.equip()
        ---@type GTToolStack
        local drill = InventoryController.getStackInInternalSlot()
        if drill.charge < (drill.maxCharge * 0.05) then
            result = false
        end
        InventoryController.equip()
    end
    return result
end

function ExtendedInventoryManager:nextToolToRemoveBlockIterator()
    return function() -- next()
        if self.toolIndex < 1 then
            InventoryController.equip()
            self.toolIndex = self.toolIndex + 1
            if self.isGtDrillEquip then
                return "GT_Drill"
            end
            return "Hand"
        else
            self.toolIndex = 0
            return nil
        end
    end
end

function ExtendedInventoryManager:selectDefaultTool()
    if not self.isGtDrillEquip then
        InventoryController.equip()
        self.sDrillEquip = not self.isGtDrillEquip
    end
    return "GT_Drill"
end

function ExtendedInventoryManager:pullFromContainerStack(sampleStack, itemCount, container)
    return self:getContainerHandler(container):pullToStack(sampleStack, itemCount, container)
end

function ExtendedInventoryManager:pullFromContainerSlot(slot, itemCount, container)
    return self:getContainerHandler(container):pullToSlot(slot, itemCount, container)
end

function ExtendedInventoryManager:pushToContainerSlot(slot, itemCount, container)
    return self:getContainerHandler(container):pushToContainerSlot(slot, itemCount, container)
end

---@param sampleStack NativeStack @optional
---@return boolean @status
function AInventoryManager:selectStack(sampleStack)
    ---@type NativeStack    
    local stack, size = nil, self.robotApi.inventorySize()   
    for i = 1, size do
        stack = InventoryController.getStackInInternalSlot(i)
        if stack and stack.label == sampleStack.label then
            self.robotApi.select(i)
            return true
        end
    end
    return false
end

return ExtendedInventoryManager
