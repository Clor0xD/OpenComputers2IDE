local ABaseStationHandler = require('libEx/abstract/ABaseStationHandler')

---@class SimpleBaseStationHandler : ABaseStationHandler
local SimpleBaseStationHandler = ABaseStationHandler:extended({class = 'Class SimpleBaseStationHandler'})

local InventoryController = require("component").inventory_controller

---@type fun():SimpleBaseStationHandler
---@return SimpleBaseStationHandler
function SimpleBaseStationHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

---@param robotExApi RobotExtendedApi
---@param blockList table<NativeStack,number> @NativeStack, totalCount
---@return void @nil
function SimpleBaseStationHandler:fullService(robotExApi, blockList)    
    robotExApi:goTo(robotExApi.baseStation.chargeStation.parkingPosition, robotExApi.movePatternZXY, true, true, 100, true)
    local inventoryList = robotExApi.inventoryManager:getInventoryList()  

    for tool in robotExApi.inventoryManager:chargeGToolIterator() do
        InventoryController.equip()
        robotExApi.inventoryManager:pushToContainer(robotExApi.baseStation.chargeStation.facing,1)
        local stack, toolCharged = nil, false

        while (not toolCharged) or (not robotExApi:isCharged()) do
            ---@type GTToolStack
            stack = InventoryController.getStackInSlot(robotExApi.baseStation.chargeStation.facing,1)
            if stack.charge == stack.maxCharge then                
                toolCharged = true
            end            
            os.sleep(1)   
        end        
    end

    robotExApi.inventoryManager:pullToContainer(robotExApi.baseStation.chargeStation.facing,1)
    InventoryController.equip()

    for stack,totalCount in pairs(blockList) do
        print(stack)        
        robotExApi.inventoryManager:selectStack(stack)
        local deltaCount = totalCount - (inventoryList[stack.label] and inventoryList[stack.label] or 0)             
        robotExApi.inventoryManager:pullFromContainerStack(deltaCount % stack.maxSize, robotExApi.baseStation.containerList[1])      
        for i = 1, deltaCount // stack.maxSize do
            os.sleep(0.1)
            if not robotExApi.inventoryManager:pullFromContainerStack(stack.maxSize, robotExApi.baseStation.containerList[1]) then
                break
            end
        end
    end
    robotExApi:goTo(robotExApi.baseStation.parkingPosition, robotExApi.movePatternZXY, true, true, 100)
end

---@param robotExApi RobotExtendedApi
---@return void @nil
function SimpleBaseStationHandler:toolService(robotExApi)
    self:fullService(robotExApi, {})
end

---@param robotExApi RobotExtendedApi
---@param blockList table<NativeStack,number>@NativeStack, totalCount
---@return boolean @status
function SimpleBaseStationHandler:inventoryRefill(robotExApi, blockList)
    self:fullService(robotExApi, blockList)
end

---@param robotExApi RobotExtendedApi
---@return void @nil
function SimpleBaseStationHandler:recharge(robotExApi)
    self:fullService(robotExApi, {})
end

return SimpleBaseStationHandler 