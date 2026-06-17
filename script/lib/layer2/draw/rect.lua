local d = {}
-- template:
--[[
{
path=,
name=,
x=,
y=,
z=,
w=,
h=,
yaw=,
pitch=,
roll=,
col=,
light=,
}



]] --
local split = require("script.lib.layer1.utils.string").split
function d.newrect(inputs)
    local paths = split(inputs.path, ".")
    local nowpos = models
    for k, v in ipairs(paths) do
        nowpos = nowpos[v]
    end
    local part = nowpos:newPart(inputs.name, "WORLD")
    local mysprite = part:newSprite(inputs.name .. "_sprite")
    part:setPos(inputs.x, inputs.y, inputs.z)
    part:setRot(inputs.pitch, inputs.yaw, inputs.roll)
    mysprite:setTexture(textures["ui.texs"])
    mysprite:setDimensions(16, 16)
    mysprite:setUVPixels(0, 0)
    mysprite:setRegion(1, 1)
    mysprite:setColor(inputs.col.x, inputs.col.y, inputs.col.z)
    mysprite:setPos(inputs.w / 2, inputs.h / 2, 0)
    mysprite:setSize(inputs.w, inputs.h)
    mysprite:setLight(inputs.light)
    return part
end

return d
