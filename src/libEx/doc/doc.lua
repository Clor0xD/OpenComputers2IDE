---@class ContainerItemFilter
local ContainerItemFilter

function ContainerItemFilter:doc()
    ---@type FilterType   
    self.type = nil
    ---@type string[] @stack.label
    ---@see NativeStack#label 
    self.filterList = nil
end

---@class NativeStack
local NativeStack 

function NativeStack:doc()
---@field public damage number
self.damage = nll

---@field public maxSize number
self.maxSize = nll

---@field public size number
self.size = nll

---@field public name string
self.name = nll

---@field public maxDamage number
self.maxDamage = nll

---@field public label string
self.label = nll

---@field public hasTag boolean
self.hasTag = nll
end

---@class GTToolStack
local GTToolStack

function GTToolStack:doc()
---@field public transferLimit number
self.transferLimit = nil
---@field public damage number
self.damage = nil
---@field public canProvideEnergy boolean
self.canProvideEnergy = nil
---@field public size number
self.size = nil
---@field public tier number
self.tier = nil
---@field public hasTag boolean
self.hasTag = nil
---@field public maxDamage number
self.maxDamage = nil
---@field public maxSize number
self.maxSize = nil
---@field public name string
self.name = nil
---@field public maxCharge number
self.maxCharge = nil
---@field public charge number
self.charge = nil
---@field public label string
self.label = nil
end