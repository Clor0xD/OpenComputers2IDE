-- соглашение о именовании [ContainerName].."Container" пример ChestContainer
-- соглашение о пути lib/implementation/container/
local Class = require('libEx/Class')

---@class AContainer : Class
local AContainer = Class:extended({
    class = 'AbstractClass AContainer'
})

AContainer.path = "libEx/implementation/container/"
AContainer.suffix = "Container"

---@field public usageType table
AContainer.usageType = {
    import = 'in',
    export = 'out',
    combo = 'combo'
}

---@field public filterType table
AContainer.filterType = {
    whiteList = "white",
    blackList = "black"
}

function AContainer:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

function AContainer:assertFilter(filter, message)
    if not filter then
        return
    end
    self:assrtEnum(filter.type, self.filterType, message .. " incorect type")
    if not filter.filterList then
        self:error(message .. " filterList is nil")
    end
end

function AContainer:init(initTable)
    self.usage = self:assertEnum(initTable.usage, self.usageType, ":init(initTable.usage)")
    self.inputItemFilter = self:assertFilter(initTable.inputItemFilter, ":init(initTable.inputItemFilter)") -- table {type = 'white/black', filterList = {stack.label(name item in NEI),...}}  
    self.outputItemFilter = self:assertFilter(initTable.outputItemFilter, ":init(initTable.outputItemFilter)")
    self.position = initTable.position
    self.parkingPosition = initTable.parkingPosition
    return self
end

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

return AContainer
