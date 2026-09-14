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
local hittestcursolX = nil
local usewindow = nil
ping.set("command.test", function() return "aaaa" end, true)
ping.set("command.test.getcursor",
    (function() return tostring(usewindow.getCursor()) .. tostring(usewindow.isHovered()) end), true)
events.ENTITY_INIT:register(function()
    errorhandler.errorhandler("test_window_init", true, function()
        usewindow = window.window({
            x = player:getPos().x,
            y = player:getPos().y + 1.5,
            z = player:getPos().z,
            width = 16,
            height = 32,
            pitch = 30,
            yaw = 30,
            roll = 30,
            path = "model",
            name = "test_window"
        })
        hittestcursolX = models.model.test_window.test_window_rotation:newText("testcursoloverlay")
        hittestcursolX:setText("testext")
        hittestcursolX:setScale(0.2)
        hittestcursolX:setAlignment("CENTER")
        hittestcursolX:setOpacity(1)
    end)
end)
events.render:register(function(delta)
    if usewindow ~= nil then
        usewindow.render(delta)
        hittestcursolX:setText(tostring(usewindow.getCursor()) .. "\n" .. tostring(usewindow.isHovered()))
    end
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
events.TICK:register(function()
    if usewindow ~= nil then
        usewindow.tick()
    end
end)
