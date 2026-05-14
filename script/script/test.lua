local newborder = require("script.lib.layer3.ui.border").newwindow
local setborder = require("script.lib.layer3.ui.border").setwindow
local testborder = nil
local settings = {
    x = 0,
    y = 0,
    z = 0,
    pitch = 0,
    yaw = 0,
    roll = 0,
    w = 10,
    h = 10,
    stroke = 1,
    light = 15,
    -- col = { ["ins"] = vectors.vec3(0, 0, 1), ["out"] = vectors.vec3(1, 1, 1) },
}
function events.entity_init()
    silly:setFly(true)
end

function events.tick()
    if testborder == nil then
        testborder = newborder(settings)
    end
    local pos = player:getPos()
    settings.x = pos.x * 16
    settings.y = pos.y * 16 + 24
    settings.z = pos.z * 16 + 32
    testborder = setborder(testborder, settings)
end
