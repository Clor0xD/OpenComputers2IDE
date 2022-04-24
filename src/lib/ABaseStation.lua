local Class = require("lib/Class")
local ABaseStation = IRunable:extended({class = "AbstractClass BuildWorker"})
local Robot = require("lib/Robot")


function ABuildWorker:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

function ABuildWorker:init(initTable)
    self.shape = initTable.shape
    self.sliceBuilder =  initTable.sliceBuilder
    return self
end   