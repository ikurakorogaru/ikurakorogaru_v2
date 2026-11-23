vanilla_model.PLAYER:setVisible(false)
local olderrs = -1
events.TICK:register(function()
    if _G.errors.handler.count + _G.errors.errorTotal ~= olderrs then
        local lastmsg = {}
        local hoverdmsg =""
        if player:getName() == "ikurakorogaru" or player:getName() == "tarakotodomaru" then
            hoverdmsg = hoverdmsg ..
                [=[
§8-- my data
§5local §faccounts = §5{§b"ikurakorogaru" §f, §b"tarakotodomaru"§5}
§5local §fpronouns = §b"any"
§5local §flanguages = §5{§b"Japanese(native)" §8--[[, "English(partial <=1%)"]]§5}
§5local §ftimezone = §b"UTC+9"

§8-- licenses
]=]
        else
            hoverdmsg = hoverdmsg ..
                [=[
§5local §foriginal_creator = §5{§b"ikurakorogaru" §f, §b"tarakotodomaru"§5}
]=]
        end
        hoverdmsg = hoverdmsg .. [=[
§5local §flicense = §b"MIT"

§8-- others
§5local §favatar_repo = §b"https://github.com/ikurakorogaru/ikurakorogaru_v2"
]=]
        if _G.errors.errorTotal + _G.errors.handler.count == 0 then
            if player:getName() == "tarakotodomaru" or player:getName() == "ikurakorogaru" then
                lastmsg = { text = " iCantEngrish", color = "dark_gray" }
            else
                lastmsg = { text = "" }
            end
        else
            lastmsg = {
                text = " ScriptErrs: " .. _G.errors.errorTotal + _G.errors.handler.count,
                color =
                "dark_red"
            }
        end
        renderer:setShadowRadius(0)
        nameplate.LIST:setText(toJson({
            {
                text = player:getName() .. ":banana_rotata_z:",
                hoverEvent = {
                    action = "show_text",
                    contents = {
                        text = hoverdmsg,
                    },
                },
            }, lastmsg,
        }))
        nameplate.CHAT:setText(toJson({
            {
                text = player:getName(),
                hoverEvent = {
                    action = "show_text",
                    contents = {
                        text = hoverdmsg,
                    },
                },
            },
        }))
        olderrs = _G.errors.handler.count + _G.errors.errorTotal
    end
end)
