--
-- Created by Clor#D on 17.05.2020.
-- ©SofaSolt, 2020
--

local Class

if Class then
    return Class
end

Class = {}
Class.class = "Class Class"

function Class:tostring()
    return tostring(self) .. " " .. self.class
end

--function Class:call(...)
--    print(self:tostring().." call() no implemented")
--end

function Class:extended (child) -- child = {}
    -- наследование статичестой части таблица Class, child.super доступ к статической таблице родителя
    child.super = self
    setmetatable(child, { __index = self, isInstance = false})
    return child
end

function Class:extendedInstance(instance)
    -- наследование экземпляра таблица instance
    setmetatable(instance, self)
    self.__index = self
    --self.__call = self.call
    return instance
end

function Class:new()
    local instance = {isInstance = true}
    return self:extendedInstance(instance)
end

function Class:noImplError(funcName)
    if not funcName then
        funcName = 'unknownFunc'
    end
    error(self:tostring() .. ':' .. funcName .. ' no implementation')
end

function Class:assert(param, message)
    if not message then
        message = 'assert unknown param'
    end
    return assert(param, self:tostring() .. message)
end

function Class:assertNumberSetDefault(number, default, message)-- number = '100'
    if not message then
        message = 'assert unknown param'
    end
    if number == nil then
        if tonumber(default) then
            number = default
        else
            error(self:tostring() .. message .. " is nil")
        end
    end
    return assert(tonumber(number), self:tostring() .. message .. " not number")
end

function Class:assertNumber(number, message)
    return self:assertNumberSetDefault(number, nil, message)
end

function Class:error(message)
    error(self:tostring()..message)
end

function Class:nop()
    
end
--setmetatable(Class, {__call = Class.call})

return Class

--[[ Using
Class = require("/oop/Class")

local Implementation

if Implementation then
    return Implementation
end

Implementation = Class:extended({})-- "наследования" класса, по сути соеденение статических таблиц в иерархию наследования
Implementation.class = "Implementation"
function Implementation:toString()
    return self.class
end

function Implementation:new(stringParent, stringChildren)
    local instance = self.super:new(stringParent) -- конструктор предка
    self.stringC = stringChildren
    return self:extendedInstance(instance) -- "наследования" экземпляра, по сути соеденение таблиц экземляра в иерархию наследования
end

return Implementation
]]
