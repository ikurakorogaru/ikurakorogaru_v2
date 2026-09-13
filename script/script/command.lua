local ping = require("script.requires")["layer2"].ping
local errorhandler = require("script.requires")["layer3"].errorhandler
local stringutils = require("script.requires")["layer1"]["utils"]["string"]

function events.chat_send_message(msg)
    local args = stringutils.split(msg, " ")
    if args[1] == ";com" then
        table.remove(args, 1)
        local coms = ""
        local values = {}
        local outseg = false
        for k,v in ipairs(args) do
            if v == ";" then
                outseg = true
            else
                if outseg then
                    values[#values+1] = v
                end
                if not outseg then
                    coms = coms .. "." .. v
                end
            end
        end
        
        print(pcall(ping.get("command"..coms),table.unpack(values)))
    end
end