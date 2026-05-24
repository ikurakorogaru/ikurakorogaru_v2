local uib = {}
-- template
--[[
{
x=,
y=,
z=,
pitch=,
yaw=,
roll=,
w=,
h=,
stroke=,
light=,
col={
inner=,
outer=,
},
}
]]
function uib.newwindow(inputs)
    if inputs.col == nil then
        inputs.col = {
            ["inner"] = vectors.vec3(0.59375, 0.59375, 0.59375),
            ["outer"] = vectors.vec3(0.2578125, 0.2578125,
                0.2578125)
        }
    end
    local mywindow = {}
    local part = models.ui.window:newPart("window_" .. math.random(), "WORLD")
    part:setPivot(0, 0, 0)
    part:setRot(inputs.pitch, inputs.yaw, inputs.roll)
    part:setPos(inputs.x, inputs.y, inputs.z)
    mywindow[1] = part:newSprite("out")
    mywindow[2] = part:newSprite("in")

    for i = 1, 2 do
        mywindow[i]:setLight(inputs.light)
        mywindow[i]:setTexture(textures["ui.texs"])
        mywindow[i]:setDimensions(16, 16)
        mywindow[i]:setUVPixels(0, 0)
        mywindow[i]:setRegion(1, 1)
        if i == 1 then
            mywindow[i]:setColor(inputs.col.outer)
            mywindow[i]:setPos(inputs.w / 2 + inputs.stroke, inputs.h / 2 + inputs.stroke, 0.001)
            mywindow[i]:setSize(inputs.w + inputs.stroke * 2, inputs.h + inputs.stroke * 2)
        else
            mywindow[i]:setColor(inputs.col.inner)
            mywindow[i]:setPos(inputs.w / 2, inputs.h / 2, 0)
            mywindow[i]:setSize(inputs.w, inputs.h)
        end
    end
    return part
end

function uib.setwindow(part, inputs)
    if inputs.col == nil then
        inputs.col = {
            ["ins"] = vectors.vec3(0.59375, 0.59375, 0.59375),
            ["out"] = vectors.vec3(0.2578125, 0.2578125,
                0.2578125)
        }
    end
    local mywindow = {}
    part:setPivot(0, 0, 0)
    part:setRot(inputs.pitch, inputs.yaw, inputs.roll)
    part:setPos(inputs.x, inputs.y, inputs.z)
    mywindow[1] = part:getTask()["out"]
    mywindow[2] = part:getTask()["in"]
    for i = 1, 2 do
        mywindow[i]:setLight(inputs.light)
        mywindow[i]:setTexture(textures["ui.texs"])
        mywindow[i]:setDimensions(16, 16)
        mywindow[i]:setUVPixels(0, 0)
        mywindow[i]:setRegion(1, 1)
        if i == 1 then
            mywindow[i]:setColor(inputs.col.out)
            mywindow[i]:setPos(inputs.w / 2 + inputs.stroke, inputs.h / 2 + inputs.stroke, 0.01)
            mywindow[i]:setSize(inputs.w + inputs.stroke * 2, inputs.h + inputs.stroke * 2)
        else
            mywindow[i]:setColor(inputs.col.ins)
            mywindow[i]:setPos(inputs.w / 2, inputs.h / 2, 0)
            mywindow[i]:setSize(inputs.w, inputs.h)
        end
    end
    return part
end

return uib
