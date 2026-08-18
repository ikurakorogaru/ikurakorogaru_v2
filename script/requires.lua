local directories = {
	["external"] = {
		["patpat"] = "script.lib.external.patpat",
	},
	["layer1"] = {
		["utils"] = {
			["string"] = "script.lib.layer1.utils.string",
			["table"] = "script.lib.layer1.utils.table",
			["number"] = "script.lib.layer1.utils.number",
		},
	},
	["layer2"] = {
		["ping"] = "script.lib.layer2.ping",
		["draw"] = {
			["rect"] = "script.lib.layer2.draw.rect",
		},
	},
	["layer3"] = {
		["actionwheel"] = "script.lib.layer3.actionwheel",
		["errorhandler"] = "script.lib.layer3.errorhandler",
	},
	["layer4"] = {
		["3dui"] = {
			["hit"] = "script.lib.layer4.3dui.hit",
		},
	},
}

local errortotal = 0
local function forallkeys(inptable, func)
	local outputs = {}
	for k, v in pairs(inptable) do
		if type(v) == "table" then
			outputs[k] = forallkeys(v, func)
		end
		if type(v) == "string" then
			outputs[k] = func(k, v)
		end
	end
	return outputs
end

directories = forallkeys(directories, function(k, v)
	local tryto, msg = pcall(require, v)
	if not tryto then
		if host:isHost() then
			errortotal = errortotal + 1
			print("§c(When loading) module Error ID. " .. v .. " : " .. k .. " :")
			print(msg)
		end
		return nil
	end
	if tryto then
		return msg
	end
end)

if host:isHost() then
	if errortotal ~= 0 then
		print("§c(When loading) module ERROR Total: " .. errortotal)
	end
end


return directories
