local gt_machine = {}

-- Returns the amount of Electricity, accepted by this Block the last 5 ticks as Average.
function gt_machine.getAverageElectricInput()

	-- return number 
end

-- Returns the amount of Electricity, outputted by this Block the last 5 ticks as Average.
function gt_machine.getAverageElectricOutput()

	-- return number 
end

--  Returns the amount of electricity containable in this Block, in EU units!
function gt_machine.getEUCapacity()

	-- return number 
end

-- Returns the average EU input of this block
function gt_machine.getEUInputAverage()

	-- return number 
end

-- Returns the max EU that can be stored in this block
function gt_machine.getEUMaxStored()

	-- return number 
end

-- Returns the average EU output of this block
function gt_machine.getEUOutputAverage()

	-- return number 
end

-- Returns the EU stored in this block
function gt_machine.getEUStored()

	-- return number 
end

-- Gets the maximum Input in EU/p.
function gt_machine.getInputVoltage()

	-- return number 
end

-- Gets the amount of Energy Packets per tick.
function gt_machine.getOutputAmperage()

	-- return number 
end

--  Gets the Output in EU/p.
function gt_machine.getOutputVoltage()

	-- return number 
end

-- Returns the name of this block's owner
function gt_machine.getOwnerName()

	-- return string 
end

-- Returns sensor information about this block
function gt_machine.getSensorInformation()

	-- return table 
end

--  Returns the amount of Steam containable in this Block, in EU units!
function gt_machine.getSteamCapacity()

	-- return number 
end

-- Returns the max steam that can be stored in this block
function gt_machine.getSteamMaxStored()

	-- return number 
end

-- Returns the steam stored in this block
function gt_machine.getSteamStored()

	-- return number 
end

--  Returns the amount of electricity contained in this Block, in EU units!
function gt_machine.getStoredEU()

	-- return number 
end

--  Returns the amount of Steam contained in this Block, in EU units!
function gt_machine.getStoredSteam()

	-- return number 
end

-- Returns the max progress of this block
function gt_machine.getWorkMaxProgress()

	-- return number 
end

-- Returns the current progress of this block
function gt_machine.getWorkProgress()

	-- return number 
end

-- Returns true if the machine currently has work to do
function gt_machine.hasWork()

	-- return boolean 
end

-- Returns whether the machine is currently active
function gt_machine.isMachineActive()

	-- return boolean 
end

-- Returns whether this block is currently allowed to work
function gt_machine.isWorkAllowed()

	-- return boolean 
end

-- Sets whether this block is currently allowed to work
function gt_machine.setWorkAllowed(work)
	-- work:boolean

	-- return 
end

return gt_machine
