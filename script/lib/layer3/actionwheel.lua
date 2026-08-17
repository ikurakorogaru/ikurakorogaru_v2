local aw = {}
local ping = require("script.lib.layer2.ping")
local clamp = require("script.lib.layer1.utils.number").clamp

function aw.setColor(to, color, alpha, lighten)
	local it = lighten and alpha or -alpha
	local nr = clamp(0, 1, color.x + it)
	local ng = clamp(0, 1, color.y + it)
	local nb = clamp(0, 1, color.z + it)
	to:setColor(color.x, color.y, color.z)
	to:setHoverColor(nr, ng, nb)
	to:setToggleColor(nr, ng, nb)
	return to
end

function aw.autoSync(action, saveto, def, delay)
	local now = ping.get(saveto)
end

return aw
