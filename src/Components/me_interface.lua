local me_interface = {}

-- Get the average power injection into the network.
function me_interface.getAvgPowerInjection()

	-- return number 
end

-- Get the average power usage of the network.
function me_interface.getAvgPowerUsage()

	-- return number 
end

-- Get a list of tables representing the available CPUs in the network.
function me_interface.getCpus()

	-- return table 
end

-- Get a list of known item recipes. These can be used to issue crafting requests.
function me_interface.getCraftables(filter)
	-- filter:table

	-- return table 
end

-- Get a list of the stored fluids in the network.
function me_interface.getFluidsInNetwork()

	-- return table 
end

-- Get a list of the stored gases in the network.
function me_interface.getGasesInNetwork()

	-- return table 
end

-- Get the idle power usage of the network.
function me_interface.getIdlePowerUsage()

	-- return number 
end

-- Get the configuration of the interface.
function me_interface.getInterfaceConfiguration(slot)
	-- slot:number

	-- return table 
end

-- Get a list of the stored items in the network.
function me_interface.getItemsInNetwork(filter)
	-- filter:table

	-- return table 
end

-- Get the maximum stored power in the network.
function me_interface.getMaxStoredPower()

	-- return number 
end

-- Get the stored power in the network. 
function me_interface.getStoredPower()

	-- return number 
end

-- Configure the interface.
function me_interface.setInterfaceConfiguration(slot, database, entry, size)
	-- slot:number
	-- database:address
	-- entry:number
	-- size:number

	-- return boolean 
end

-- Store items in the network matching the specified filter in the database with the specified address.
function me_interface.store(filter, dbAddress, startSlot, count)
	-- filter:table
	-- dbAddress:string
	-- startSlot:number
	-- count:number

	-- return  Boolean 
end

return me_interface
