local ASliceBuilderBehavior = require('libEx/abstract/ASliceBuilderBehavior')

---@class SimpleSliceBuilderBehavior : ASliceBuilderBehavior
---@field public super ASliceBuilderBehavior
local SimpleSliceBuilderBehavior = ASliceBuilderBehavior:extended({class = 'Class SimpleSliceBuilderBehavior'})

---@return SimpleSliceBuilderBehavior
function SimpleSliceBuilderBehavior:new(slice)
    local instance = self.super:new(slice)
    return self:extendedInstance(instance)
end

return SimpleSliceBuilderBehavior