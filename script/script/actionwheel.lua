local ping = require("script.requires").layer2.ping
local aw = require("script.requires").layer3.actionwheel
ping.set("actionwheel.pages", action_wheel:newPage(), true)
----- default -----
ping.set("mainmodel.footprint", false, true)
ping.set("mainmodel.headmove", true, true)

----- functions -----
function pings.footprint_Toggle(state) ping.set("mainmodel.footprint", state, true) end
function pings.headmove_Toggle(state) ping.set("mainmodel.headmove", state, true) end


----- actions -----
local buffer = ping.get("actionwheel.pages"):newAction()
buffer:setTitle("toggle footprint")
aw.setColor(buffer, vectors.vec(0.25, 0.25, 0.25), 0.2, true)
buffer:setItem("minecraft:feather")
buffer:setOnToggle(pings.footprint_Toggle)
buffer:setToggled(ping.get("mainmodel.footprint"))
ping.set("actionwheel.pages.footprint", buffer, true)

buffer = ping.get("actionwheel.pages"):newAction()
buffer:setTitle("toggle headmove")
aw.setColor(buffer, vectors.vec(1, 0.96, 0.66), 0.2, true)
buffer:setItem("minecraft:sponge")
buffer:setOnToggle(pings.headmove_Toggle)
buffer:setToggled(ping.get("mainmodel.headmove"))
ping.set("actionwheel.pages.headmove", buffer, true)
----- setpage -----
action_wheel:setPage(ping.get("actionwheel.pages"))