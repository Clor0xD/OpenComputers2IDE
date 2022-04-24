---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by User.
--- DateTime: 20.04.2022 20:57
---

local Class = require('lib/Class')
local Sphere = require("lib/Sphere")
local event = require("event")
local keyboard = require("keyboard")
local term = require('term')

local sphereInitTable = {}
sphereInitTable.radius = 28
sphereInitTable.gridOffsetX = 0.5
sphereInitTable.gridOffsetZ = 0.5
sphereInitTable.radiusOffset = -0.08

local sphere = Sphere:new(sphereInitTable)

function renderSlice(y)
    term.clear()
    local n = 0
    for z = sphere.z - sphere.radius - 1, sphere.z + sphere.radius do
        n = n + 1
        if n >= 49 then
            break
        end
        for x = sphere.x - sphere.radius - 1, sphere.x + sphere.radius do
            local temp = sphere:getVoxelGlobal(x, y, z)
            if x == sphere.x and z == sphere.z then
                term.write('X ')
            elseif temp == 'E' then
                term.write('..')
            elseif temp == nil then
                term.write("''")
            elseif temp == 'S' then
                term.write('S ')
            elseif temp == 'I' then
                lx, _, lz = sphere:coordGlobalToLocal(x, y, z)
                if lx < 0 then
                    term.write('n')
                else
                    term.write('p')
                end
                if lz < 0 then
                    term.write('N')
                else
                    term.write('P')
                end
                --term.write('* ')

            end
        end
        term.write('\n')
    end
    term.write('slice : ' .. y - sphere.y..' rOff '..sphere.radiusOffset)
end

local slice, mode = sphere.y, 'select';
function keyDownHandle(name, kbAddr, charCode, keyCode, user)
    if name ~= 'key_down' then
        return
    end
    if keyCode == keyboard.keys.up then
        if slice < sphere.radius + sphere.y then
            slice = slice + 1
            renderSlice(slice)
        end
    elseif keyCode == keyboard.keys.down then
        if slice > sphere.y - 1 - sphere.radius then
            slice = slice - 1
            renderSlice(slice)
        end
    elseif keyCode == keyboard.keys.space then
        mode = 'readOffset'
    end
end

renderSlice(slice)
local temp
while true do
    if mode == 'readOffset' then
        term.write(' enter rOff : ')
        temp = tonumber(term.read())
        mode = 'select'
        if temp then
            sphere.radiusOffset = temp
            renderSlice(slice)
        end
    end
    keyDownHandle(event.pull(0.05))
end