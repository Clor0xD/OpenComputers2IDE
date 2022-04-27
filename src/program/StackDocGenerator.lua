local InventoryController = require("component").inventory_controller

local file = io.open("GTToolStack", "w")
local stack = InventoryController.getStackInInternalSlot()

file:write(
    "---@class GTToolStack\n"..
          "local GTToolStack\n"..
          "\n"..
          "function GTToolStack:doc()\n"
        )

for field,value in pairs(stack) do
    file:write("---@field public "..tostring(field).." "..type(value).."\n")
    file:write("self."..tostring(field).." = nil\n")
end

file:write("end")
file:close()