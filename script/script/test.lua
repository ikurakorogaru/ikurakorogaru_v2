local newbutton = require("script.requires")["layer3"]["ui"]["button"].newbutton
local newwindow = require("script.requires")["layer3"]["ui"]["border"].newwindow

local nb = nil
local nw = nil
function events.entity_init()
	if false then
		local pos = player:getPos()
		nb = newbutton({
			x = pos.x * 16,
			y = (pos.y + 2) * 16,
			z = pos.z * 16,
			h = 5,
			w = 15,
			yaw = 0,
			pitch = 0,
			roll = 0,
			label = "button",
			labelsize = 0.25,
			stroke = 1,
			border = true,
			outline = true,
			light = 15,
			path = "ui.test",
			onclick = (function(a, b, c) print("testbutton:click" .. ":" .. a .. ":" .. b .. ":" .. c) end),
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
	if false then
		nw = newwindow({
			x = pos.x * 16,
			y = (pos.y + 2) * 16,
			z = (pos.z + 0.01) * 16,
			h = 10,
			w = 20,
			yaw = 0,
			pitch = 0,
			roll = 0,
			stroke = 1,
			light = 15,
			path = "ui.test",
			col = {
				inner = {
					x = 0.59375,
					y = 0.59375,
					z = 0.59375,
				},
				outer = {
					x = 0.2578125,
					y = 0.2578125,
					z = 0.2578125,
				}
			},
		})
	end
end
