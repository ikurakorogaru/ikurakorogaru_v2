local eh = {}
local ping = require("script.lib.layer2.ping")

local errors = 0
_G.errors = _G.errors or {}
_G.errors.handler = { count = 0, msgs = {} }
function eh.errorhandler(id, printerr, stopScript, func)
	local tryto, msg
	if ping.get("errorhandler." .. id) == nil then
		ping.set("errorhandler." .. id, { haserror = false, msg = "" },
			true)
	end
	if (not ping.get("errorhandler." .. id).haserror) and stopScript then
		tryto, msg = pcall(func)
		if not tryto then
			ping.set("errorhandler." .. id, { haserror = true, msg = msg }, true)
			errors = errors + 1
			if printerr then
				if host:isHost() then
					_G.errors.handler.count = errors
					table.insert(_G.errors.handler.msgs, msg)
					print("§c(ErrorHandler) Error ID. " .. id .. ":")
					print(msg)
				end
			end
		end
	end
	return tryto, msg
end

function eh.errors()
	return errors
end

return eh
