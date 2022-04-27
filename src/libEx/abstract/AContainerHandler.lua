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

---@type fun(sampleStack:NativeStack, itemCount:number):boolean
function AContainerHandler:pullToStack(sampleStack, itemCount)
    self:noImplError()
end

---@type fun(slo:number, itemCount:number):boolean
function AContainerHandler:pullToSlot(slot, itemCount)
    self:noImplError()
end

---@type fun(slo:number, itemCount:number):boolean, string @status, error
function AContainerHandler:pushToContainerSlot(slot, itemCount)
    self:noImplError()
end


return AContainerHandler