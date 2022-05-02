---@class ContainerItemFilter
---@field public type FilterType
---@field public filterList string[] @stack.label 
local ContainerItemFilter

---@class NativeStack
---@field public damage number
---@field public maxSize number
---@field public size number
---@field public name string
---@field public maxDamage number
---@field public label string
---@field public hasTag boolean
local NativeStack

---@class GTToolStack
---@field public transferLimit number
---@field public damage number
---@field public canProvideEnergy boolean
---@field public size number
---@field public tier number
---@field public hasTag boolean
---@field public maxDamage number
---@field public maxSize number
---@field public name string
---@field public maxCharge number
---@field public charge number
---@field public label string
local GTToolStack

---@class Slice
---@field public stackList NativeStack[] @NativeStack.label [0] - void
---@field public blockMap table @2D array of indexes to stackList
local Slice = {
    stackList = {        
        [blockIndex] = "label"
    },
    blockMap = {
        [row] = {
            [column] = blockIndex
        }
    }
}