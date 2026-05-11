local uib = require("script.requires")["layer2"]["ui"]["border"]
local t = 0
local delt = 0
local par = {
    x = 0,
    y = 0,
    z = 0,
    pitch = 90,
    yaw = 0,
    roll = 0,
    w = 10,
    h = 10,
    stroke = 1,
    light = 15,
}
local output = uib.newwindow(par)
function events.post_render(delta, context, matrix)
    delt = t + delta
    local pos = player:getPos()
    par.yaw = delt
    par.x = pos.x * 16
    par.y = pos.y * 16 + 40
    par.z = pos.z * 16
    output = uib.setwindow(output, par)
end

function events.tick()
    t = t + 1
end
