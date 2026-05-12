local uib = require("script.requires")["layer2"]["ui"]["border"]
local t = 0
local delt = 0
local pos = nil
local par = {
    x = 0,
    y = 0.02,
    z = 0,
    pitch = 90,
    yaw = 0,
    roll = 0,
    w = 15,
    h = 15,
    stroke = 1,
    light = 15,
}
local nowchange = false
local bordernow = 1
local borders = {}
for i = 1, 21 do
    borders[i] = uib.newwindow(par)
end
function events.post_render(delta, context, matrix)
    delt = t + delta
    if player:isOnGround() and not nowchange then
        par.x = pos.x * 16
        par.y = pos.y * 16 + 0.02
        par.z = pos.z * 16
        par.yaw = delt
        par.roll = delt
        borders[bordernow] = uib.setwindow(borders[bordernow], par)
        nowchange = true
    end
end

function events.tick()
    if player:isOnGround() then
        bordernow = bordernow + 1
        if bordernow > 21 then
            bordernow = 1
        end
        nowchange = false
    end
    pos = player:getPos()
    t = t + 1
end
