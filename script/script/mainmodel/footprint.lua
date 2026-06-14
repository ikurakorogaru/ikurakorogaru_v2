local newrect = require("script.requires").layer2.draw.rect.newrect
local allrects = {}
allrects.rects = {}
local now = 1
for i = 1, 5 do
	allrects.rects[i] = newrect({
		path = "model.footprints",
		name = "footprint",
		x = 0,
		y = 0,
		z = 0,
		w = 1,
		h = 1,
		yaw = 0,
		pitch = 90,
		roll = 0,
		col = vectors.vec(0.75, 0.75, 0.75),
	})
end
allrects.strokes = {}
for i in pairs(allrects.rects) do
	allrects.strokes[i] = newrect({
		path = "model.footprints",
		name = "footprint",
		x = 0,
		y = 0,
		z = 0,
		w = 1,
		h = 1,
		yaw = 0,
		pitch = 90,
		roll = 0,
		col = vectors.vec(0.5, 0.5, 0.5),
	})
end
events.tick:register(function()
	if player:isOnGround() then
		allrects.rects[now]:setVisible(true)
		allrects.strokes[now]:setVisible(true)
	else
		allrects.rects[now]:setVisible(false)
		allrects.strokes[now]:setVisible(false)
	end
	local nowpos = player:getPos()
	allrects.rects[now]:setPos(nowpos.x * 16, nowpos.y * 16 + 0.2, nowpos.z * 16)
	allrects.strokes[now]:setPos(nowpos.x * 16, nowpos.y * 16 + 0.1, nowpos.z * 16)
	allrects.rects[now]:setRot(90, math.random() * 360, 0)
	allrects.strokes[now]:setRot(90, math.random() * 360, 0)
	local rand = math.random() * math.pi
	allrects.rects[now]:setScale(math.floor(math.abs(math.sin(rand)) * 16),math.floor( math.abs(math.cos(rand)) * 16), 1)
	rand = math.random() * math.pi
	allrects.strokes[now]:setScale(math.floor(math.abs(math.sin(rand)) * 16 + 1), math.floor(math.abs(math.cos(rand)) * 16 + 1), 1)
	now = now % #allrects.rects + 1
end)
