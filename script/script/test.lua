local setcolor = require("script.lib.layer2.actionwheel").setcolor
local page = action_wheel:newPage()
action_wheel:setPage(page)

local action = page:newAction()
action.leftClick = function()
	print("click")
end
action:item("minecraft:arrow")
action:title("aa")
setcolor(action, vectors.vec(0, 0, 0), 0.1, true)
