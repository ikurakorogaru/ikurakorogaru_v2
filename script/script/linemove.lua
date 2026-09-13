local errorhandler = require("script.requires")["layer3"].errorhandler
local lm = keybinds:newKeybind("linemove", "key.keyboard.z", false)
local speed = 0.5
events.TICK:register(function()
    errorhandler.errorhandler("linemove", true, function()
        if lm:isPressed() then
            speed = speed * 1.02
            local rot = player:getLookDir()
            silly:setVelocity(rot * speed / 1)
        else
            speed = 0.5
        end
    end)
end)
