local AGeneralBehavior = require('libEx/abstract/AGeneralBehavior')

---@class SimpleBuilderBehavior : AGeneralBehavior
---@field public super AGeneralBehavior
---@field public sliceBuilder : ASliceBuilderBehavior
---@field private returnPosition Position
---@field private slicePositionList : Position[]
---@field parkingSlicePosition Position
---@field public blockList table<NativeStack|StackStorageData,number>@NativeStack, totalCount
local SimpleBuilderBehavior = AGeneralBehavior:extended({
    class = 'Class SimpleBuilderBehavior'
})

---@param sliceBuilder ASliceBuilderBehavior
---@return SimpleBuilderBehavior
function SimpleBuilderBehavior:new(initTable)
    local instance = self.super:new()
    return self:extendedInstance(instance):init(initTable)
end

---@class SimpleBuilderBehaviorInitTable
---@field sliceBuilder ASliceBuilderBehavior
---@field sliceOffsetMap Position[] @delta position to next slice position first element zero offset
---@field firstSlicePosition Position
---@field parkingSlicePosition Position
---@field blockList table<NativeStack|StackStorageData,number>@optional

---@param initTable SimpleBuilderBehaviorInitTable
---@return SimpleBuilderBehavior @self
function SimpleBuilderBehavior:init(initTable)
    self.sliceBuilder = initTable.sliceBuilder
    self.parkingSlicePosition = initTable.parkingSlicePosition
    self.returnPosition = initTable.firstSlicePosition
    self.slicePositionList = initTable.sliceOffsetMap
    self.slicePositionList[1]:add(initTable.firstSlicePosition)
    for i = 2, #self.slicePositionList do
        self.slicePositionList[i]:add(self.slicePositionList[i - 1])
    end
    self.blockList = initTable.blockList
    return self
end

function SimpleBuilderBehavior:calcBlockList(emptySlotCount)
    self.blockList = {}
    local blockStackCount = (self.robotExApi.inventorySize()-emptySlotCount) // #(self.sliceBuilder.slice.stackList)
    for index, stack in ipairs(self.sliceBuilder.slice.stackList) do
        if self.sliceBuilder.slice.isNotUniqueStack then
            stack.stock = 0
        end
        self.blockList[stack] = blockStackCount * stack.maxSize
    end
    return self
end

function SimpleBuilderBehavior:postInit()
    if not self.blockList then
        self:calcBlockList(0)
    end
    self.currentSlice = 1
    self.returnSlice = 1
end

---@return void @nil
function SimpleBuilderBehavior:run()
    self:postInit()
    ---@type SimpleSliceBuilderBehavior
    local sBuilder = self.sliceBuilder  
    self.robotExApi:goTo(self.parkingSlicePosition, self.robotExApi.movePatternZXY, false, true, 100)      
    for sliceIndex, position in ipairs(self.slicePositionList) do               
        self.robotExApi:goTo(position, self.robotExApi.movePatternZXY, true, true, 100)
        self.currentSlice = sliceIndex
        sBuilder:run(self.robotExApi, position) 
    end  
    self:gotoBaseStation() 
end

---@return void @nil
function SimpleBuilderBehavior:gotoBaseStation()
    self.returnSlice = self.currentSlice
    self.returnPosition:copy(self.robotExApi.position)
    for sliceIndex = self.currentSlice, 1, -1 do
        self.robotExApi:goTo(self.slicePositionList[sliceIndex], self.robotExApi.movePatternYZX, false, true, 100, true)
    end
    self.robotExApi:goTo(self.parkingSlicePosition, self.robotExApi.movePatternZXY, false, true, 100, true)
    self.robotExApi:goTo(self.robotExApi.baseStation.parkingPosition, self.robotExApi.movePatternZXY, false, true, 100,
        true)
end

---@return void @nil
function SimpleBuilderBehavior:gotoReturnPostion()
    self.robotExApi:goTo(self.parkingSlicePosition, self.robotExApi.movePatternZXY, false, true, 100, true)
    for sliceIndex = 1, self.returnSlice do
        self.robotExApi:goTo(self.slicePositionList[sliceIndex], self.robotExApi.movePatternZXY, false, true, 100)
    end
    self.robotExApi:goTo(self.returnPosition, self.robotExApi.movePatternZXY, true, true, 100)
end

---@return boolean @status
function SimpleBuilderBehavior:fullService(robotExApi, blockList)
    self:gotoBaseStation()
    local result = self:getBaseStationHandler(self.robotExApi.baseStation):fullService(self.robotExApi, self.blockList)
    self:gotoReturnPostion()
    return result
end

---@return boolean @status
function SimpleBuilderBehavior:toolService(robotExApi)
    return self:fullService(robotExApi)    
end

---@return boolean @status
function SimpleBuilderBehavior:inventoryRefill(robotExApi, blockList)
    return self:fullService(blockList)   
end

---@return boolean @status
function SimpleBuilderBehavior:recharge(robotExApi)
    return self:fullService(robotExApi)    
end

return SimpleBuilderBehavior
