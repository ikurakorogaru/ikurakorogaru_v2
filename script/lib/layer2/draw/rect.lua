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
pitch=,
yaw=,
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
        if nowpos[v] == nil then
            nowpos:newPart(v)
        end
        nowpos = nowpos[v]
    end
    local positionPart = nowpos:newPart(inputs.name, "WORLD")
    local rotationPart = positionPart:newPart(inputs.name .. "_rotation")
    local mysprite = rotationPart:newSprite(inputs.name .. "_sprite")

    positionPart:setPos(inputs.x, inputs.y, inputs.z)
    rotationPart:setRot(inputs.pitch, inputs.yaw, inputs.roll)
    mysprite:setPos(inputs.w / 2, inputs.h / 2, 0)
    mysprite:setTexture(textures["ui.texs"])
    mysprite:setDimensions(16, 16)
    mysprite:setUVPixels(0, 0)
    mysprite:setRegion(1, 1)
    mysprite:setColor(inputs.col.x, inputs.col.y, inputs.col.z)
    mysprite:setSize(inputs.w, inputs.h)
    mysprite:setLight(inputs.light)
    return { positionPart = positionPart, rotationPart = rotationPart, sprite = mysprite }
end

return d
