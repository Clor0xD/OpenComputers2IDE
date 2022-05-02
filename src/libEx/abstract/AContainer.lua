-- соглашение о именовании [ContainerName].."Container" пример ChestContainer
-- соглашение о пути lib/implementation/container/
local Class = require('libEx/Class')
local sides = require("sides")

---@class AContainer : Class
---@field public usage UsageType
---@field public inputItemFilter ContainerItemFilter
---@field public outputItemFilter ContainerItemFilter
---@field public position Position
---@field public parkingPosition Position
---@field public facing Sides
local AContainer = Class:extended({
    class = 'AbstractClass AContainer'
})

AContainer.path = "libEx/implementation/container/"
AContainer.suffix = "Container"

---@class UsageType
---@field public usageType UsageType
AContainer.usageType = {
    import = 'in',
    export = 'out',
    combo = 'combo'
}

---@class UsageTypeMatch
---@field public UsageTypeMatch UsageTypeMatch
AContainer.usageTypeMatch = {
    import = 'in',
    export = 'out'
}

---@class FilterType
---@field public filterType FilterType
AContainer.filterType = {
    whiteList = "white",
    blackList = "black"
}

---@class AContainerInitTable
---@field public usage UsageType
---@field public inputItemFilter ContainerItemFilter
---@field public outputItemFilter ContainerItemFilter
---@field public position Position
---@field public parkingPosition Position

---@param initTable AContainerInitTable
---@return AContainer
function AContainer:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

---@param initTable AContainerInitTable
---@return AContainer
function AContainer:init(initTable)
    local error = ":init(initTable) initTable."   
    self.usage = self:assertEnum(initTable.usage, self.usageType, error .. ".usage)")  
    self.inputItemFilter = self:assertFilter(initTable.inputItemFilter, error .. ".inputItemFilter)") 
    self.outputItemFilter = self:assertFilter(initTable.outputItemFilter, error .. ".outputItemFilter)") 
    self.position = self:assert(initTable.position, error .. ".position)") 
    self.parkingPosition = self:assert(initTable.parkingPosition, error .. ".parkingPosition)")    
    self.parkingPosition.r = self:calcParkingGlobalRotation(self.parkingPosition, self.position)  
    self.facing = self:getFacing(self.parkingPosition, self.position)
    return self
end

---@class Facing
AContainer.facingEnum = {
    bottom = 0,
    top = 1,
    front = 3
}

---@type fun(globalRotation:Sides):Facing
function AContainer:getFacing(globalRotation)
    if self.facing then
        return self.facing
    end
    local _,facing = self.parkingPosition:getAdjacentSide(self.position)
    if facing > 1 then
        facing = sides.forward
    end
    return facing
end

---@type fun(parkingPosition:Position, position:Position):PositionSide
function AContainer:calcParkingGlobalRotation(parkingPosition, position)
    local status, sides = parkingPosition:getAdjacentSide(position)
    self:assert(status, ":calcParkingGlobalRotation(parkingPosition, position) incorrect position pair not adjacent")
    return position.sideBySides[sides]
end

---@type fun(filter:ContainerItemFilter, stackSamle:NativeStack):boolean
function AContainer:filterMatch(filter, stackSample)
    if not filter then
        return true
    end
    local complianceResult = false
    if filter.type == self.filterType.whiteList then
        complianceResult = true
    end
    for _, stackLabel in ipairs(filter.fliterList) do
        if (stackLabel == stackSample) then
            return complianceResult
        end
    end
    return not complianceResult
end

---@type fun(usageType:UsageTypeMatch, stackSamle:NativeStack):boolean
function AContainer:filter(usageType, stackSample)
    if self.usage == self.usageType.combo or self.usage == usageType then
        if not stackSample then
            return true
        end
        if usageType == self.usageType.import then
            return self:filterMatch(self.inputItemFilter, stackSample)
        else
            return self:filterMatch(self.outputItemFilter, stackSample)
        end
    end
end

---@protected
function AContainer:assertFilter(filter, message)
    if not filter then
        return
    end
    self:assrtEnum(filter.type, self.filterType, message .. " incorect type")
    if not filter.filterList then
        self:error(message .. " filterList is nil")
    end
end

return AContainer
