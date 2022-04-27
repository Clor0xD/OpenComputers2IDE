--соглашение о именовании [ContainerName].."Handler" пример ChestHandler
--соглашение о пути lib/implementation/hendler/

local Class = require('libEx/Class')

---@class AContainerHandler : Class
local AContainerHandler = Class:extended({class = 'AbstractClass AContainerHandler'})

AContainerHandler.path = "libEx/implementation/handler/"
AContainerHandler.suffix = "Handler"

---@type fun():AContainerHandler
---@return AContainerHandler
function AContainerHandler:new()
    local instance = self.super:new()
    return self:extendedInstance(instance)
end

function AContainerHandler:suckFromStack(sampleStack, itemCount)
    
end

function AContainerHandler:suckFromSlot(slot, itemCount)
    
end

function AContainerHandler:dropFromContainerSlot(slot, count)
    self:noImplError()
end


return AContainerHandler