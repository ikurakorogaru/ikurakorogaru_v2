--[[
{
x=,
y=,
z=,
width=,
height=,
up=,
right=,
path=,
name=,
}
]] --
local hit = require("script.lib.layer1.hit")
local errorhandler = require("script.lib.layer3.errorhandler")
local rect = require("script.lib.layer2.draw").rect
local split = require("script.lib.layer2.split")
local utils = {}
utils.other = require("script.lib.layer1.utils").other
local w = {}
function w.window(args)
    local path = split.split(args.path, ".")
    local windowpart = models
    local datas = {}
    local function tick()
        local right, up, forward = utils.other.rotToVectors(args.yaw, args.roll,
                                                            args.pitch)
        datas.rigth = right
        datas.up = up
        datas.forwand = forward
        datas.cursor = hit.hit(vec(args.x, args.y, args.z), right, up)
    end
    for k, v in ipairs(path) do windowpart = windowpart[v] end
    local returns = {}
    returns.getPos = (function() return windowpart:getPos() end)
    returns.tick = (function() tick() end)
    returns.getCursor = (function() return datas.cursor end)
    return returns
end

return w
