local Class = require('libEx/Class')

---@class ASliceBuilderBehavior : Class
---@field public super Class
---@field public slice Slice
local ASliceBuilderBehavior = Class:extended({class = 'AbstractClass ASliceBuilderBehavior'})

---@return ASliceBuilderBehavior
---@param slice Slice
function ASliceBuilderBehavior:new(slice)
    local instance = self.super:new()
    return self:extendedInstance(instance):setSlice(slice)
end

---@return ASliceBuilderBehavior
---@param slice Slice
function ASliceBuilderBehavior:setSlice(slice)
    self.slice = slice
    return self
end

return ASliceBuilderBehavior