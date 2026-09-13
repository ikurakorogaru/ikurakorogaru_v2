vanilla_model.PLAYER:setVisible(false)
events.entity_init:register(function()
    local lastmsg = {}
    if _G.errors.errorTotal == 0 then
        lastmsg = { text = " no english", color = "dark_gray" }
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
                    text = [[
GitHub: https://github.com/ikurakorogaru
accounts: ikurakorogaru , tarakotodomaru
languages: Japanese(native) , English(partial ≒1%)
                    ]]
                }
            }
        }, lastmsg
    }))
end)
