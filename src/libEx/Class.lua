--
-- Created by Clor#D on 17.05.2020.
-- ©SofaSolt, 2020
--

---@class Class
---@field public class string
---@field public super Class
---@field public isInstance boolean
---@field public clazz Class @ is not instanse class
local Class

if Class then
    return Class
end

Class = {}
Class.class = "Class Class"
Class.isInstance = false
Class.super = Class
Class.clazz = Class

function Class:tostring()
    return tostring(self) .. " " .. self.class
end

function Class:extended (child) -- child = {}
    -- наследование статичестой части таблица Class, child.super доступ к статической таблице родителя
    child.super = self    
    setmetatable(child, { __index = self, isInstance = false})
    child.clazz = child
    return child
end

---@class Interface
---@field public class string

---@param ... Interface
function Class:implements(...)
     ---@type Interface[]   
    local interfaceList = table.pack(...)
    for _,interface in ipairs(interfaceList) do       
        interface.super = self.super        
        setmetatable(interface, { __index = self.super, isInstance = false})

        self.super = interface
        setmetatable(self, { __index = interface, isInstance = false})
    end
    return self
end

function Class:extendedInstance(instance)
    -- наследование экземпляра таблица instance
    setmetatable(instance, self.clazz)
    self.clazz.__index = self.clazz    
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

function Class:noImplIntefaceError(funcName, interfaceName)
    if not funcName then
        funcName = 'unknownIntefaceFunc'
    end
    error(self:tostring() .. ':' .. funcName .. ' no implementation '..interfaceName..":"..funcName)
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

function Class:assertEnum(param, enum, message)
   for _,element in pairs(enum) do
        if param == element then
            return param
        end
   end
   self:error(message.." param: "..tostring(param).." not listed")
end

function Class:error(message)
    error(self:tostring()..message)
end

function Class.nop()
    
end

function Class:getClassName()
    local _, name = string.gmatch(self.class, "([%a%d].+)%s(.+)")()
    return name
end

function Class:getClassLevel()
    local type = string.gmatch(self.class, "([%a%d].+)%s(.+)")()
    return type
end

function Class:assertInstance(message)
    if self.isInstance then
        return true
    end
    self:error(message)
end

function Class:assertSuperParentClass(param, sampleClass, message)
    ---@type Class
    local temp = param
    while temp.class ~= Class.class do
        if temp.class == sampleClass then
            return param
        end
        temp = temp.super
    end
    self:error(message.." "..param.class.." not extended "..sampleClass)
end


---@param fieldName string
---@param fileldValue any
function Class:createFieldIfMissing(fieldName, fileldValue)
    if self[fieldName] == nil then
        self[fieldName] = fileldValue
    end
end

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
