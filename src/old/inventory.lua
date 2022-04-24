---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by SZS.
--- DateTime: 18.04.2022 14:54
---

local robot_api = require('robot')
local inventoryController = require('component').inventory_controller

local inventory = {}
inventory.controller = inventoryController

function inventory:selectPlaceSlot()
    local quantity = robot_api.count()
    if quantity == 0 or not robot_api.compareTo(robot_api.inventorySize()) then
        for slot = 1, robot_api.inventorySize()-1 do
            robot_api.select(slot)
            if robot_api.count() > 0 and robot_api.compareTo(robot_api.inventorySize()) then
                return true
            end
        end
    else
        return true
    end
    return false
end

function inventory:_takeMaxFromBarrel(side, stackSize)
    while inventoryController.suckFromSlot(side, 2, stackSize) do end
end

function inventory:_takeMaxFromChest(side, stackSize)
    for slot = 1, inventoryController.getInventorySize(side) do
        inventoryController.suckFromSlot(side, slot, stackSize)
    end
end

function inventory:dropMiningItem()
    for slot = 1, robot_api.inventorySize()-1 do
        robot_api.select(slot)
        if robot_api.count() > 0 and not robot_api.compareTo(robot_api.inventorySize()) then
           robot_api.drop()
        end
    end
end

function inventory:fillAll(side)
    self:dropMiningItem()
    robot_api.select(robot_api.inventorySize())
    local extSize = inventoryController.getInventorySize(side)
    if not extSize then
        return false
    end
    if extSize == 2 then
        self:_takeMaxFromBarrel(side, 64)
    else
        self:_takeMaxFromChest(side, 64)
    end
    robot_api.select(1)
    local totalCount = 0
    for slot = 1, robot_api.inventorySize() do
        totalCount = totalCount + robot_api.count(slot)
    end
    return true, totalCount
end

return inventory