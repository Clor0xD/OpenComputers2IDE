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

--[[
    {0,1,1,0},
    {1,0,0,1},
    {1,0,0,1},
    {0,1,1,0}
]]
---@param robotExApi RobotExtendedApi
---@param position Position
function SimpleSliceBuilderBehavior:run(robotExApi, position)
    local slice = self.slice
    if not self.tempPos then
        self.tempPos = position:clone()
    else
        self.tempPos:copy(position)
    end   
    local column, lim, dir = 0, 0, 0
    local currentRow, currentColumn = slice.centerRow, slice.centerColumn

    if slice.isVertical then       
        for row = 2, #slice.blockMap - 1 do
            column, lim, dir = self:calcRowStartPoint(row, column)
            robotExApi:goTo(self.tempPos:shift(position.turn.left, currentColumn - column, currentRow - row, true),
                robotExApi.movePatternZXY, true, true, 100)
            column = self:buildRow(robotExApi, row, column, lim, dir)
            currentRow, currentColumn = row, column
            self.tempPos:copy(robotExApi.position)
            self.tempPos.r = position.r          
        end
    else
        self:error(" horizontal mode is not supported")
    end
end

function SimpleSliceBuilderBehavior:buildRow(robotExApi, row, _column, limit, dir)
    local stackIndex
    robotExApi:place(slice.stackList[slice.blockMap[row][_column]])
    for column = _column, limit, dir do
        robotExApi:around()
        stackIndex = slice.blockMap[row - 1][column]
        if stackIndex > 0 then
            robotExApi:placeUp(slice.stackList[stackIndex])
        end
        stackIndex = slice.blockMap[row + 1][column]
        if stackIndex > 0 then
            robotExApi:placeDown(slice.stackList[stackIndex])
        end
        stackIndex = slice.blockMap[row][column + 1]
        if stackIndex > 0 then
            robotExApi:place(slice.stackList[stackIndex])
            return column
        end
        robotExApi:forward(true, 100)
    end
end

function SimpleSliceBuilderBehavior:calcRowStartPoint(row, _column)
    local lastBlock, limit, dir = 0, 0, 0
    if _column < #self.slice.blockMap[row] / 2 then
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
