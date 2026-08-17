local eh = {}
local ping = require("script.lib.layer2.ping")

function eh.errorhandler(id, func)
	local tryto, msg
	if ping.get("errorhandler." .. id) == nil then
		ping.set("errorhandler." .. id, {haserror = false, msg = ""})
	end
	if not ping.get("errorhandler." .. id).haserror then
		tryto, msg = pcall(func)
		if not tryto then
			ping.set("errorhandler." .. id, {haserror = true, msg = msg})
		end
	end
	return tryto, msg
end

return eh
