local directorys = {
	"script.script.setups",
	"script.lib.external.patpat",
	"script.script.mainmodel.head.wavemove",
	"script.script.mainmodel.footprint",
	"script.script.test",
}
local errors = 0
local errormsgs = {}
for k, v in ipairs(directorys) do
	local tryto, msg = pcall(require, v)
	if not tryto then
		errors = errors + 1
		errormsgs[errors] = msg
	end
end
events.entity_init:register(function()
	if host:isHost() then
		if errors ~= 0 then
			for i = 1, errors do
				print("§cError No." .. i .. ":")
				print(errormsgs[i])
			end
			print("§cERROR Total: " .. errors)
		end
	end
end)

return (function()
	return errors, errormsgs
end)
