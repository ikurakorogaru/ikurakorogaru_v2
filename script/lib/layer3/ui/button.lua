-- template
--[[
{
x=,
y=,
z=,
h=,
w=,
path=,
onclick=,
}
]] --

local b = {}
local newrect = require("script.lib.layer2.draw.rect")
local split = require("script.lib.layer1.utils.string").split
function b.newButton(inputs)
    local pos = models
    for k, v in ipairs(split(path, ".")) do
        pos = pos[v]
    end
    local part = pos:newPart()
end
