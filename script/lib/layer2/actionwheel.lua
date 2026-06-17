local aw = {}
local clamp = require("script.lib.layer1.utils.number").clamp

function aw.setcolor(to, color, alpha, lighten)
	local it = lighten and alpha or -alpha
	local nr = clamp(0, 1, color.x + it)
	local ng = clamp(0, 1, color.y + it)
	local nb = clamp(0, 1, color.z + it)
	to:setColor(color.x, color.y, color.z)
	to:setHoverColor(nr, ng, nb)
	return to
end
return aw