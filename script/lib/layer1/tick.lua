

local t = 0
local tick = {}
function events.world_tick()
    t = t + 1
end

function tick.gettick()
    return t
end

return tick
