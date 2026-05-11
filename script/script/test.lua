local uib = require("script.requires")["layer2"]["ui"]["border"]
local t = 0
local par = {
    x = 0,
    y = 0,
    z = 0,
    w = 10,
    h = 10,
    stroke = 1,
    yaw = 45,
}
local output = uib.newwindow(par)
function events.post_render(delta, context, matrix)
    local pos = player:getPos()
    par.yaw = t
    par.x = pos.x * 16 + t / 20 % 40 - 20
    par.y = pos.y * 16 + 32
    par.z = pos.z * 16 + 32
    output = uib.setwindow(output, par)
    t = t + 1
end
