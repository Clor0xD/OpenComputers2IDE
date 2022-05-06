local InventoryController = require("component").inventory_controller
local Robot = require("robot")
local Shell = require("shell")

local args, ops = Shell.parse(...)
local str
local function stackRead(stack)
    print("{")
    for field, value in pairs(stack) do
        if type(value) == "string" then
            str = "'" .. value .. "'"
        else
            str = tostring(value)
        end
        print(tostring(field) .. " = " .. str .. ",")
    end
    print("},")
end

print("{")
for i = tonumber(args[1]), tonumber(args[2]) do
    Robot.select(i)        
    stackRead(InventoryController.getStackInInternalSlot())
end
print("}")
