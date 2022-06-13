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

---@class StackStorageData
---@field public stock number
---@field public firstSlot number
---@field public lastSlot number

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

---@alias ExtendedNativeStack NativeStack | StackStorageData

---@class Slice
---@field public stackList ExtendedNativeStack[] @NativeStack.label [0] - void
---@field public blockMap table @2D array of indexes to stackList
---@field public isVertical boolean
---@field public centerRow number
---@field public centerColumn number
local Slice = {      
    stackList = {            
        [blockIndex] = nil
    },
    blockMap = {
        [row] = {
            [column] = blockIndex
        }
    },    
    isNotUniqueStack = nil,   
    centerRow = nil,
    centerColumn = nil,
    isVertical = nil
}