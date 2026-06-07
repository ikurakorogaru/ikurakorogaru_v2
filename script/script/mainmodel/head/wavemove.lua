local gettick = require("script.requires")["layer1"]["tick"].gettick
local parts = {}
local groups = {}
for k1, v1 in ipairs(models.model.root.Head.headgroup.rotatepivot:getChildren()) do
	parts[k1] = {}
	groups[k1] = v1
	for k2, v2 in ipairs(v1:getChildren()) do
		parts[k1][k2] = {}
		for k3, v3 in ipairs(v2:getChildren()) do
			parts[k1][k2][k3] = v3
		end
	end
end

function events.tick()
	local t = gettick()
	for k1, v1 in ipairs(parts) do
		-- groups[k1]:setRot(0, (k1 % 2 * 2 - 1) * t, 0)
		for k2, v2 in ipairs(v1) do
			for k3, v3 in ipairs(v2) do
				local rotab = t / 10 + (k1 + k2 + k3)
				v3:setPos(math.sin(rotab) * 0.5, 0, math.cos(rotab) * 0.5)
				-- 	v3:setRot(rotab, -math.cos(rotab) * 90, math.sin(rotab) * 90)
			end
		end
	end
end
