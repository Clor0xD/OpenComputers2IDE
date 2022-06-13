function init()
    local function SimpleBaseStationFabric(stationParkingPosition, x, y, z) -- xyz containerParkingPositionOffset
        local MeInterfaceContainer = require("libEx/implementation/container/MeInterfaceContainer")
        local ChargeStationContainer = require("libEx/implementation/container/ChargeStationContainer")
        local SimpleBaseStation = require("libEx/implementation/baseStatinon/SimpleBaseStation")

        ---@type AContainerInitTable
        local containerInitTable = {}
        containerInitTable.usage = MeInterfaceContainer.usageType.combo
        containerInitTable.parkingPosition = stationParkingPosition:clone():add(x, y, z)
        containerInitTable.position = containerInitTable.parkingPosition:clone():add(0, -1, 0)

        ---@type ABaseStationInitTable
        local baseInitTable = {}
        baseInitTable.parkingPosition = stationParkingPosition
        baseInitTable.chargeStation = ChargeStationContainer:new(containerInitTable)

        containerInitTable.position = containerInitTable.parkingPosition:clone():add(0, 1, 0)

        baseInitTable.containerList = {MeInterfaceContainer:new(containerInitTable)}
        return SimpleBaseStation:new(baseInitTable)
    end

    ---@param slice Slice
    local function SimpleBuilderBehaviorFabric(slice, firstSlicePosition, sliceOffsetMap)
        local SimpleBuilderBehavior = require("libEx/implementation/behavior/SimpleBuilderBehavior")
        local SimpleSliceBuilderBehavior = require("libEx/implementation/behavior/SimpleSliceBuilderBehavior")

        ---@type SimpleBuilderBehaviorInitTable
        local InitTable = {}
        InitTable.sliceBuilder = SimpleSliceBuilderBehavior:new(slice)
        InitTable.firstSlicePosition = firstSlicePosition
        InitTable.parkingSlicePosition = firstSlicePosition:clone():stepBack()
        InitTable.sliceOffsetMap = sliceOffsetMap
        InitTable.blockList = nil
        return SimpleBuilderBehavior:new(InitTable)
    end

    local function RobotExApiFabric(startPosition, inventoryManager, baseStation, generalBehavior)
        local RobotExApi = require("libEx/RobotExtendedApi")
        ---@type RobotExApiInitTable
        local initTable = {}
        initTable.baseStation = baseStation
        initTable.generalBehavior = generalBehavior
        initTable.inventoryManager = inventoryManager
        initTable.startPosition = startPosition
        return RobotExApi:new(initTable)
    end

    local ExtendedInventoryManager = require("libEx/implementation/inventoryManager/ExtendedInventoryManager")
    local slice = require("libEx/slice/RailwayTunnel")
    local Position = require("libEx/Position")
    local startPosition = Position:new()
    local baseStationParkingPosition = Position:new(0, 0, -1, 0):add(startPosition) -- севернее на блок

    sliceOffsetList = {}
    local h = 0
    for i =1, 18 do
        if i%6 == 0 then
            h = h + 1
        end
        sliceOffsetList[i] = Position:new(0,h,0,0)
    end

    return RobotExApiFabric(startPosition, ExtendedInventoryManager:new(),
        SimpleBaseStationFabric(baseStationParkingPosition, 0, 0, 1),
        SimpleBuilderBehaviorFabric(slice, Position:new(0, #slice.blockMap - slice.centerRow, -2, 0), sliceOffsetList))
end

---@param robot RobotExtendedApi
function run(robot)   
    -- robot:goTo(Position:new(0, 0, -2, 0), robot.movePatternZXY, true)
    -- robot:goTo(Position:new(0, 2, -2, 0), robot.movePatternZXY, true)
    -- robot:goTo(Position:new(0, 0, -2, 0), robot.movePatternZXY, true)
    -- robot:goTo(Position:new(0, 0, 0, 0), robot.movePatternZXY, true)    
    robot.generalBehavior:run()    
    --robot:goTo(Position:new(0, 0, -2, 0), robot.movePatternZXY, true)
    --robot.generalBehavior:fullService(robot)
    --robot:goTo(Position:new(0, 0, 0, 0), robot.movePatternZXY, true)
    return true    
end

---@param robot RobotExtendedApi
function home(robot)
    robot.generalBehavior:gotoBaseStation()
    robot:goTo(robot.baseStation.chargeStation.parkingPosition, robot.movePatternZXY, true, true, 100, true)
    return true
end

local file = io.open("log.log", "w")
local result, error = xpcall(init, debug.traceback)
file:write("Init : "..tostring(result) .. "\n" .. tostring(error)):close()
if not result then    
    os.exit()
end
local robot = error

file = io.open("log.log", "a")
result, error = xpcall(run, debug.traceback, robot)
file:write("\n\nRun : "..tostring(result) .. "\n" .. tostring(error))

result, error = xpcall(home, debug.traceback, robot)
file:write("\n\nGo home : "..tostring(result) .. "\n" .. tostring(error)):close()

