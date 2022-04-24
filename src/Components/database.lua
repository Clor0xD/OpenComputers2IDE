local database = {}

-- Clears the specified slot. Returns true if there was something in the slot before.
function database.clear(slot)
	-- slot:number

	-- return boolean 
end

-- Copies the data stored in this database to another database with the specified address.
function database.clone(address)
	-- address:string

	-- return number 
end

-- Computes a hash value for the item stack in the specified slot.
function database.computeHash(slot)
	-- slot:number

	-- return string 
end

-- Copies an entry to another slot, optionally to another database. Returns true if something was overwritten.
function database.copy(fromSlot, toSlot, address)
	-- fromSlot:number
	-- toSlot:number
	-- address:string

	-- return boolean 
end

-- Get the representation of the item stack stored in the specified slot.
function database.get(slot)
	-- slot:number

	-- return table 
end

-- Get the index of an item stack with the specified hash. Returns a negative value if no such stack was found.
function database.indexOf(hash)
	-- hash:string

	-- return number 
end

return database
