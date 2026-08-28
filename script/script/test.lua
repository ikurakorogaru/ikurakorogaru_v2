local hit = require("script.requires")["layer1"].hit
local errorhandler = require("script.requires")["layer3"].errorhandler
local rect = require("script.requires")["layer2"]["draw"].rect

events.world_render:register(function()
    if player:isLoaded() then
        errorhandler.errorhandler("hit_test", true, function()
            local nowpos = player:getPos()
            local origin = nowpos + vec(0, 0, 3)
            local right = vec(1, 0, 0)
            local up = vec(0, 1, 0)
            local hitresult = hit.hit(origin, right, up)





        end)
    end
end)
