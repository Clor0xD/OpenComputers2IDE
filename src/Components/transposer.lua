local transposer = {}

-- Get whether the items in the two specified slots of the inventory on the specified side of the device are equivalent (have shared OreDictionary IDs).
function transposer.areStacksEquivalent(side, slotA, slotB)
	-- side:number
	-- slotA:number
	-- slotB:number

	-- return boolean 
end

-- Compare an item in the specified slot in the inventory on the specified side with one in the database with the specified address.
function transposer.compareStackToDatabase(side, slot, dbAddress, dbSlot, checkNBT)
	-- side:number
	-- slot:number
	-- dbAddress:string
	-- dbSlot:number
	-- checkNBT:boolean=false

	-- return boolean 
end

-- Get whether the items in the two specified slots of the inventory on the specified side of the device are of the same type.
function transposer.compareStacks(side, slotA, slotB, checkNBT)
	-- side:number
	-- slotA:number
	-- slotB:number
	-- checkNBT:boolean=false

	-- return boolean 
end

-- Get a description of all stacks in the inventory on the specified side of the device.
function transposer.getAllStacks(side)
	-- side:number

	-- return userdata 
end

-- Get a description of the fluid in the the specified tank on the specified side.
function transposer.getFluidInTank(side, tank)
	-- side:number
	-- tank:number

	-- return table 
end

-- Get the the name of the inventory on the specified side of the device.
function transposer.getInventoryName(side)
	-- side:number

	-- return string 
end

-- Get the number of slots in the inventory on the specified side of the device.
function transposer.getInventorySize(side)

	-- return number 
end

-- Get the maximum number of items in the specified slot of the inventory on the specified side of the device.
function transposer.getSlotMaxStackSize(side, slot)
	-- side:number
	-- slot:number

	-- return number 
end

-- Get number of items in the specified slot of the inventory on the specified side of the device.
function transposer.getSlotStackSize(side, slot)
	-- side:number
	-- slot:number

	-- return number 
end

-- Get a description of the stack in the inventory on the specified side of the device.
function transposer.getStackInSlot(side, slot)
	-- side:number
	-- slot:number

	-- return table 
end

-- Get the capacity of the specified tank on the specified side.
function transposer.getTankCapacity(side, tank)
	-- side:number
	-- tank:number

	-- return number 
end

-- Get the number of tanks available on the specified side.
function transposer.getTankCount(side)
	-- side:number

	-- return number 
end

-- Get the amount of fluid in the specified tank on the specified side.
function transposer.getTankLevel(side, tank)
	-- side:number
	-- tank:number

	-- return number 
end

-- Store an item stack description in the specified slot of the database with the specified address.
function transposer.store(side, slot, dbAddress, dbSlot)
	-- side:number
	-- slot:number
	-- dbAddress:string
	-- dbSlot:number

	-- return boolean 
end

-- Transfer some items between two inventories.
function transposer.transferFluid(sourceSide, sinkSide, count)
	-- sourceSide:number
	-- sinkSide:number
	-- count:number

	-- return number 
end

-- Transfer some items between two inventories.
function transposer.transferItem(sourceSide, sinkSide, count, sourceSlot, sinkSlot)
	-- sourceSide:number
	-- sinkSide:number
	-- count:number
	-- sourceSlot:number
	-- sinkSlot:number

	-- return number 
end

return transposer
