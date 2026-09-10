vanilla_model.PLAYER:setVisible(false)
events.entity_init:register(function()
    renderer:setShadowRadius(0)
    nameplate.LIST:setText(toJson({
        {
            text = player:getName(),
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
        }, {text = " no english", color = "dark_gray"}
    }))
end)
