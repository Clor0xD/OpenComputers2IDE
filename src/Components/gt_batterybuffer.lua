local gt_batterybuffer = {}

-- Returns the amount of Electricity, accepted by this Block the last 5 ticks as Average.
function gt_batterybuffer.getAverageElectricInput()

	-- return number 
end

-- Returns the amount of Electricity, outputted by this Block the last 5 ticks as Average.
function gt_batterybuffer.getAverageElectricOutput()

	-- return number 
end

-- Returns the amount of stored EU in the battery in the specified slot
function gt_batterybuffer.getBatteryCharge(slot)
	-- slot:number

	-- return number 
end

--  Returns the amount of electricity containable in this Block, in EU units!
function gt_batterybuffer.getEUCapacity()

	-- return number 
end

--  Returns the average EU input of this block
function gt_batterybuffer.getEUInputAverage()

	-- return number 
end

--  Returns the max EU that can be stored in this block
function gt_batterybuffer.getEUMaxStored()

	-- return number 
end

--  Returns the average EU output of this block
function gt_batterybuffer.getEUOutputAverage()

	-- return number 
end

--  Returns the EU stored in this block
function gt_batterybuffer.getEUStored()

	-- return number 
end

-- Gets the maximum Input in EU/p.
function gt_batterybuffer.getInputVoltage()

	-- return number 
end

--  Returns the max amount of stored EU in the battery in the specified slot
function gt_batterybuffer.getMaxBatteryCharge(slot)
	-- slot:number

	-- return number 
end

-- Gets the amount of Energy Packets per tick.
function gt_batterybuffer.getOutputAmperage()

	-- return number 
end

--  Gets the Output in EU/p.
function gt_batterybuffer.getOutputVoltage()

	-- return number 
end

--  Returns the name of this block's owner
function gt_batterybuffer.getOwnerName()

	-- return string 
end

--  Returns sensor information about this block
function gt_batterybuffer.getSensorInformation()

	-- return table 
end

--  Returns the amount of Steam containable in this Block, in EU units!
function gt_batterybuffer.getSteamCapacity()

	-- return number 
end

--  Returns the max steam that can be stored in this block
function gt_batterybuffer.getSteamMaxStored()

	-- return number 
end

--  Returns the steam stored in this block
function gt_batterybuffer.getSteamStored()

	-- return number 
end

--  Returns the amount of electricity contained in this Block, in EU units!
function gt_batterybuffer.getStoredEU()

	-- return number 
end

--  Returns the amount of Steam contained in this Block, in EU units!
function gt_batterybuffer.getStoredSteam()

	-- return number 
end

--  Returns the max progress of this block
function gt_batterybuffer.getWorkMaxProgress()

	-- return number 
end

--  Returns the current progress of this block
function gt_batterybuffer.getWorkProgress()

	-- return number 
end

--  Returns true if the machine currently has work to do
function gt_batterybuffer.hasWork()

	-- return boolean 
end

--  Returns whether the machine is currently active
function gt_batterybuffer.isMachineActive()

	-- return boolean 
end

--  Returns whether this block is currently allowed to work
function gt_batterybuffer.isWorkAllowed()

	-- return boolean 
end

--  Sets whether this block is currently allowed to work
function gt_batterybuffer.setWorkAllowed(work)
	-- work:boolean

	-- return 
end

return gt_batterybuffer
