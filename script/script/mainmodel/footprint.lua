local newrect = require("script.requires").layer2.draw.rect.newrect
local allrects = {}
allrects.rects = {}
local now = 1
for i = 1, 10 do
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
		col = vectors.vec(0.15, 0.15, 0.15),
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
		col = vectors.vec(0.05, 0.05, 0.05),
	})
end
events.tick:register(function()
	local speed = player:getVelocity()
	local speedAverage = math.sqrt(speed.x * speed.x + speed.z * speed.z)
	if player:isOnGround() then
		allrects.rects[now]:setVisible(true)
		allrects.strokes[now]:setVisible(true)
	else
		allrects.rects[now]:setVisible(false)
		allrects.strokes[now]:setVisible(false)
	end
	local nowpos = player:getPos()
	for k, v in pairs(allrects) do
		for k2, v2 in ipairs(v) do
			v2:setRot(v2:getRot():add(vectors.vec(0, math.random() * 2, 0)))
			v2:setPos(v2:getPos():add(vectors.vec((math.random() - 0.5) / 4, 0, (math.random() - 0.5) / 4)))
			v2:setScale(v2:getScale():mul(1.02, 1.02, 1))
		end
	end
	allrects.rects[now]:setPos(nowpos.x * 16, nowpos.y * 16 + 0.2, nowpos.z * 16)
	allrects.strokes[now]:setPos(nowpos.x * 16, nowpos.y * 16 + 0.1, nowpos.z * 16)
	allrects.rects[now]:setRot(90, math.random() * 360, 0)
	allrects.strokes[now]:setRot(90, math.random() * 360, 0)
	local mult = speedAverage * 4
	local rand = math.random() * math.pi
	allrects.rects[now]:setScale(math.floor(math.abs(math.sin(rand)) * 16) * mult,
		math.floor(math.abs(math.cos(rand)) * 16) * mult,
		1)
	rand = math.random() * math.pi
	allrects.strokes[now]:setScale(math.floor(math.abs(math.sin(rand)) * 16 + 1) * mult,
		math.floor(math.abs(math.cos(rand)) * 16 + 1) * mult,
		1)
	now = now % #allrects.rects + 1
end)
