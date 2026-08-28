local ping = require("script.requires").layer2.ping
local aw = require("script.requires").layer3.actionwheel
ping.set("actionwheel.pages", action_wheel:newPage(), true)
----- default -----
ping.set("actionwheel.mainmodel.footprint", false, true)
ping.set("actionwheel.mainmodel.headmove", true, true)

----- functions -----
function pings.footprint_Toggle(state) ping.set("actionwheel.mainmodel.footprint", state, true) end
function pings.headmove_Toggle(state) ping.set("actionwheel.mainmodel.headmove", state, true) end
function pings.hittest_Toggle(state) ping.set("actionwheel.hittest", state, true) end

----- actions -----
local buffer = ping.get("actionwheel.pages"):newAction()
buffer:setTitle("toggle footprint")
aw.setColor(buffer, vectors.vec(0.25, 0.25, 0.25), 0.2, true)
buffer:setItem("minecraft:feather")
buffer:setOnToggle(pings.footprint_Toggle)
buffer:setToggled(ping.get("actionwheel.mainmodel.footprint"))
ping.set("actionwheel.pages.footprint", buffer, true)

buffer = ping.get("actionwheel.pages"):newAction()
buffer:setTitle("toggle headmove")
aw.setColor(buffer, vectors.vec(1, 0.96, 0.66), 0.2, true)
buffer:setItem("minecraft:sponge")
buffer:setOnToggle(pings.headmove_Toggle)
buffer:setToggled(ping.get("actionwheel.mainmodel.headmove"))
ping.set("actionwheel.pages.headmove", buffer, true)

buffer = ping.get("actionwheel.pages"):newAction()
buffer:setTitle("toggle hittest")
aw.setColor(buffer, vectors.vec(0.15,0.15,0.15), 0.2, true)
buffer:setItem("minecraft:arrow")
buffer:setOnToggle(pings.hittest_Toggle)
buffer:setToggled(ping.get("actionwheel.hittest"))
ping.set("actionwheel.hittest", buffer, true)
----- setpage -----
action_wheel:setPage(ping.get("actionwheel.pages"))