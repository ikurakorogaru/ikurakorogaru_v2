--[[
{
x=,
y=,
z=,
width=,
height=,
pitch=,
yaw=,
roll=,
path=,
name=,
}
]] --
local hit = require("script.lib.layer1.hit")
local errorhandler = require("script.lib.layer3.errorhandler")
local rect = require("script.lib.layer2.draw.rect")
local split = require("script.lib.layer1.utils.string")
local utils = {}
utils.other = require("script.lib.layer1.utils.other")
utils.table = require("script.lib.layer1.utils.table")
local w = {}
function w.window(args)
    local windowpart = models
    local datas = {}
    datas.name = args.name
    datas.pos = vec(args.x, args.y, args.z)
    datas.rot = vec(args.pitch, args.yaw, args.roll)
    datas.size = vec(args.width, args.height)
    datas.rawpath = args.path
    datas.removed = false
    for k, v in ipairs(split.split(datas.rawpath, ".")) do
        if windowpart[v] == nil then
            windowpart = windowpart:addPart(v)
        else
            windowpart = windowpart[v]
        end
    end
    datas.path = windowpart
    local positionPart = datas.path:newPart(args.name, "WORLD")
    local rotationPart = positionPart:newPart(args.name .. "_rotation")
    local moveOrigin = rotationPart:newPart(args.name .. "_moveorigin")
    datas.positionPart = positionPart
    datas.rotationPart = rotationPart
    datas.moveOrigin = moveOrigin
    datas.defrectargs = {
        path = datas.moveOrigin,
        name = datas.name,
        x = datas.size.x / 2,
        y = datas.size.y / 2,
        z = 0,
        w = datas.size.x,
        h = datas.size.y,
        pitch = 0,
        yaw = 0,
        roll = 0,
        col = vec(0.85, 0.85, 0.85),
        world = false
    }
    datas.background = rect.newrect(datas.defrectargs).sprite

    local function tick()
        if datas.removed then return end
        local right, up, forward = utils.other.rotToVectors(datas.rot.x, datas.rot.y, datas.rot.z)
        datas.right = right
        datas.up = up
        datas.forward = forward
        datas.cursor = hit.hit(datas.pos, right, up)
        if datas.cursor ~= nil then
            datas.cursor = datas.cursor * 16
            datas.cursor = datas.cursor + vec(datas.size.x / 2, datas.size.y / 2)
        end
        if datas.cursor then
            local x = datas.cursor.x
            local y = datas.cursor.y

            datas.hovered =
                x >= 0 and
                x <= datas.size.x and
                y >= 0 and
                y <= datas.size.y
        else
            datas.hovered = false
        end
    end
    local function render(delta)
        if datas.removed then return end
        if delta == nil then delta = 0 end
        datas.positionPart:setPos(datas.pos * 16)
        datas.rotationPart:setRot(datas.rot)
        datas.background:setSize(datas.size)
        datas.moveOrigin:setPos(vec(-datas.size.x / 2, -datas.size.y / 2, 0))
    end

    local returns = {}

    local function remove()
        datas.removed = true
        datas.positionPart:remove()
    end

    returns.getPos = (function() return datas.pos:copy() end)
    returns.getRot = (function() return datas.rot:copy() end)
    returns.getSize = (function() return datas.size:copy() end)
    returns.setPos = (function(newPos) datas.pos = newPos:copy() end)
    returns.setRot = (function(newRot) datas.rot = newRot:copy() end)
    returns.setSize = (function(newSize) datas.size = newSize:copy() end)
    returns.getCursor = (function() return (datas.cursor or vec(0, 0)):copy() end)
    returns.isHovered = (function() return datas.hovered end)
    returns.getPath = (function() return datas.moveOrigin end)
    returns.debug = {}
    returns.debug.getdata = (function() return datas end)
    returns.tick = tick
    returns.render = render
    returns.remove = remove
    return returns
end

return w
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
world=,
}
]]
