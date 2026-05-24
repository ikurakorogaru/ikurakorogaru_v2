local newbutton = require("script.requires")["layer3"]["ui"]["button"].newbutton
local nb = nil
function events.entity_init()
	local pos = player:getPos()
	nb = newbutton({
		x = pos.x*16,
		y = pos.y*16,
		z = pos.z*16,
		h = 1,
		w = 1,
		yaw = 0,
		pitch = 0,
		roll = 0,
		stroke = 5,
		border = true,
		light = 15,
		path = "ui.test",
		onclick = (function() print("test.button:click") end),
		col = {
			inner = {
				x = 1,
				y = 1,
				z = 1,
			},
			outer = {
				x = 0.5,
				y = 0.5,
				z = 0.5,
			}
		},
	})
end
