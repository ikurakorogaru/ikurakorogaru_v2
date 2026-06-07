-- template
--[[
{
x=,
y=,
z=,
h=,
w=,
yaw=,
pitch=,
roll=,
label=,
labelsize=,
labeloutline=,
stroke=,
light=,
path=,
onclick=,
col={
inner={
x=,
y=,
z=,
},
outer={
x=,
y=,
z=,
},
labeloutline={
x=,
y=,
z=,
},
},
}
]] --

local b = {}
local clickfuncs = {}
local newrect = require("script.lib.layer2.draw.rect").newrect
local split = require("script.lib.layer1.utils.string").split
local merge = require("script.lib.layer1.utils.table").merge
function b.newbutton(inputs)
	inputs.stroke = inputs.stroke or 0
	local pos = models
	for k, v in ipairs(split(inputs.path, ".")) do
		pos = pos[v]
	end
	local partname = "button" .. math.random(1, 10000)
	local part = pos:newPart(partname, "WORLD")
	local opti = {
		path = inputs.path .. "." .. partname,
		yaw = inputs.yaw,
		pitch = inputs.pitch,
		roll = inputs.roll,
		light = inputs.light,
	}
	-- outer
	if inputs.border then
		newrect(
			merge(opti, {
				name = "button_outer",
				col = inputs.col.outer,
				x = inputs.x,
				y = inputs.y,
				z = inputs.z + 0.001,
				w = inputs.w + inputs.stroke * 2,
				h = inputs.h + inputs.stroke * 2,
			})
		)
	end
	-- inner
	newrect(
		merge(opti, {
			name = "button_inner",
			col = inputs.col.inner,
			x = inputs.x,
			y = inputs.y,
			z = inputs.z,
			w = inputs.w,
			h = inputs.h,
		})
	)
	local label = part:newText("button_label")
	label:setText(inputs.label)
	label:setOutline(inputs.labeloutline)
	if inputs.col.labeloutline ~= nil then
		label:setOutlineColor(inputs.col.labeloutline)
	else
		label:setOutlineColor(1, 1, 1)
	end
	label:setScale(inputs.labelsize)
	label:setPos(inputs.x, inputs.y + inputs.labelsize * 4, inputs.z - 0.001)
	label:setAlignment("CENTER")
	label:setLight(inputs.light)
	label:setRot(inputs.pitch, inputs.yaw, inputs.roll)
	clickfuncs[part] = inputs
	return part
end

function events.mouse_press(button, action, modifier)
	for k, v in pairs(clickfuncs) do
		local partpos = k:getPos()
		local eyePos = player:getPos() + vec(0, player:getEyeHeight(), 0)
		local eyeEnd = eyePos + (player:getLookDir() * 20)
		local hitLocation = { { vec(
			(v.x + v.w / 2 + v.stroke+partpos.x) / 16,
			(v.y + v.h / 2 + v.stroke+partpos.y) / 16,
			(v.z - 0.01+partpos.z) / 16
		), vec(
			(v.x - v.w / 2 - v.stroke+partpos.x) / 16,
			(v.y - v.h / 2 - v.stroke+partpos.y) / 16,
			(v.z + partpos.z) / 16
		) } }
		local aabb, hitPos, side, aabbHitIndex = raycast:aabb(eyePos, eyeEnd, hitLocation)
		if aabb ~= nil then
			v.onclick(button, action, modifier)
		end
	end
end

return b



--[[

]] --
