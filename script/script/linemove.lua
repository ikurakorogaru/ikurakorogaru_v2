local errorhandler = require("script.requires")["layer3"].errorhandler
local speed = 0.5
local keyForwand = keybinds:newKeybind("linemove-forwand", "key.keyboard.i", false)
local keyRight = keybinds:newKeybind("linemove-right", "key.keyboard.l", false)
local keyLeft = keybinds:newKeybind("linemove-left", "key.keyboard.j", false)
local keyBack = keybinds:newKeybind("linemove-back", "key.keyboard.k", false)
local keyUp = keybinds:newKeybind("linemove-up", "key.keyboard.u", false)
local keyDown = keybinds:newKeybind("linemove-down", "key.keyboard.o", false)
local keyFast = keybinds:newKeybind("linemove-fast", "key.keyboard.left.control", false)

events.TICK:register(function()
    errorhandler.errorhandler("linemove", true, true, function()
        local rot = player:getLookDir()

        local forward = vec(rot.x, 0, rot.z):normalized()
        local right = vec(-forward.z, 0, forward.x)
        local up = vec(0, 1, 0)

        local move = vec(0, 0, 0)
        local pressed = false

        if keyForwand:isPressed() then
            move = move + forward
            pressed = true
        end

        if keyBack:isPressed() then
            move = move - forward
            pressed = true
        end

        if keyRight:isPressed() then
            move = move + right
            pressed = true
        end

        if keyLeft:isPressed() then
            move = move - right
            pressed = true
        end

        if keyUp:isPressed() then
            move = move + up
            pressed = true
        end

        if keyDown:isPressed() then
            move = move - up
            pressed = true
        end
        if keyFast:isPressed() then
            move = move * 2
        end

        if pressed then
            speed = speed * 1.02

            if move:length() > 0 then
                move = move:normalized()
            end

            silly:setVelocity(move * speed)
        else
            speed = 0.5
        end
    end)
end)
