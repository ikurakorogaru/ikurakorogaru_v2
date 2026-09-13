local hit = require("script.requires")["layer1"].hit
local errorhandler = require("script.requires")["layer3"].errorhandler
local rect = require("script.requires")["layer2"]["draw"].rect
local ping = require("script.requires")["layer2"].ping
local window = require("script.requires")["layer4"].window

-- local cursor = rect.newrect({
--     path = "",
--     name = "test_cursor",
--     x = 0,
--     y = 0,
--     z = 0,
--     w = 16,
--     h = 16,
--     pitch = 0,
--     yaw = 0,
--     roll = 0,
--     col = vec(0.85, 0.85, 0.85),
--     light = 15
-- })
-- local hittestcursolX = cursor.positionPart:newText("test_X")
-- hittestcursolX:setPos(0, 8, 0)
-- hittestcursolX:setText("(testtext)\n2lines\n3lines\n4lines!!\n§cr§2g§1b  §bc§dm§ey§0k§r\nikurakorogaru\ntarakotodomaru\ntest.lua(hittest)")
-- hittestcursolX:setScale(0.2)
-- hittestcursolX:setAlignment("CENTER")
-- hittestcursolX:setOpacity(1)
local usewindow = nil
ping.set("command.test", function() return "aaaa" end,true)

events.ENTITY_INIT:register(function()
    errorhandler.errorhandler("test_window_init", true, function()
        usewindow = window.window({
            x = player:getPos().x,
            y = player:getPos().y,
            z = player:getPos().z,
            width = 100,
            height = 100,
            pitch = 0,
            yaw = 0,
            roll = 0,
            path = "",
            name = "test_window"
        })
    end)
end)
events.world_render:register(function()
    if player:isLoaded() then
        if ping.get("actionwheel.hittest") then
            errorhandler.errorhandler("hit_test", true, function()
                local nowpos = player:getPos()
                local origin = nowpos + vec(0, 0, 5)
                local right = vec(1, 0, 0)
                local up = vec(0, 1, 0)
                local hitresult = usewindow.getCursor()
            end)
        end
    end
end)
