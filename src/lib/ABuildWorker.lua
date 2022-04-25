local IRunable = require("lib/IRunable")
local ABuildWorker = IRunable:extended({class = "AbstractClass ABuildWorker"})


function ABuildWorker:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

function ABuildWorker:init(initTable)
    self.shape = initTable.shape
    self.sliceBuilder =  initTable.sliceBuilder
    self.Robot = initTable.Robot   
    self.baseStation = init.baseStation
    return self
end   

return ABuildWorker