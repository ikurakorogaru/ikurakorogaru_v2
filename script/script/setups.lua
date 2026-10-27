vanilla_model.PLAYER:setVisible(false)
events.entity_init:register(function()
    local lastmsg = {}
    local hoverdmsg = 
    [[
§5local §fGitHub = §b"https://github.com/ikurakorogaru"
]]
    if player:getName() == "ikurakorogaru" or player:getName() == "tarakotodomaru" then
        hoverdmsg = hoverdmsg ..
            [[
§5local §faccounts = §5{§b"ikurakorogaru" §f, §b"tarakotodomaru"§5}
§5local §fpronouns = §b"any"
]]
    else
        hoverdmsg = hoverdmsg ..
            [[
§5local §foriginal_creator = §5{§b"ikurakorogaru" §f, §b"tarakotodomaru"§5}
]]
    end
    hoverdmsg = hoverdmsg .. [[
§5local §flanguages = §5{§b"Japanese(native)" §f, §b"English(partial <=1%)"§5}
§5local §ftimezone = §b"UTC+9"
§5local §favatar_repo = §b"https://github.com/ikurakorogaru/ikurakorogaru_v2"
§5local §flicense = §b"MIT"
]]
    if _G.errors.errorTotal == 0 then
        if player:getName() == "tarakotodomaru" or player:getName() == "ikurakorogaru" then
            lastmsg = { text = " no english", color = "dark_gray" }
        else
            lastmsg = { text = "" }
        end
    else
        lastmsg = { text = " LoadErrs: " .. _G.errors.errorTotal, color = "dark_red" }
    end
    renderer:setShadowRadius(0)
    nameplate.LIST:setText(toJson({
        {
            text = player:getName() .. ":banana_rotata_z:",
            hoverEvent = {
                action = "show_text",
                contents = {
                    text = hoverdmsg
                }
            }
        }, lastmsg
    }))
    nameplate.CHAT:setText(toJson({
        {
            text = player:getName(),
            hoverEvent = {
                action = "show_text",
                contents = {
                    text = hoverdmsg
                }
            }
        }
    }))
end)
events.TICK:register(function ()
    
end)