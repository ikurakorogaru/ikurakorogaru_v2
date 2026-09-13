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
    local path = split.split(args.path, ".")
    local windowpart = models
    local datas = {}
    datas.pos = vec(args.x, args.y, args.z)
    datas.rot = vec(args.pitch, args.yaw, args.roll)
    datas.width = args.width
    datas.height = args.height
    for k, v in ipairs(path) do
        if windowpart[v] == nil then windowpart:addPart(v) end
        windowpart = windowpart[v]
    end
    datas.path = windowpart
    local positionPart = datas.path:newPart(args.name, "WORLD")
    local rotationPart = positionPart:newPart(args.name .. "_rotation")
    datas.positionPart = positionPart
    datas.rotationPart = rotationPart
    datas.defrectargs = {
        path = args.path .. "." .. args.name .. "." .. args.name .. "_rotation",
        name = args.name,
        x = 0,
        y = 0,
        z = 0,
        w = args.width,
        h = args.height,
        pitch = 0,
        yaw = 0,
        roll = 0,
        col = vec(0.85, 0.85, 0.85),
        world = false
    }
    rect.newrect(datas.defrectargs)
    local function tick()
        local right, up, forward = utils.other.rotToVectors(datas.rot.x,
            datas.rot.y,
            datas.rot.z)
        datas.right = right
        datas.up = up
        datas.forward = forward
        datas.cursor = hit.hit(vec(datas.pos.x, datas.pos.y, datas.pos.z),
            right, up)
        if datas.cursor then
            local x = datas.cursor.x
            local y = datas.cursor.y

            datas.hovered =
                x >= 0 and
                x <= datas.width and
                y >= 0 and
                y <= datas.height
        else
            datas.hovered = false
        end
    end
    local function render(delta)
        if delta == nil then delta = 0 end
        datas.positionPart:setPos(datas.pos.x, datas.pos.y, datas.pos.z)
        datas.rotationPart:setRot(datas.rot.x, datas.rot.y, datas.rot.z)
    end

    local returns = {}
    returns.getPos = (function() return datas.pos:copy() end)
    returns.getRot = (function() return datas.rot:copy() end)
    returns.getCursor =
        (function() return (datas.cursor or vec(0, 0)):copy() end)
    returns.isHovered = (function() return true and datas.hovered end)
    returns.debug = {}
    returns.debug.getdata = (function() return utils.table.deepcopy(datas) end)
    returns.tick = tick
    returns.render = render
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
