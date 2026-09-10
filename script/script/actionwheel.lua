local ping = require("script.requires").layer2.ping
local aw = require("script.requires").layer3.actionwheel
ping.set("actionwheel.pages", action_wheel:newPage(), true)
----- default -----
ping.set("actionwheel.mainmodel.headmove", true, true)
ping.set("actionwheel.hittest", true, true)
ping.set("actionwheel.hittest.respawn", false, true)
----- functions -----
function pings.headmove_Toggle(state) ping.set("actionwheel.mainmodel.headmove", state, true) end
function pings.hittest_Toggle(state) ping.set("actionwheel.hittest", state, true) end
function pings.hittest_respawn() ping.set("actionwheel.hittest.respawn", true, true) end
----- actions -----
local buffer = nil

buffer = ping.get("actionwheel.pages"):newAction()
buffer:setTitle("toggle headmove")
aw.setColor(buffer, vectors.vec(1, 0.96, 0.66), 0.2, true)
buffer:setItem("minecraft:sponge")
buffer:setOnToggle(pings.headmove_Toggle)
buffer:setToggled(ping.get("actionwheel.mainmodel.headmove"))
ping.set("actionwheel.pages.headmove", buffer, true)

buffer = ping.get("actionwheel.pages"):newAction()
buffer:setTitle("respawn hittest")
aw.setColor(buffer, vectors.vec(0.85,0.85,0.85), 0.2, true)
buffer:setItem("minecraft:arrow")
buffer:setOnExecute(pings.hittest_respawn)
ping.set("actionwheel.hittest.respawn", buffer, true)
----- setpage -----
action_wheel:setPage(ping.get("actionwheel.pages"))