local ASliceBuilderBehavior = require('libEx/abstract/ASliceBuilderBehavior')

---@class SimpleSliceBuilderBehavior : ASliceBuilderBehavior @build a convex surface on a strictly rectangular blockMap 
---@field public super ASliceBuilderBehavior
---@field private tempPos Position
local SimpleSliceBuilderBehavior = ASliceBuilderBehavior:extended({
    class = 'Class SimpleSliceBuilderBehavior'
})

---@param slice Slice @strictly rectangular blockMap 
---@return SimpleSliceBuilderBehavior
function SimpleSliceBuilderBehavior:new(slice)
    local instance = self.super:new(slice)    
    return self:extendedInstance(instance)
end

---@param robotExApi RobotExtendedApi
---@param position Position @const
function SimpleSliceBuilderBehavior:run(robotExApi, position)       
    if not self.tempPos then
        self.tempPos = position:clone()
    end   
    local column, lim, dir
    local currentRow, currentColumn = self.slice.centerRow, self.slice.centerColumn
    if self.slice.isVertical then       
        for row = 2, #self.slice.blockMap - 1 do
            column, lim, dir = self:calcRowStartPoint(row, currentColumn)
            self.tempPos:copy(robotExApi.position)
            self.tempPos.r = position.r 
            robotExApi:goTo(self.tempPos:shift(position.turn.left, currentColumn - column, currentRow - row),
                robotExApi.movePatternYZX, false, true, 100)
            if dir == 1 then
                robotExApi:rotateTo(position.r + position.turn.left)
            else
                robotExApi:rotateTo(position.r + position.turn.right)
            end
            column = self:buildRow(robotExApi, row, column, lim, dir)
            currentRow, currentColumn = row, column                                       
        end        
    else
        self:error(" horizontal mode is not supported")
    end
    robotExApi:goTo(position, robotExApi.movePatternZXY, true, true, 100)
end

function SimpleSliceBuilderBehavior:buildRow(robotExApi, row, _column, limit, dir)
    local stackIndex    
    robotExApi:place(self.slice.stackList[self.slice.blockMap[row][_column - dir]])
    robotExApi:around()
    for column = _column, limit, dir do       
        stackIndex = self.slice.blockMap[row - 1][column]
        if stackIndex > 0 then
            robotExApi:placeUp(self.slice.stackList[stackIndex])
        end
        stackIndex = self.slice.blockMap[row + 1][column]
        if stackIndex > 0 then
            robotExApi:placeDown(self.slice.stackList[stackIndex])
        end
        stackIndex = self.slice.blockMap[row][column + dir]
        if stackIndex > 0 then
            robotExApi:place(self.slice.stackList[stackIndex])
            return column
        end
        robotExApi:forward(true, 100)
    end
end

function SimpleSliceBuilderBehavior:calcRowStartPoint(row, _column)
    local lastBlock, limit, dir = 0, 0, 0
    if _column <= #self.slice.blockMap[row] / 2 then
        _column, limit, dir = 1, #self.slice.blockMap[row], 1
    else
        limit, _column, dir = 1, #self.slice.blockMap[row], -1
    end
    for column = _column, limit, dir do
        if lastBlock > 0 and self.slice.blockMap[row][column] == 0 then
            return column, limit, dir
        end
        lastBlock = self.slice.blockMap[row][column]
    end
    self:error("no calc row start point")
end

--[[
function SimpleSliceBuilderBehavior:calcStartPoint()
    local lastBlock = 0
    for row = 2, #self.slice.blockMap - 1 do
        lastBlock = 0
        for column = 1, #self.slice.blockMap[row]-1 do
            if lastBlock > 0 and self.slice.blockMap[row][column] == 0 then
                return row, column, #self.slice.blockMap[row]-1, 1
            end
            lastBlock = self.slice.blockMap[row][column]
        end
    end
    self:error(" incorrect Slice")
end
]]

return SimpleSliceBuilderBehavior
