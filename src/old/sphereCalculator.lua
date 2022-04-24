---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by SZS.
--- DateTime: 16.04.2022 21:12
---

local sphereCalculator = {}
sphereCalculator.sphere = { x = 0, y = 0, z = 0, radius = 0 }

sphereCalculator.sphereChunk = { lastSlice = nil }

function sphereCalculator:set(_x, _y, _z, radius, floatGridOffset)
    self.sphere.x = _x
    self.sphere.y = _y
    self.sphere.z = _z
    self.sphere.radius = radius
    self.sphere.radiusSqr = (radius - floatGridOffset) ^ 2

    for y = 0, 1 do
        self.sphereChunk[y] = {}
        for z = 0, self.sphere.radius do
            self.sphereChunk[y][z] = {}
        end
    end
end

function sphereCalculator:_cordMirroring(x, z)
    if x < 0 then
        x = math.abs(x) - 1
    end
    if z < 0 then
        z = math.abs(z) - 1
    end
    return x, z
end

function sphereCalculator:_castLocal(x, y, z)
    return x - self.sphere.x, y - self.sphere.y, z - self.sphere.z
end

function sphereCalculator:_calculateSphereChunkSurfaceX(sphereChunk)
    for y = 0, 1 do
        for z = self.sphere.radius, 0, -1 do
            for x = self.sphere.radius, 0, -1 do
                if sphereChunk[y][z][x] == 'S' then
                    break
                end
                if sphereChunk[y][z][x] == 'I' then
                    sphereChunk[y][z][x] = 'S'
                    break
                end
            end
        end
    end
end

function sphereCalculator:_calculateSphereChunkSurfaceZ(sphereChunk)
    for y = 0, 1 do
        for x = self.sphere.radius, 0, -1 do
            for z = self.sphere.radius, 0, -1 do
                if sphereChunk[y][z][x] == 'S' then
                    break
                end
                if sphereChunk[y][z][x] == 'I' then
                    sphereChunk[y][z][x] = 'S'
                    break
                end
            end
        end
    end
end

function sphereCalculator:_calculateSphereChunkSurfaceY(sphereChunk)
    for x = 0, self.sphere.radius do
        for z = 0, self.sphere.radius do
            for y = 1, 0, -1 do
                if sphereChunk[y][z][x] == 'S' then
                    break
                end
                if sphereChunk[y][z][x] == 'I' then
                    sphereChunk[y][z][x] = 'S'
                    break
                end
            end
        end
    end
end

function sphereCalculator:_calculateSphereChunk(_y)
    self.sphereChunk.lastSlice = _y
    for y = 0, 1 do
        for z = 0, self.sphere.radius do
            for x = 0, self.sphere.radius do
                self.sphereChunk[y][z][x] = x ^ 2 + (y + self.sphereChunk.lastSlice) ^ 2 + z ^ 2 < self.sphere.radiusSqr
                if self.sphereChunk[y][z][x] then
                    self.sphereChunk[y][z][x] = 'I'
                else
                    self.sphereChunk[y][z][x] = 'E'
                end
            end
        end
    end
    self:_calculateSphereChunkSurfaceX(self.sphereChunk)
    self:_calculateSphereChunkSurfaceZ(self.sphereChunk)
    self:_calculateSphereChunkSurfaceY(self.sphereChunk)
end

function sphereCalculator:_isCordValid(x, y, z)
    return x >= 0 and x <= self.sphere.radius
            and z >= 0 and z <= self.sphere.radius
            and y >= 0 and y <= self.sphere.radius
end

function sphereCalculator:getVoxel(x, y, z)
    x, y, z = self:_castLocal(x, y, z)
    x, z = self:_cordMirroring(x, z)
    if self:_isCordValid(x, y, z) then
        if y ~= self.sphereChunk.lastSlice then
            self:_calculateSphereChunk(y)
        end
        return self.sphereChunk[0][z][x]
    end
    return 'O'
end

return sphereCalculator