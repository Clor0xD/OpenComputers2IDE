---@class IRunable
local IRunable

IRunable = {class = "Interface IRunable"}

function IRunable:run(...) 
    self:noImplIntefaceError("run(...)", IRunable:getClassName())
end

return IRunable