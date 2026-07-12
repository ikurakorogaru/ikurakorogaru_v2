local ping = require("script.requires").layer2.ping
local aw = require("script.requires").layer2.actionwheel
ping.setnum("actionwheel.pages", action_wheel:newPage(), true)
print(aw)
----- default -----
ping.setnum("mainmodel.footprint", true, true)
ping.setnum("mainmodel.headmove", true, true)

----- functions -----
function pings.footprint_Toggle(state) ping.setnum("mainmodel.footprint", state, true) end
function pings.headmove_Toggle(state) ping.setnum("mainmodel.headmove", state, true) end


----- actions -----
local buffer = ping.getnum("actionwheel.pages"):newAction()
buffer:setTitle("toggle footprint")
aw.setColor(buffer, vectors.vec(0.25, 0.25, 0.25), 0.2, true)
buffer:setItem("minecraft:feather")
buffer:setOnToggle(pings.footprint_Toggle)
ping.setnum("actionwheel.pages.footprint", buffer, true)

buffer = ping.getnum("actionwheel.pages"):newAction()
buffer:setTitle("toggle headmove")
aw.setColor(buffer, vectors.vec(1, 0.96, 0.66), 0.2, true)
buffer:setItem("minecraft:sponge")
buffer:setOnToggle(pings.headmove_Toggle)
ping.setnum("actionwheel.pages.headmove", buffer, true)
----- setpage -----
action_wheel:setPage(ping.getnum("actionwheel.pages"))
