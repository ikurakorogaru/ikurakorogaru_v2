local directorys = {
	"script.script.setups",
	"script.script.test",
	"script.script.mainmodel.head.wavemove",
	"script.lib.external.patpat"
}
local errors = 0
for k, v in ipairs(directorys) do
	local tryto, msg = pcall(require, v)
	if not tryto then
		print(msg)
		errors = errors + 1
	end
end
if errors ~= 0 then
	print("errors: "..errors)
end