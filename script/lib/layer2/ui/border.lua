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
}
]]
function uib.newwindow(inputs)
    local mywindow = {}
    local part = models.ui.window:newPart("window_" .. math.random(), "WORLD")
    part:setPivot(0, 0, 0)
    part:setRot(inputs.pitch, inputs.yaw, inputs.roll)
    part:setPos(inputs.x, inputs.y, inputs.z)
    mywindow[1] = part:newSprite("out")
    mywindow[2] = part:newSprite("in")

    for i = 1, 2 do
        mywindow[i]:setTexture(textures["ui.texs"])
        mywindow[i]:setDimensions(16, 16)
        mywindow[i]:setUVPixels(i - 1, 0)
        mywindow[i]:setRegion(1, 1)
        mywindow[i]:setLight(inputs.light)
        if i == 1 then
            mywindow[i]:setPos(inputs.w / 2 + inputs.stroke, inputs.h / 2 + inputs.stroke, 0.01)
            mywindow[i]:setSize(inputs.w + inputs.stroke * 2, inputs.h + inputs.stroke * 2)
        else
            mywindow[i]:setPos(inputs.w / 2, inputs.h / 2, 0)
            mywindow[i]:setSize(inputs.w, inputs.h)
        end
    end
    return part
end

function uib.setwindow(part, inputs)
    local mywindow = {}
    part:setPivot(0, 0, 0)
    part:setRot(inputs.pitch, inputs.yaw, inputs.roll)
    part:setPos(inputs.x, inputs.y, inputs.z)
    mywindow[1] = part:getTask()["out"]
    mywindow[2] = part:getTask()["in"]
    for i = 1, 2 do
        mywindow[i]:setTexture(textures["ui.texs"])
        mywindow[i]:setDimensions(16, 16)
        mywindow[i]:setUVPixels(i - 1, 0)
        mywindow[i]:setRegion(1, 1)
        mywindow[i]:setLight(inputs.light)
        if i == 1 then
            mywindow[i]:setPos(inputs.w / 2 + inputs.stroke, inputs.h / 2 + inputs.stroke, 0.01)
            mywindow[i]:setSize(inputs.w + inputs.stroke * 2, inputs.h + inputs.stroke * 2)
        else
            mywindow[i]:setPos(inputs.w / 2, inputs.h / 2, 0)
            mywindow[i]:setSize(inputs.w, inputs.h)
        end
    end
    return part
end

return uib
